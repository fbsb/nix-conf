{ chaos, ... }:
{
  chaos.all._.hosts.includes = [ chaos.system._.network ];

  chaos.system._.network = {
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
