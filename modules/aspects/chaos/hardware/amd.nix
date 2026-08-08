{
  chaos,
  inputs,
  ...
}:
{
  chaos.hardware.amd = {
    includes = [
      chaos.hardware.firmware
      chaos.hardware.amd.cpu
      chaos.hardware.amd.gpu
    ];
  };

  chaos.hardware.amd.cpu = {
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

  chaos.hardware.amd.gpu = {
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
