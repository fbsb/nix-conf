{ ... }:
{
  chaos.desktop.gnome.extensions.tiling-shell = {
    homeManager = { lib, pkgs, ... }: {
      programs.gnome-shell = {
        enable = true;
        extensions = [
          {
            package = pkgs.gnomeExtensions.tiling-shell;
          }
        ];
      };

      dconf.settings."org/gnome/shell/extensions/tilingshell" = {
        active-screen-edges = false;
        cycle-layouts-backward = [ "<Shift>" ];
        inner-gaps = lib.hm.gvariant.mkUint32 0;
        last-version-name-installed = "16.4";
        layouts-json = builtins.toJSON [
          {
            id = "Layout 1";
            tiles = [
              {
                x = 0;
                y = 0;
                width = 0.22;
                height = 0.5;
                groups = [
                  1
                  2
                ];
              }
              {
                x = 0;
                y = 0.5;
                width = 0.22;
                height = 0.5;
                groups = [
                  1
                  2
                ];
              }
              {
                x = 0.22;
                y = 0;
                width = 0.56;
                height = 1;
                groups = [
                  2
                  3
                ];
              }
              {
                x = 0.78;
                y = 0;
                width = 0.22;
                height = 0.5;
                groups = [
                  3
                  4
                ];
              }
              {
                x = 0.78;
                y = 0.5;
                width = 0.22;
                height = 0.5;
                groups = [
                  3
                  4
                ];
              }
            ];
          }
          {
            id = "Layout 2";
            tiles = [
              {
                x = 0;
                y = 0;
                width = 0.22;
                height = 1;
                groups = [ 1 ];
              }
              {
                x = 0.22;
                y = 0;
                width = 0.56;
                height = 1;
                groups = [
                  1
                  2
                ];
              }
              {
                x = 0.78;
                y = 0;
                width = 0.22;
                height = 1;
                groups = [ 2 ];
              }
            ];
          }
          {
            id = "Layout 3";
            tiles = [
              {
                x = 0;
                y = 0;
                width = 0.33;
                height = 1;
                groups = [ 1 ];
              }
              {
                x = 0.33;
                y = 0;
                width = 0.67;
                height = 1;
                groups = [ 1 ];
              }
            ];
          }
          {
            id = "Layout 4";
            tiles = [
              {
                x = 0;
                y = 0;
                width = 0.67;
                height = 1;
                groups = [ 1 ];
              }
              {
                x = 0.67;
                y = 0;
                width = 0.33;
                height = 1;
                groups = [ 1 ];
              }
            ];
          }
          {
            id = "756736";
            tiles = [
              {
                x = 0.333203125;
                y = 0;
                width = 0.33359374999999997;
                height = 1;
                groups = [
                  2
                  1
                ];
              }
              {
                x = 0.666796875;
                y = 0;
                width = 0.333203125;
                height = 1;
                groups = [ 2 ];
              }
              {
                x = 0;
                y = 0;
                width = 0.333203125;
                height = 1;
                groups = [ 1 ];
              }
            ];
          }
          {
            id = "794446";
            tiles = [
              {
                x = 0;
                y = 0;
                width = 0.333203125;
                height = 0.5;
                groups = [
                  1
                  4
                ];
              }
              {
                x = 0.333203125;
                y = 0;
                width = 0.33359374999999997;
                height = 1;
                groups = [
                  2
                  1
                ];
              }
              {
                x = 0.666796875;
                y = 0;
                width = 0.333203125;
                height = 0.5;
                groups = [
                  3
                  2
                ];
              }
              {
                x = 0.666796875;
                y = 0.5;
                width = 0.333203125;
                height = 0.4999999999999991;
                groups = [
                  3
                  2
                ];
              }
              {
                x = 0;
                y = 0.5;
                width = 0.333203125;
                height = 0.49999999999999867;
                groups = [
                  4
                  1
                ];
              }
            ];
          }
          {
            id = "1122272";
            tiles = [
              {
                x = 0;
                y = 0;
                width = 0.5;
                height = 1;
                groups = [ 1 ];
              }
              {
                x = 0.5;
                y = 0;
                width = 0.4999999999999976;
                height = 1;
                groups = [ 1 ];
              }
            ];
          }
        ];
        outer-gaps = lib.hm.gvariant.mkUint32 0;
        overridden-settings = builtins.toJSON {
          "org.gnome.mutter.keybindings" = {
            toggle-tiled-right = "['<Super>Right']";
            toggle-tiled-left = "['<Super>Left']";
          };
          "org.gnome.desktop.wm.keybindings" = {
            maximize = "['<Super>Up']";
            unmaximize = "['<Super>Down', '<Alt>F5']";
          };
        };
        selected-layouts = [
          [
            "1122272"
            "Layout 1"
          ]
          [
            "1122272"
            "Layout 1"
          ]
        ];
        snap-assistant-animation-time = lib.hm.gvariant.mkUint32 179;
        top-edge-maximize = false;
      };
    };
  };
}
