{ ... }:
{
  chaos.desktop._.cosmic._.to-users = {
    homeManager = {
      services.gnome-keyring.enable = true;
    };
  };

  chaos.desktop._.cosmic = {
    nixos =
      {
        pkgs,
        ...
      }:
      {
        services.displayManager.cosmic-greeter.enable = true;
        services.desktopManager.cosmic.enable = true;
        services.desktopManager.cosmic.xwayland.enable = true;
        services.system76-scheduler.enable = true;

        services.gnome.gnome-keyring.enable = true;
        security.pam.services.login.enableGnomeKeyring = true;
        security.pam.services.greetd.enableGnomeKeyring = true;
        security.pam.services.greetd.fprintAuth = false;

        environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
        environment.sessionVariables.NIXOS_OZONE_WL = "1";

        programs.seahorse.enable = true;

        environment.systemPackages = with pkgs; [
          cosmic-ext-applet-caffeine
          cosmic-ext-applet-privacy-indicator
        ];
      };
  };
}
