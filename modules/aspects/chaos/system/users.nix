{ chaos, ... }:
{
  chaos.all._.users.includes = [ chaos.system._.users ];
  chaos.system._.users =
    {
      user,
      ...
    }:
    {
      nixos = {
        users.mutableUsers = false;
        users.users.${user.userName} = {
          isNormalUser = true;
          description = user.description;
          initialHashedPassword = user.passwordHash;
        };
      };
    };
}
