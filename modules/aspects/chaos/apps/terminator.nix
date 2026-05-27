{ chaos, ... }:
{
  chaos.all._.users.includes = [ chaos.apps._.terminator ];
  chaos.apps._.terminator = {
    homeManager = {
      programs.terminator = {
        enable = true;
        config = {
          keybindings = {
            new_tab = "<Alt>t";
            split_horiz = "<Alt>s";
            split_vert = "<Shift><Alt>s";
          };
        };
      };
    };
  };
}
