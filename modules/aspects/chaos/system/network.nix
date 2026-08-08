{ chaos, ... }:
{
  chaos.all.hosts.includes = [ chaos.system.network ];

  chaos.system.network = {
    nixos = {
      networking = {
        networkmanager.enable = true;
        firewall = {
          enable = true;
          allowPing = true;
        };
      };

      services.resolved.enable = true;
    };
  };
}
