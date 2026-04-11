{
  chaos,
  ...
}:
{
  chaos.all._.hosts.includes = [ chaos.apps._.galaxy-buds-client ];

  chaos.apps._.galaxy-buds-client = {
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
