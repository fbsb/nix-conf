{ chaos, ... }:
{
  chaos.desktop.gnome.includes = with chaos.desktop.gnome.extensions; [
    chaos.desktop.gnome.config
    appindicator
    blur-my-shell
    clipboard-indicator
    dash-to-dock
    hibernate-power-menu
    tiling-shell
    system-monitor-next
  ];

  chaos.desktop.gnome.config.homeManager =
    { lib, ... }:
    {
      gtk = {
        enable = true;
        colorScheme = "dark";
        font = {
          name = "Adwaita Sans";
          size = 11;
        };
        cursorTheme = {
          name = "Adwaita";
          size = 24;
        };
      };
      dconf.settings = {
        "org/gnome/desktop/session" = {
          idle-delay = lib.hm.gvariant.mkUint32 300;
        };
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          cursor-size = 24;
          cursor-theme = "Adwaita";
          enable-hot-corners = false;
          font-name = "Adwaita Sans 11";
          monospace-font-name = "Adwaita Mono 11";
          show-battery-percentage = true;
          clock-show-weekday = true;
          clock-show-date = true;
        };
        "org/gnome/desktop/wm/preferences" = {
          button-layout = "appmenu:minimize,maximize,close";
        };
        "org/gnome/mutter" = {
          edge-tiling = false;
          dynamic-workspaces = true;
        };
        # GNOME handles inactivity and the power key; logind handles lid-close sleep.
        "org/gnome/settings-daemon/plugins/power" = {
          idle-brightness = lib.hm.gvariant.mkUint32 30;
          idle-dim = true;
          power-button-action = "hibernate";
          sleep-inactive-ac-timeout = lib.hm.gvariant.mkUint32 0;
          sleep-inactive-ac-type = "nothing";
          sleep-inactive-battery-timeout = lib.hm.gvariant.mkUint32 900;
          sleep-inactive-battery-type = "suspend";
        };
      };
    };

  chaos.desktop.gnome.nixos =
    { pkgs, ... }:
    {
      services.displayManager.gdm.enable = true;
      services.desktopManager.gnome.enable = true;

      services.gnome = {
        core-shell.enable = true;
        games.enable = false;
        gnome-online-accounts.enable = true;
        localsearch.enable = true;
        sushi.enable = true;
        tinysparql.enable = true;
      };

      environment.gnome.excludePackages = with pkgs; [
        gnome-tour
        gnome-user-docs
      ];

      # Enable fractional scaling
      environment.sessionVariables.NIXOS_OZONE_WL = "1";
      services.desktopManager.gnome.extraGSettingsOverrides = ''
        [org.gnome.mutter]
        experimental-features=['scale-monitor-framebuffer', 'xwayland-native-scaling']
      '';

      environment.systemPackages = with pkgs; [
        # utilities
        adwaita-icon-theme
        dconf-editor
        dconf2nix
        gnome-tweaks
      ];

      programs.dconf.enable = true;
    };
}
