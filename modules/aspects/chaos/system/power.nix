{ chaos, ... }:
{
  chaos.all.hosts.includes = [ chaos.system.power ];

  chaos.system.power = {
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
