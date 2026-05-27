{ chaos, ... }:
{
  chaos.all._.users.includes = [ chaos.ai._.github-copilot ];

  chaos.ai._.github-copilot = {
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
