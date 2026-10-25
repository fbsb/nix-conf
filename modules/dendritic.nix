{
  inputs,
  lib,
  ...
}:
{
  flake-file.inputs.flake-file.url = lib.mkForce "github:denful/flake-file";
  flake-file.inputs.den.url = lib.mkForce "github:denful/den/latest";

  imports = [
    (inputs.den.namespace "chaos" true)

    (inputs.flake-file.flakeModules.dendritic or { })
    (inputs.den.flakeModules.dendritic or { })
  ];
}
