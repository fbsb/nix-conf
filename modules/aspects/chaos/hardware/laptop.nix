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
      };

      systemd.sleep.settings.Sleep = {
        HibernateDelaySec = "30m";
      };
    };
  };
}
