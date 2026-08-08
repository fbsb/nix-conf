{ chaos, ... }:
{
  chaos.all.users.includes = [ chaos.dev.nix-dev ];

  chaos.dev.nix-dev = {
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
