{ ... }:
{
  chaos.desktop.gnome.extensions.blur-my-shell = {
    homeManager = { pkgs, ... }: {
      programs.gnome-shell = {
        enable = true;
        extensions = [
          {
            package = pkgs.gnomeExtensions.blur-my-shell;
          }
        ];
      };

      dconf.settings = {
        "org/gnome/shell/extensions/blur-my-shell" = {
          rounded-blur-found = false;
          settings-version = 2;
        };
        "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
          brightness = 0.6;
          sigma = 30;
        };
        "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
          blur = true;
          brightness = 0.6;
          sigma = 30;
          static-blur = true;
          style-dash-to-dock = 0;
        };
        "org/gnome/shell/extensions/blur-my-shell/panel" = {
          brightness = 0.6;
          sigma = 30;
        };
        "org/gnome/shell/extensions/blur-my-shell/window-list" = {
          brightness = 0.6;
          sigma = 30;
        };
      };
    };
  };
}
