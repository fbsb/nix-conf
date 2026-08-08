{
  chaos,
  ...
}:
{
  chaos.all.hosts.includes = [ chaos.apps.galaxy-buds-client ];

  chaos.apps.galaxy-buds-client = {
    nixos =
      {
        pkgs,
        ...
      }:
      {
        services.flatpak.packages = [
          "me.timschneeberger.GalaxyBudsClient"
        ];

        environment.systemPackages = [
          pkgs.earbuds
        ];
      };
  };
}
