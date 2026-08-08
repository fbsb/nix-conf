{ chaos, ... }:
{
  chaos.all.users.includes = [ chaos.shell.bash ];

  chaos.shell.bash = {
    homeManager = {
      programs.bash = {
        enable = true;
        enableCompletion = true;
        enableVteIntegration = true;
        historyControl = [ "ignoreboth" ];
      };
    };
  };
}
