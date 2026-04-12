{ chaos, ... }:
{
  chaos.all._.users.includes = [ chaos.shell._.bash ];

  chaos.shell._.bash = {
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
