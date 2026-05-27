{ chaos, ... }:
{
  chaos.all._.users.includes = [ chaos.ai._.opencode ];
  chaos.ai._.opencode = {
    homeManager = {
      programs.opencode = {
        enable = true;
        settings = {
          autoshare = false;
          autoupdate = false;
        };
      };
    };
  };
}
