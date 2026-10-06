{ ... }:
{
  chaos.desktop.gnome.extensions.system-monitor-next = {
    homeManager = { pkgs, ... }: {
      programs.gnome-shell = {
        enable = true;
        extensions = [
          {
            package = pkgs.gnomeExtensions.system-monitor-next;
          }
        ];
      };

      dconf.settings."org/gnome/shell/extensions/system-monitor-next-applet" = {
        monitors = map builtins.toJSON [
          {
            uuid = "f4197efdbf5ece12ee044d1f6a77b292";
            type = "cpu";
            device = "all";
            display = true;
            style = "graph";
            graph-width = 50;
            refresh-time = 1500;
            show-text = true;
            show-menu = true;
            colors = {
              user = "#0072b3";
              system = "#0092e6";
              nice = "#00a3ff";
              iowait = "#002f3d";
              other = "#001d26";
            };
          }
          {
            uuid = "f3c1032a7cd4cc1b3188745b6a77b292";
            type = "freq";
            device = "all";
            display = false;
            style = "graph";
            graph-width = 100;
            refresh-time = 1500;
            show-text = false;
            show-menu = false;
            colors.freq = "#001d26";
            display-mode = "max";
          }
          {
            uuid = "e27fee4e8724424a00c960e16a77b292";
            type = "memory";
            device = "default";
            display = true;
            style = "graph";
            graph-width = 50;
            refresh-time = 5000;
            show-text = true;
            show-menu = true;
            colors = {
              program = "#00b35b";
              buffer = "#00ff82";
              cache = "#aaf5d0";
            };
          }
          {
            uuid = "09c44ab4ba1068bf2f4657346a77b292";
            type = "swap";
            device = "default";
            display = false;
            style = "graph";
            graph-width = 100;
            refresh-time = 5000;
            show-text = true;
            show-menu = true;
            colors.used = "#8b00c3";
          }
          {
            uuid = "82595e2366beb85ec0d2cbeb6a77b292";
            type = "net";
            device = "all";
            display = true;
            style = "graph";
            graph-width = 50;
            refresh-time = 1000;
            show-text = true;
            show-menu = true;
            colors = {
              down = "#fce94f";
              downerrors = "#ff6e00";
              up = "#fb74fb";
              uperrors = "#e0006e";
              collisions = "#ff0000";
            };
            speed-in-bits = true;
          }
          {
            uuid = "c205796c17756f75bb6a50416a77b292";
            type = "disk";
            device = "all";
            display = false;
            style = "graph";
            graph-width = 100;
            refresh-time = 2000;
            show-text = true;
            show-menu = true;
            colors = {
              read = "#c65000";
              write = "#ff6700";
            };
          }
          {
            uuid = "ae47ad7d8d321a6ade8d4dfa6a77b292";
            type = "gpu";
            device = "0";
            display = false;
            style = "graph";
            graph-width = 100;
            refresh-time = 5000;
            show-text = true;
            show-menu = true;
            colors = {
              used = "#00b35b";
              memory = "#00ff82";
            };
          }
          {
            uuid = "fc7b46f6dc3babf3de51aeea6a77b292";
            type = "thermal";
            device = "";
            display = false;
            style = "graph";
            graph-width = 100;
            refresh-time = 5000;
            show-text = true;
            show-menu = true;
            colors.tz0 = "#f2002e";
            fahrenheit-unit = false;
            threshold = 0;
          }
          {
            uuid = "fea69a09b4c16c2e1d3b2d2e6a77b292";
            type = "fan";
            device = "";
            display = false;
            style = "graph";
            graph-width = 100;
            refresh-time = 5000;
            show-text = true;
            show-menu = true;
            colors.fan0 = "#f2002e";
          }
          {
            uuid = "a98edf89ff3cebfd4cd840d16a77b292";
            type = "battery";
            device = "default";
            display = false;
            style = "digit";
            graph-width = 100;
            refresh-time = 5000;
            show-text = true;
            show-menu = false;
            colors.batt0 = "#f2002e";
            time = false;
            hidesystem = false;
          }
        ];
        settings-schema-version = 2;
      };
    };
  };
}
