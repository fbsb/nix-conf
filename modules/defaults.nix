{ lib, ... }:
{
  den.default.includes = [
    {
      nixos.system.stateVersion = lib.mkDefault "25.11";
      homeManager.home.stateVersion = lib.mkDefault "25.11";
    }
  ];
}
