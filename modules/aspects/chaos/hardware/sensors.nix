{
  chaos.hardware._.sensors = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          lm_sensors
        ];
      };
  };
}
