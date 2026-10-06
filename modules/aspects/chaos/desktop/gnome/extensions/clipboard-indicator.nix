{ ... }:
{
  chaos.desktop.gnome.extensions.clipboard-indicator = {
    homeManager = { pkgs, ... }: {
      programs.gnome-shell = {
        enable = true;
        extensions = [
          {
            package = pkgs.gnomeExtensions.clipboard-indicator;
          }
        ];
      };
    };
  };
}
