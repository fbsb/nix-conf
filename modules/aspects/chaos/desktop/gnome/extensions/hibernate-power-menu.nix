{ ... }:
{
  chaos.desktop.gnome.extensions.hibernate-power-menu = {
    homeManager = { pkgs, ... }: {
      programs.gnome-shell = {
        enable = true;
        extensions = [
          {
            package = pkgs.gnomeExtensions.hibernate-power-menu;
          }
        ];
      };

      dconf.settings."org/gnome/shell/extensions/hibernate-power-menu" = {
        show-hibernate = true;
        show-hybrid-sleep = true;
        hibernate-countdown = 60;
        hybrid-sleep-countdown = 60;
        skip-hibernate-dialog = false;
        skip-hybrid-sleep-dialog = true;
      };
    };
  };
}
