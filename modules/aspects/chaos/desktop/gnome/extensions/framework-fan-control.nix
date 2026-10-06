{ ... }:
{
  chaos.desktop.gnome.extensions.framework-fan-control = {
    homeManager = { pkgs, ... }: {
      programs.gnome-shell = {
        enable = true;
        extensions = [
          {
            package = pkgs.gnomeExtensions.framework-fan-control;
          }
        ];
      };
    };
  };
}
