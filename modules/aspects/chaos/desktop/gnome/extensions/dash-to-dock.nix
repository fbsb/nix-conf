{ ... }:
{
  chaos.desktop.gnome.extensions.dash-to-dock = {
    homeManager = { pkgs, ... }: {
      programs.gnome-shell = {
        enable = true;
        extensions = [
          {
            package = pkgs.gnomeExtensions.dash-to-dock;
          }
        ];
      };

      dconf.settings."org/gnome/shell/extensions/dash-to-dock" = {
        always-center-icons = true;
        apply-custom-theme = false;
        autohide = true;
        background-opacity = 1.0;
        custom-theme-shrink = false;
        dash-max-icon-size = 48;
        dock-fixed = false;
        dock-position = "BOTTOM";
        extend-height = false;
        height-fraction = 1.0;
        intellihide = false;
        intellihide-mode = "ALL_WINDOWS";
        isolate-workspaces = false;
        max-alpha = 0.8;
        preferred-monitor = -2;
        preferred-monitor-by-connector = "HDMI-1";
        preview-size-scale = 0.0;
        scroll-action = "do-nothing";
        show-windows-preview = false;
        transparency-mode = "FIXED";
      };
    };
  };
}
