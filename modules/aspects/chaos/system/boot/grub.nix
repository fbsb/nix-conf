{ chaos, ... }:
{
  chaos.all.hosts.includes = [ chaos.system.boot.grub ];

  chaos.system.boot.grub.nixos =
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
        gfxmodeEfi = "1920x1080";
        gfxpayloadEfi = "keep";
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
