{ chaos, ... }:
{
  chaos.all._.hosts.includes = [ chaos.system._.boot._.grub ];

  chaos.system._.boot._.grub.nixos =
    {
      pkgs,
      ...
    }:
    {
      boot.loader.timeout = 15;
      boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.systemd-boot.enable = false;
      boot.loader.grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        enableCryptodisk = true;
        default = "saved";
        extraEntries = ''
          menuentry "UEFI Setup" {
            fwsetup
          }
        '';
      };
      environment.systemPackages = [ pkgs.efibootmgr ];
    };
}
