{
  chaos,
  ...
}:
{
  chaos.all.hosts.includes = [ chaos.apps.zen-browser ];

  chaos.apps.zen-browser = {
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
