{ ... }:
{
  chaos.desktop.gnome.extensions.appindicator = {
    homeManager = { pkgs, ... }: {
      programs.gnome-shell = {
        enable = true;
        extensions = [
          {
            package = pkgs.gnomeExtensions.appindicator;
          }
        ];
      };
    };
  };
}
