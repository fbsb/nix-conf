{
  chaos,
  inputs,
  ...
}:
{
  chaos.hardware._.framework-13-amd-ai-300 = {
    includes = [
      chaos.hardware._.laptop
      chaos.hardware._.amd
      chaos.hardware._.fingerprint
      chaos.hardware._.sensors
      chaos.hardware._.wifi
      chaos.hardware._.framework._.wifi-quirks
    ];
    nixos = {
      imports = [
        inputs.nixos-hardware.nixosModules.framework-amd-ai-300-series
      ];
    };
  };

  chaos.hardware._.framework._.wifi-quirks = {
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
