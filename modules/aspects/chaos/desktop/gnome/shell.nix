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

  chaos.desktop.gnome.config.homeManager = {
    gtk = {
      enable = true;
      colorScheme = "dark";
    };
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        enable-hot-corners = false;
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
      # Delegate idle and power-button handling to systemd-logind.
      "org/gnome/settings-daemon/plugins/power" = {
        sleep-inactive-ac-type = "nothing";
        sleep-inactive-battery-type = "nothing";
        power-button-action = "nothing";
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
