{ chaos, ... }:
{
  chaos.all._.hosts.includes = [ chaos.system._.unfree ];
  chaos.all._.users.includes = [ chaos.system._.unfree ];

  chaos.system._.unfree = {
    homeManager = {
      nixpkgs.config.allowUnfree = true;
    };
    nixos = {
      nixpkgs.config.allowUnfree = true;
    };
  };
}
