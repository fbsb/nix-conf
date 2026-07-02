{
  den,
  chaos,
  ...
}:
let
  users = {
    fbsb = {
      description = "Fabian Sabau";
      gitEmail = "git@fbsb.dev";
      # nix run nixpkgs#mkpasswd -- -m scrypt
      passwordHash = "$7$CU..../....YeOtHgY4msMgJPCPkb4Qw/$/5T9x1RVcartjx0TjeHBwmdLwMVQuHcDHU46LUbtAq8";
      sshAuthorizedKeys = [ ];
      gpgKeys = [
        ./gpg_keys/fbsb.asc
      ];
    };
  };
in
{
  den.hosts.x86_64-linux.tars = {
    mainDisk = "/dev/nvme0n1";
    disko.swapSize = "72G";
    users = users;
  };
  den.hosts.x86_64-linux.case = {
    mainDisk = "/dev/nvme0n1";
    disko.swapSize = "32G";
    users = users;
  };

  den.aspects.tars.includes = [
    chaos.all._.hosts
    chaos.hardware._.workstation
    chaos.system._.keymap._.colemak
    chaos.desktop._.gnome
  ];

  den.aspects.case.includes = [
    chaos.all._.hosts
    chaos.hardware._.framework-13-amd-ai-300
    chaos.system._.keymap._.en-us-intl
    # chaos.desktop._.gnome
    chaos.desktop._.cosmic
  ];

  den.aspects.fbsb.includes = [
    chaos.all._.users
    den._.primary-user
  ];
}
