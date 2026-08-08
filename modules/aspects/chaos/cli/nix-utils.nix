{ chaos, ... }:
{
  chaos.all.users.includes = [ chaos.cli.nix-utils ];

  chaos.cli.nix-utils = {
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
          nh
          nvd
        ];
      };
  };
}
