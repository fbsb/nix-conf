{ ... }: {
  chaos.desktop.kde.nixos = { pkgs, ... }: {
    # Enable Plasma
    services = {
      desktopManager.plasma6.enable = true;

      # Default display manager for Plasma
      displayManager.plasma-login-manager.enable = true;

    };
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    environment.systemPackages = with pkgs.kdePackages; [
      ark
      isoimagewriter
      kalk
      kamoso
      kcalc
      kcharselect
      kmix
      skanlite
      skanpage
      ksystemlog
      calindori
      kbackup
      filelight
    ];
  };
}
