{
  chaos,
  ...
}:
{
  chaos.hardware.laptop = {
    includes = [
      chaos.system.power
      chaos.hardware.bluetooth
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
