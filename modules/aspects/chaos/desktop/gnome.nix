{ chaos, ... }:
{

  den.quirks.gnome-extensions.description = "GNOME shell extensions contributed by aspects";

  # TODO: remove when all systems have migrated to new aspect
  chaos.gnome.includes = [ chaos.desktop._.gnome ];

  chaos.desktop._.gnome.nixos =
    {
      pkgs,
      gnome-extensions,
      ...
    }:
    let
      builtinExtensions = with pkgs.gnomeExtensions; [
        appindicator
        blur-my-shell
        clipboard-indicator
        dash-to-dock
        tiling-shell
        system-monitor-next
      ];
      contributedExtensions = map (name: pkgs.gnomeExtensions.${name}) gnome-extensions;
      allExtensions = builtinExtensions ++ contributedExtensions;
    in
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

      environment.systemPackages =
        with pkgs;
        [
          # utilities
          adwaita-icon-theme
          dconf-editor
          dconf2nix
          gnome-tweaks
        ]
        ++ allExtensions;

      programs.dconf.enable = true;
      programs.dconf.profiles = {
        user.databases = [
          {
            settings = {
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
              "org/gnome/shell" = {
                enabled-extensions = map (extension: extension.extensionUuid) allExtensions;
              };
              "org/gnome/mutter" = {
                edge-tiling = false;
                dynamic-workspaces = true;
              };
              # Delegate idle and power-button handling to systemd-logind
              # (IdleAction=suspend-then-hibernate, HandlePowerKey=hibernate).
              # Setting these to "nothing" makes gsd-power drop its inhibitors
              # so logind actually gets to act on the events.
              "org/gnome/settings-daemon/plugins/power" = {
                sleep-inactive-ac-type = "nothing";
                sleep-inactive-battery-type = "nothing";
                power-button-action = "nothing";
              };
            };
          }
        ];
      };

      # TODO: add extension configs
    };
}
