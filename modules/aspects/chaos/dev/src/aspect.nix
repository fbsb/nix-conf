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

  chaos.all.users.includes = [ chaos.dev.src ];

  chaos.dev.src = {
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
