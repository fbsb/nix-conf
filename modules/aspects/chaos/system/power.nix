{ chaos, ... }:
{
  chaos.all._.hosts.includes = [ chaos.system._.power ];

  chaos.system._.power = {
    nixos = {
      powerManagement.enable = true;
      systemd.sleep.settings.Sleep = {
        AllowSuspend = true;
        AllowHibernation = true;
        AllowHybridSleep = true;
        AllowSuspendThenHibernate = true;
      };
      services.logind.settings.Login = {
        HandlePowerKey = "hibernate";
      };
    };
  };
}
