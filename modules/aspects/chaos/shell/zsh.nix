{
  chaos,
  den,
  ...
}:
{
  chaos.all._.users.includes = [ chaos.shell._.zsh._.default ];

  chaos.shell._.zsh._.default = {
    includes = [
      (den._.user-shell "zsh")
      chaos.shell._.zsh
    ];
  };

  chaos.shell._.zsh = {
    homeManager =
      {
        config,
        pkgs,
        ...
      }:
      {
        programs.zsh = {
          enable = true;
          autocd = true;

          dotDir = "${config.xdg.configHome}/zsh";

          enableCompletion = true;
          enableVteIntegration = true;

          history = {
            share = true;
            path = "${config.xdg.dataHome}/zsh/zsh_history";
            extended = true;
            save = 100000;
            size = 100000;
            expireDuplicatesFirst = true;
            ignoreDups = true;
            ignoreSpace = true;
          };

          plugins = [
            {
              name = "zsh-autosuggestions";
              file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
              src = pkgs.zsh-autosuggestions;
            }
            {
              name = "zsh-command-time";
              src = pkgs.zsh-command-time;
            }
            {
              name = "zsh-you-should-use";
              src = pkgs.zsh-you-should-use;
            }
          ];

          oh-my-zsh = {
            enable = true;
            plugins = [
              "git"
              "history"
            ];
          };
        };
      };
  };
}
