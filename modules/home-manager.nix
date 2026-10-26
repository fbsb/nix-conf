{ lib, inputs, ... }:
{
  flake-file.inputs = {
    home-manager = {
      # url = "github:nix-community/home-manager/release-25.11";
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hm-mutable = {
      url = "github:fbsb/hm-mutable";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  # enable hm by default
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];
  den.default.homeManager = {
    imports = [ inputs.hm-mutable.homeManagerModules.default ];
    home.mutableFiles = lib.mkDefault true;
  };
}
