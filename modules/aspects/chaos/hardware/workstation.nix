{ chaos, ... }:
{
  chaos.hardware.workstation = {
    includes = [
      chaos.hardware.firmware
      chaos.hardware.amd.cpu
      chaos.hardware.nvidia
      chaos.hardware.sensors
    ];
  };
}
