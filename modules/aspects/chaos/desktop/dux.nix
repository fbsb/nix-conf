{ lib, ... }: {
  chaos.desktop.dux = {
    nixos = { pkgs, ... }: {
      programs.niri.enable = true;
      environment.sessionVariables.NIXOS_OZONE_WL = "1";

      programs.dux-shell = {
        enable = true;

        systemd = {
          enable = true;
          restartIfChanged = true;
        };
      };
      programs.dux-files = {
        enable = true;
        portal.enable = true;
        systemd.enable = true;
      };
      programs.dux-search = {
        enable = true;
        systemd.enable = true;
      };
      programs.dux-calendar = {
        enable = true;
        systemd.enable = true;
      };

      systemd.user.services.dms.environment = {
        QT_QPA_PLATFORMTHEME = "generic";
        QT_QPA_PLATFORMTHEME_QT6 = "generic";
      };

      security.polkit.enable = true;
      services.gnome.gnome-keyring.enable = true;
      services.gvfs.enable = true;
      services.gnome.sushi.enable = true;
      environment.systemPackages = with pkgs; [
        nautilus
      ];
      security.pam.services.greetd.enableGnomeKeyring = true;
      security.pam.services.greetd.fprintAuth = true;

      services.displayManager.dux-greeter = {
        enable = true;
        compositor.name = "niri";
      };

      services.displayManager.defaultSession = "niri";

      services.power-profiles-daemon.enable = true;
      services.upower.enable = true;
    };
  };

  chaos.desktop.dux.config = {
    homeManager = {
      # Recursively map files under dux to config entries, preserving relative paths.
      xdg.configFile = lib.listToAttrs (
        map (
          source:
          lib.nameValuePair (lib.removePrefix "${toString ./dux}/" (toString source)) {
            inherit source;
          }
        ) (lib.filesystem.listFilesRecursive ./dux)
      );
    };
  };
}
