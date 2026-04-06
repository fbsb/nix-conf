{
  den,
  __findFile ? __findFile,
  ...
}:
let
  users = {
    fbsb = {
      description = "Fabian Sabau";
      gitEmail = "git@fbsb.dev";
      # nix run nixpkgs#mkpasswd -- -m scrypt
      passwordHash = "$7$CU..../....YeOtHgY4msMgJPCPkb4Qw/$/5T9x1RVcartjx0TjeHBwmdLwMVQuHcDHU46LUbtAq8";
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
    <chaos/system/disko>
    <chaos/hardware/workstation>
    <chaos/system/keymap/colemak>
    <chaos/desktop/gnome>
  ];

  den.aspects.case.includes = [
    <chaos/system/disko>
    <chaos/hardware/framework-13-amd-ai-300>
    <chaos/system/keymap/en-us-intl>
    <chaos/desktop/gnome>
  ];

  den.aspects.fbsb.includes = [
    <chaos/common>
    <den/primary-user>
    <chaos/shell/zsh>
    <chaos/apps/all>
    <chaos/virtualisation/vmware>
  ];

  den.default.includes = [
    <chaos/build-vm>
    <my/state-version>
    <chaos/system/unfree>
  ];
}
