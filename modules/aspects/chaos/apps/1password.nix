{
  chaos,
  ...
}:
{
  chaos.all.users.includes = [ chaos.apps."1password" ];

  chaos.apps."1password" = {
    nixos = {
      programs._1password.enable = true;
      programs._1password-gui.enable = true;
    };
  };
}
