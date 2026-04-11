{
  chaos,
  inputs,
  ...
}:
{
  chaos.hardware._.amd = {
    includes = [
      chaos.hardware._.firmware
      chaos.hardware._.amd._.cpu
      chaos.hardware._.amd._.gpu
    ];
  };

  chaos.hardware._.amd._.cpu = {
    nixos = {
      imports = [
        inputs.nixos-hardware.nixosModules.common-cpu-amd
        inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate
        inputs.nixos-hardware.nixosModules.common-cpu-amd-zenpower
      ];
      # TODO check if microcode-amd is still broken
      # hardware.firmware = with pkgs; [
      #   microcode-amd
      # ];
    };
  };

  chaos.hardware._.amd._.gpu = {
    nixos =
      {
        pkgs,
        ...
      }:
      {
        imports = [
          inputs.nixos-hardware.nixosModules.common-gpu-amd
        ];
        environment.systemPackages = with pkgs; [
          amdgpu_top
          nvtopPackages.amd
        ];

        hardware.amdgpu = {
          opencl.enable = true;
          initrd.enable = true;
        };
      };
  };

}
