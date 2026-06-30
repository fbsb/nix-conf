{
  chaos,
  ...
}:
{
  chaos.hardware._.laptop = {
    includes = [
      chaos.system._.power
      chaos.hardware._.bluetooth
    ];
    nixos = {
      services.logind.settings.Login = {
        HandleLidSwitch = "suspend-then-hibernate";
        IdleAction = "suspend-then-hibernate";
        IdleActionSec = "15min";
      };

      systemd.sleep.settings.Sleep = {
        HibernateDelaySec = "30m";
      };
    };
  };
}
