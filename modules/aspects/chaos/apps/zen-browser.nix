{
  chaos,
  ...
}:
{
  chaos.all._.hosts.includes = [ chaos.apps._.zen-browser ];

  chaos.apps._.zen-browser = {
    nixos = {
      services.flatpak = {
        packages = [
          "app.zen_browser.zen"
        ];
      };

      # TODO: add config, extensions, etc.
    };
  };
}
