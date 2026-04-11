{ chaos, ... }:
{
  chaos.all._.users.includes = [ chaos.cli._.nix-utils ];

  chaos.cli._.nix-utils = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        programs.nix-index = {
          enable = true;
          enableZshIntegration = true;
        };

        home.packages = with pkgs; [
          comma
        ];
      };
  };
}
