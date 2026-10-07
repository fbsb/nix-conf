{
  chaos,
  inputs,
  ...
}:
{
  chaos.hardware.framework-13-amd-ai-300 = {
    includes = [
      chaos.hardware.laptop
      chaos.hardware.amd
      chaos.hardware.fingerprint
      chaos.hardware.sensors
      chaos.hardware.wifi
      chaos.hardware.framework.wifi-quirks
      chaos.hardware.fan-control
    ];
    nixos =
      { pkgs, ... }:
      {
        imports = [
          inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
        ];

        systemd.services.framework-preserve-battery-health = {
          description = "Preserve Framework battery health";
          wantedBy = [ "multi-user.target" ];
          after = [ "upower.service" ];
          requires = [ "upower.service" ];
          script = ''
            ${pkgs.systemd}/bin/busctl --system call org.freedesktop.UPower /org/freedesktop/UPower/devices/battery_BAT1 org.freedesktop.UPower.Device EnableChargeThreshold b true
            echo 90 > /sys/class/power_supply/BAT1/charge_control_end_threshold
          '';
          serviceConfig = {
            Type = "oneshot";
            RemainAfterExit = true;
          };
        };
      };
  };

  chaos.hardware.framework.wifi-quirks = {
    nixos = {
      networking = {
        networkmanager.wifi = {
          powersave = false;
        };
      };

      # Fix for mt7925e regulatory domain issues
      # Forces the WiFi card to use DE (Germany) regulatory domain
      boot.extraModprobeConfig = ''
        options cfg80211 ieee80211_regdom=DE
      '';
    };
  };
}
