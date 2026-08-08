{ chaos, ... }:
{
  chaos.all.users.includes = [ chaos.ai.github-copilot ];

  chaos.ai.github-copilot = {
    homeManager = {
      programs.github-copilot-cli = {
        enable = true;
        settings = {
          autoUpdate = false;
          renderMarkdown = true;
          beep = false;
          ide.autoConnect = false;
          mergeStrategy = "rebase";
        };
      };
    };
  };
}
