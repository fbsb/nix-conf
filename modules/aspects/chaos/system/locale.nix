{
  chaos,
  lib,
  ...
}:
{
  den.schema.host.options = {
    locale = lib.mkOption {
      type = lib.types.str;
      description = "Locale settings to apply, e.g. de-berlin";
      default = "en_US.UTF-8";
    };

    extraLocale = lib.mkOption {
      type = lib.types.str;
      description = "Additional locale settings to apply, e.g. LC_TIME=de_DE.UTF-8";
      default = "de_DE.UTF-8";
    };

    timeZone = lib.mkOption {
      type = lib.types.str;
      description = "Time zone to apply, e.g. Europe/Berlin";
      default = "Europe/Berlin";
    };
  };

  chaos.all._.hosts.includes = [ chaos.system._.locale ];

  chaos.system._.locale =
    { host, ... }:
    {
      nixos = {
        i18n = {
          defaultLocale = host.locale;
          supportedLocales = [ "all" ];
          extraLocaleSettings = {
            LC_ADDRESS = host.extraLocale;
            LC_IDENTIFICATION = host.extraLocale;
            LC_MEASUREMENT = host.extraLocale;
            LC_MONETARY = host.extraLocale;
            LC_NAME = host.extraLocale;
            LC_NUMERIC = host.extraLocale;
            LC_PAPER = host.extraLocale;
            LC_TELEPHONE = host.extraLocale;
            LC_TIME = host.extraLocale;
          };
        };

        time.timeZone = host.timeZone;
      };
    };
}
