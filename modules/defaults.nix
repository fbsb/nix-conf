{ lib, ... }:
{
  den.default.includes = [
    {
      nixos.system.stateVersion = lib.mkDefault "25.11";
      nixos.home-manager.backupFileExtension = lib.mkDefault "bak";
      homeManager.home.stateVersion = lib.mkDefault "25.11";
      homeManager.home.mutableFiles = lib.mkDefault true;
    }
  ];
}
