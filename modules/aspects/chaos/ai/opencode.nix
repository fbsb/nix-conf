{ chaos, ... }:
{
  chaos.all.users.includes = [ chaos.ai.opencode ];
  chaos.ai.opencode = {
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
