{ chaos, ... }:
{
  chaos.hardware._.workstation = {
    includes = [
      chaos.hardware._.firmware
      chaos.hardware._.amd._.cpu
      chaos.hardware._.nvidia
      chaos.hardware._.sensors
    ];
  };
}
