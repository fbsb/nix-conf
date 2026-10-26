{ lib, ... }: {
  chaos.desktop.dms = {
    nixos = {
      programs.niri.enable = true;

      programs.dms-shell = {
        enable = true;

        systemd = {
          enable = true;
          restartIfChanged = true;
        };
      };

      security.polkit.enable = true;
      services.gnome.gnome-keyring.enable = true;
      security.pam.services.gdm-password.enableGnomeKeyring = true;
      security.pam.services.greetd.fprintAuth = true;

      services.displayManager.gdm.enable = true;
      services.displayManager.defaultSession = "niri";
    };
  };

  chaos.desktop.dms.config = {
    homeManager = {
      # Recursively map files under dms to config entries, preserving relative paths.
      xdg.configFile = lib.listToAttrs (
        map (
          source:
          lib.nameValuePair (lib.removePrefix "${toString ./dms}/" (toString source)) {
            inherit source;
          }
        ) (lib.filesystem.listFilesRecursive ./dms)
      );
    };
  };
}
