{ lib, ... }:
{
  flake-file.inputs = {
    home-manager = {
      # url = "github:nix-community/home-manager/release-25.11";
      # url = "github:nix-community/home-manager";
      url = "github:fbsb/home-manager/mutable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # enable hm by default
  den.schema.user.classes = lib.mkDefault [ "homeManager" ];
}
