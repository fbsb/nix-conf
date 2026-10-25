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
      xdg.configFile = {
        "niri/config.kdl" = {
          source = ./dms/niri/config.kdl;
        };
        "niri/dms-static" = {
          source = ./dms/niri/dms-static;
          recursive = true;
        };
      }
      // lib.mapAttrs' (
        name: _:
        lib.nameValuePair "DankMaterialShell/${name}" {
          source = ./dms/DankMaterialShell/${name};
        }
      ) (lib.filterAttrs (_: type: type == "regular") (builtins.readDir ./dms/DankMaterialShell));
    };
  };
}
