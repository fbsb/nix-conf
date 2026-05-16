{
  chaos,
  lib,
  ...
}:
{
  chaos.all._.hosts.includes = [ chaos.system._.utils ];

  chaos.system._.utils = {
    nixos =
      { pkgs, ... }:
      {
        programs.partition-manager.enable = lib.mkDefault true;

        programs.neovim.defaultEditor = true;
        programs.neovim.enable = true;

        environment.systemPackages = with pkgs; [
          age
          btrfs-progs
          dasel
          disko
          git
          btop
          htop
          usbutils
          pciutils
          lshw
          jq
          sops
          ssh-to-age
          tree
          util-linux
          yq-go
          psmisc
          tio
        ];
      };
  };
}
