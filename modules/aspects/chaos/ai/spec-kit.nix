{ chaos, ... }:
{
  chaos.all._.users.includes = [ chaos.ai._.spec-kit ];
  chaos.ai._.spec-kit = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          spec-kit
        ];
      };
  };
}
