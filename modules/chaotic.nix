{ inputs, ... }:
{
  imports = [
    inputs.chaotic.modules.flake.nh

    (inputs.den.namespace "chaotic" [ inputs.chaotic ])
  ];

  flake-file.inputs = {
    chaotic.url = "github:fbsb/chaotic";
    chaotic.inputs = {
      den.follows = "den";
      nixpkgs.follows = "nixpkgs";
      home-manager.follows = "home-manager";
      flake-file.follows = "flake-file";
      flake-parts.follows = "flake-parts";
      import-tree.follows = "import-tree";
    };
  };
}
