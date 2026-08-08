{ chaos, ... }:
let
  # Derive per-key info (SSH pubkey lines + auth-subkey keygrips) by importing
  # each armored pubkey file into a throwaway GNUPGHOME and asking gpg.
  # This is import-from-derivation: evaluation will build a tiny derivation
  # per key. Keeps the keygrip out of the user's static config.
  gpgKeyInfo =
    pkgs: keyFile:
    pkgs.runCommand "gpg-key-info"
      {
        nativeBuildInputs = [ pkgs.gnupg ];
        src = keyFile;
      }
      ''
        export GNUPGHOME=$(mktemp -d)
        gpg --quiet --batch --import "$src"

        mkdir -p $out

        # Auth-capable subkey fingerprints (capability column contains 'a').
        fps=$(gpg --with-colons --with-fingerprint --with-fingerprint --list-keys \
          | awk -F: '
              /^sub:/  { auth = ($12 ~ /a/) }
              /^fpr:/  { if (auth) { print $10; auth = 0 } }
            ')

        : > $out/ssh-keys
        for fp in $fps; do
          gpg --export-ssh-key "$fp!" >> $out/ssh-keys
        done

        gpg --with-colons --with-keygrip --list-keys \
          | awk -F: '
              /^sub:/ { auth = ($12 ~ /a/) }
              /^grp:/ { if (auth) { print $10; auth = 0 } }
            ' > $out/keygrips
      '';

  readLines =
    file:
    builtins.filter (s: s != "") (
      builtins.filter builtins.isString (builtins.split "\n" (builtins.readFile file))
    );

  perUserKeys =
    pkgs: user:
    let
      infos = map (k: gpgKeyInfo pkgs k) (user.gpgKeys or [ ]);
    in
    {
      sshAuthorizedKeys = builtins.concatMap (i: readLines "${i}/ssh-keys") infos;
      sshKeygrips = builtins.concatMap (i: readLines "${i}/keygrips") infos;
    };
in
{
  chaos.all.users.includes = [
    chaos.cli.gpg
    chaos.cli.gpg-keys
  ];

  chaos.cli.gpg = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        programs.gpg = {
          enable = true;

          mutableKeys = false;
          mutableTrust = false;

          settings = {
            personal-cipher-preferences = "AES256 AES192 AES";
            personal-digest-preferences = "SHA512 SHA384 SHA256";
            personal-compress-preferences = "ZLIB BZIP2 ZIP Uncompressed";
            default-preference-list = "SHA512 SHA384 SHA256 AES256 AES192 AES ZLIB BZIP2 ZIP Uncompressed";
            cert-digest-algo = "SHA512";
            s2k-digest-algo = "SHA512";
            s2k-cipher-algo = "AES256";

            charset = "utf-8";
            keyid-format = "0xlong";
            list-options = "show-uid-validity";
            verify-options = "show-uid-validity";

            fixed-list-mode = true;
            ignore-time-conflict = true;
            no-comments = true;
            no-emit-version = true;
            no-greeting = true;
            no-symkey-cache = true;
            require-cross-certification = true;
            use-agent = true;
          };
        };

        services.gpg-agent = {
          enable = true;

          pinentry.package = pkgs.pinentry-qt;

          enableScDaemon = true;
          enableSshSupport = true;

          maxCacheTtl = 3600;
          maxCacheTtlSsh = 3600;
          defaultCacheTtl = 600;
          defaultCacheTtlSsh = 600;
        };
      };
  };

  chaos.cli.gpg-keys = {
    homeManager =
      { pkgs, user, ... }:
      let
        keys = perUserKeys pkgs user;
      in
      {
        programs.gpg.publicKeys = map (source: {
          inherit source;
          trust = "ultimate";
        }) (user.gpgKeys or [ ]);

        services.gpg-agent.sshKeys = keys.sshKeygrips;
      };

    nixos =
      { pkgs, user, ... }:
      let
        keys = perUserKeys pkgs user;
      in
      {
        users.users.${user.userName}.openssh.authorizedKeys.keys = keys.sshAuthorizedKeys;
      };
  };
}
