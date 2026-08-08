{ den, ... }:
{
  chaos.all.hosts = {
    includes = [
      den.batteries.hostname
    ];
  };

  chaos.all.users = {
    includes = [
      den.batteries.define-user
    ];
  };
}
