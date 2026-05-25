{
  inputs,
  lib,
  ...
}:
{
  flake-file.inputs.flake-file.url = lib.mkForce "github:vic/flake-file";
  flake-file.inputs.den.url = lib.mkForce "github:vic/den?ref=v0.17.0";

  imports = [
    (inputs.den.namespace "chaos" true)

    (inputs.flake-file.flakeModules.dendritic or { })
    (inputs.den.flakeModules.dendritic or { })
  ];
}
