{
  chaos,
  ...
}:
{
  # 1password is broken on unstable
  # chaos.all._.users.includes = [ chaos.apps._."1password" ];

  chaos.apps._."1password" = {
    nixos = {
      programs._1password.enable = true;
      programs._1password-gui.enable = true;
    };
  };
}
