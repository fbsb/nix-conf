{
  chaos,
  inputs,
  ...
}:
{
  flake-file.inputs = {
    nix-flatpak = {
      url = "github:gmodena/nix-flatpak/?ref=latest";
    };
  };

  chaos.all.hosts.includes = [ chaos.system.flatpak ];

  chaos.system.flatpak = {
    nixos = { pkgs, ... }: {
      imports = [
        inputs.nix-flatpak.nixosModules.nix-flatpak
      ];

      xdg.portal = {
        enable = true;
        extraPortals = with pkgs; [
          xdg-desktop-portal-gtk
        ];
      };

      services.flatpak = {
        enable = true;

        packages = [
          "com.github.tchx84.Flatseal"
        ];

        update.auto = {
          enable = true;
          onCalendar = "daily";
        };

        uninstallUnmanaged = true;
      };
    };

    homeManager = {
      imports = [
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
      ];

      services.flatpak = {
        enable = true;

        update.auto = {
          enable = true;
          onCalendar = "daily";
        };

        uninstallUnmanaged = true;
      };
    };
  };
}
