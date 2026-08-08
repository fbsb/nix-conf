{ chaos, ... }:
{
  chaos.all.users.includes = [ chaos.ai.spec-kit ];
  chaos.ai.spec-kit = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = with pkgs; [
          spec-kit
        ];
      };
  };
}
