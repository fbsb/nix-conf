{ chaos, ... }:
{
  chaos.all.hosts.includes = [ chaos.system.unfree ];
  chaos.all.users.includes = [ chaos.system.unfree ];

  chaos.system.unfree = {
    homeManager = {
      nixpkgs.config.allowUnfree = true;
    };
    nixos = {
      nixpkgs.config.allowUnfree = true;
    };
  };
}
