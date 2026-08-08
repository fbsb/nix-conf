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
    chaos.all.hosts
    chaos.hardware.workstation
    chaos.system.keymap.colemak
    chaos.desktop.gnome
  ];

  den.aspects.case.includes = [
    chaos.all.hosts
    chaos.hardware.framework-13-amd-ai-300
    chaos.system.keymap.en-us-intl
    chaos.desktop.kde
  ];

  den.aspects.fbsb.includes = [
    chaos.all.users
    den.batteries.primary-user
  ];
}
