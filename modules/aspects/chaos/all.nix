{ den, ... }:
{
  chaos.all._.hosts = {
    includes = [
      den._.hostname
    ];
  };

  chaos.all._.users = {
    includes = [
      den._.define-user
    ];
  };
}
