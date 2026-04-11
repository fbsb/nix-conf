{ chaos, ... }:
{
  chaos.all._.users.includes = [ chaos.dev._.nix-dev ];

  chaos.dev._.nix-dev = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        home.packages = with pkgs; [
          nixfmt
          treefmt
          nixd
        ];
      };
  };
}
