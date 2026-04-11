{
  chaos,
  den,
  ...
}:
let
  mkSrc = pkgs: pkgs.callPackage ./_package.nix { };
in
{
  perSystem =
    {
      pkgs,
      ...
    }:
    {
      packages.src = mkSrc pkgs;
    };

  chaos.all._.users.includes = [ chaos.dev._.src ];

  chaos.dev._.src = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = [
          (mkSrc pkgs)
        ];
      };
  };
}
