{ lib, ... }:
{
  chaos.desktop.cosmic.to-users =
    let
      # RON-format COSMIC config files (see ~/.config/cosmic), pinned by hand.
      # Only stable, user-chosen settings are declared here: panel/dock
      # layout, dock favorites/pins, shortcuts, compositor input/tiling/
      # keyboard behaviour, idle timers, theme mode, audio and applet
      # preferences. Generated/cached state (theme palettes, output
      # geometry, GPU identifiers, etc.) is intentionally left out since
      # it's per-machine and regenerates itself.
      cosmicConfigFiles = {
        "com.system76.CosmicPanel.Dock/v1/anchor" = "Bottom";
        "com.system76.CosmicPanel.Dock/v1/anchor_gap" = "false";
        "com.system76.CosmicPanel.Dock/v1/autohide" = ''
          Some((
              wait_time: 1000,
              transition_time: 200,
              handle_size: 4,
              unhide_delay: 200,
          ))
        '';
        "com.system76.CosmicPanel.Dock/v1/autohover_delay_ms" = "Some(500)";
        "com.system76.CosmicPanel.Dock/v1/background" = "ThemeDefault";
        "com.system76.CosmicPanel.Dock/v1/border_radius" = "12";
        "com.system76.CosmicPanel.Dock/v1/exclusive_zone" = "false";
        "com.system76.CosmicPanel.Dock/v1/expand_to_edges" = "false";
        "com.system76.CosmicPanel.Dock/v1/keyboard_interactivity" = "OnDemand";
        "com.system76.CosmicPanel.Dock/v1/layer" = "Top";
        "com.system76.CosmicPanel.Dock/v1/margin" = "0";
        "com.system76.CosmicPanel.Dock/v1/name" = ''"Dock"'';
        "com.system76.CosmicPanel.Dock/v1/opacity" = "1.0";
        "com.system76.CosmicPanel.Dock/v1/output" = "All";
        "com.system76.CosmicPanel.Dock/v1/padding" = "4";
        "com.system76.CosmicPanel.Dock/v1/padding_overlap" = "0.5";
        "com.system76.CosmicPanel.Dock/v1/plugins_center" = ''
          Some([
              "com.system76.CosmicPanelWorkspacesButton",
              "com.system76.CosmicPanelAppButton",
              "com.system76.CosmicAppList",
              "com.system76.CosmicAppletMinimize",
          ])
        '';
        "com.system76.CosmicPanel.Dock/v1/plugins_wings" = "Some(([], []))";
        "com.system76.CosmicPanel.Dock/v1/size" = "M";
        "com.system76.CosmicPanel.Dock/v1/size_center" = "None";
        "com.system76.CosmicPanel.Dock/v1/size_wings" = "None";
        "com.system76.CosmicPanel.Dock/v1/spacing" = "0";

        "com.system76.CosmicAppList/v1/enable_drag_source" = "true";
        "com.system76.CosmicAppList/v1/filter_top_levels" = "None";
        "com.system76.CosmicAppList/v1/favorites" = ''
          [
              "com.system76.CosmicFiles",
              "app.zen_browser.zen",
              "code",
              "com.mitchellh.ghostty",
          ]
        '';

        "com.system76.CosmicPanel.Panel/v1/anchor" = "Top";
        "com.system76.CosmicPanel.Panel/v1/anchor_gap" = "false";
        "com.system76.CosmicPanel.Panel/v1/autohide" = "None";
        "com.system76.CosmicPanel.Panel/v1/autohover_delay_ms" = "Some(500)";
        "com.system76.CosmicPanel.Panel/v1/background" = "ThemeDefault";
        "com.system76.CosmicPanel.Panel/v1/border_radius" = "0";
        "com.system76.CosmicPanel.Panel/v1/exclusive_zone" = "true";
        "com.system76.CosmicPanel.Panel/v1/expand_to_edges" = "true";
        "com.system76.CosmicPanel.Panel/v1/keyboard_interactivity" = "OnDemand";
        "com.system76.CosmicPanel.Panel/v1/layer" = "Top";
        "com.system76.CosmicPanel.Panel/v1/margin" = "0";
        "com.system76.CosmicPanel.Panel/v1/name" = ''"Panel"'';
        "com.system76.CosmicPanel.Panel/v1/opacity" = "1.0";
        "com.system76.CosmicPanel.Panel/v1/output" = "All";
        "com.system76.CosmicPanel.Panel/v1/padding" = "0";
        "com.system76.CosmicPanel.Panel/v1/padding_overlap" = "0.5";
        "com.system76.CosmicPanel.Panel/v1/plugins_center" = ''
          Some([
              "com.system76.CosmicAppletTime",
          ])
        '';
        "com.system76.CosmicPanel.Panel/v1/plugins_wings" = ''
          Some(([
              "com.system76.CosmicAppletWorkspaces",
          ], [
              "dev.DBrox.CosmicPrivacyIndicator",
              "com.system76.CosmicAppletInputSources",
              "io.github.cosmic_utils.minimon-applet",
              "com.system76.CosmicAppletStatusArea",
              "net.tropicbliss.CosmicExtAppletCaffeine",
              "com.system76.CosmicAppletA11y",
              "com.system76.CosmicAppletTiling",
              "com.system76.CosmicAppletAudio",
              "com.system76.CosmicAppletBluetooth",
              "com.system76.CosmicAppletNetwork",
              "com.system76.CosmicAppletBattery",
              "com.system76.CosmicAppletNotifications",
              "com.system76.CosmicAppletPower",
          ]))
        '';
        "com.system76.CosmicPanel.Panel/v1/size" = "XS";
        "com.system76.CosmicPanel.Panel/v1/size_center" = "None";
        "com.system76.CosmicPanel.Panel/v1/size_wings" = "None";
        "com.system76.CosmicPanel.Panel/v1/spacing" = "0";

        "com.system76.CosmicPanel/v1/entries" = ''
          [
              "Panel",
              "Dock",
          ]
        '';

        "com.system76.CosmicSettings.Shortcuts/v1/custom" = ''
          {
              (
                  modifiers: [
                      Super,
                  ],
                  key: "f",
              ): Fullscreen,
              (
                  modifiers: [
                      Super,
                      Alt,
                  ],
                  key: "BackSpace",
              ): System(InputSourceSwitch),
              (
                  modifiers: [
                      Super,
                  ],
                  key: "F11",
              ): Disable,
              (
                  modifiers: [
                      Super,
                      Shift,
                  ],
                  key: "q",
              ): Close,
              (
                  modifiers: [
                      Super,
                  ],
                  key: "Return",
              ): System(Terminal),
              (
                  modifiers: [
                      Super,
                      Shift,
                  ],
                  key: "Return",
              ): System(WebBrowser),
              (
                  modifiers: [
                      Super,
                  ],
                  key: "q",
              ): Disable,
              (
                  modifiers: [
                      Super,
                  ],
                  key: "m",
              ): Disable,
              (
                  modifiers: [
                      Super,
                      Alt,
                  ],
                  key: "s",
              ): Disable,
              (
                  modifiers: [
                      Super,
                  ],
              ): Disable,
              (
                  modifiers: [
                      Super,
                      Shift,
                  ],
                  key: "n",
              ): System(HomeFolder),
              (
                  modifiers: [
                      Super,
                  ],
                  key: "t",
              ): Disable,
              (
                  modifiers: [
                      Alt,
                  ],
                  key: "F4",
              ): Disable,
              (
                  modifiers: [
                      Super,
                  ],
                  key: "b",
              ): Disable,
              (
                  modifiers: [
                      Super,
                  ],
                  key: "slash",
              ): Disable,
              (
                  modifiers: [
                      Super,
                  ],
                  key: "space",
              ): System(Launcher),
          }
        '';
        # cosmic-comp binds XF86PowerOff to the "PowerOff" system action, whose
        # command defaults to "cosmic-osd shutdown" (the confirmation dialog the
        # user sees). cosmic-session takes a "block" logind inhibitor on
        # HandlePowerKey specifically so it can show that dialog itself, so
        # `services.logind.settings.Login.HandlePowerKey` has no effect under
        # COSMIC. Overriding the command for the PowerOff action is the only way
        # (short of patching cosmic-comp/cosmic-settings-daemon) to change what
        # pressing the power key does; this only affects the physical key
        # binding, not the "Shut Down" button in the power applet/menu (which
        # calls logind directly via its own PowerAction, unrelated to
        # system_actions).
        "com.system76.CosmicSettings.Shortcuts/v1/system_actions" = ''
          {
              PowerOff: "systemctl hibernate",
          }
        '';

        "com.system76.CosmicComp/v1/active_hint" = "true";
        "com.system76.CosmicComp/v1/appearance_settings" = ''
          (
              clip_floating_windows: true,
              clip_tiled_windows: false,
              shadow_tiled_windows: false,
          )
        '';
        "com.system76.CosmicComp/v1/autotile" = "true";
        "com.system76.CosmicComp/v1/autotile_behavior" = "PerWorkspace";
        "com.system76.CosmicComp/v1/edge_snap_threshold" = "10";
        "com.system76.CosmicComp/v1/input_default" = ''
          (
              state: Enabled,
              scroll_config: Some((
                  method: None,
                  natural_scroll: Some(true),
                  scroll_button: None,
                  scroll_factor: None,
              )),
          )
        '';
        "com.system76.CosmicComp/v1/input_touchpad" = ''
          (
              state: Enabled,
              acceleration: Some((
                  profile: Some(Adaptive),
                  speed: -0.0038905388205345837,
              )),
              click_method: Some(Clickfinger),
              scroll_config: Some((
                  method: Some(TwoFinger),
                  natural_scroll: Some(true),
                  scroll_button: None,
                  scroll_factor: None,
              )),
              tap_config: Some((
                  enabled: true,
                  button_map: Some(LeftRightMiddle),
                  drag: true,
                  drag_lock: false,
              )),
          )
        '';
        "com.system76.CosmicComp/v1/keyboard_config" = ''
          (
              numlock_state: BootOn,
          )
        '';
        "com.system76.CosmicComp/v1/workspaces" = ''
          (
              workspace_mode: OutputBound,
              workspace_layout: Horizontal,
              action_on_typing: OpenLauncher,
              workspace_wraparound: true,
          )
        '';
        "com.system76.CosmicComp/v1/xkb_config" = ''
          (
              rules: "",
              model: "pc104",
              layout: "us,us",
              variant: "altgr-intl,colemak",
              options: Some("grp:ctrl_shift_bksp_toggle"),
              repeat_delay: 600,
              repeat_rate: 25,
          )
        '';

        "com.system76.CosmicIdle/v1/screen_off_time" = "Some(300000)";
        "com.system76.CosmicIdle/v1/suspend_on_ac_time" = "Some(3600000)";

        "com.system76.CosmicTheme.Mode/v1/auto_switch" = "true";
        "com.system76.CosmicTheme.Mode/v1/is_dark" = "true";

        "com.system76.CosmicAudio/v1/amplification_sink" = "true";
        "com.system76.CosmicAudio/v1/amplification_source" = "true";

        "com.system76.CosmicAppletTime/v1/first_day_of_week" = "0";
        "com.system76.CosmicAppletTime/v1/military_time" = "true";
        "com.system76.CosmicAppletTime/v1/show_date_in_top_panel" = "false";
        "com.system76.CosmicAppletTime/v1/show_seconds" = "false";

        "com.system76.CosmicAppletAudio/v1/show_media_controls_in_top_panel" = "true";

        "com.system76.CosmicAppletBattery/v1/show_percentage" = "true";

        # cosmic-ext-applet-minimon. The "gpus" key is keyed by a per-machine
        # GPU identifier hash and is left out for that reason.
        "io.github.cosmic_utils.minimon-applet-panel/v1/content_order" = ''
          (
              order: [
                  CpuUsage,
                  CpuTemp,
                  MemoryUsage,
                  NetworkUsage,
                  DiskUsage,
                  GpuInfo,
              ],
          )
        '';
        "io.github.cosmic_utils.minimon-applet-panel/v1/cpu" = ''
          (
              chart_visible: true,
              value_visible: false,
              label_visible: false,
              icon_visible: false,
              chart: StackedBars,
              no_decimals: false,
              bar_width: 4,
              bar_spacing: 1,
          )
        '';
        "io.github.cosmic_utils.minimon-applet-panel/v1/cputemp" = ''
          (
              chart_visible: false,
              value_visible: false,
              label_visible: false,
              icon_visible: true,
              chart: Heat,
              unit: Celsius,
              min_temp: 0.0,
          )
        '';
        "io.github.cosmic_utils.minimon-applet-panel/v1/disks1" = ''
          (
              chart_visible: false,
              value_visible: false,
              label_visible: false,
              icon_visible: false,
              chart: Line,
              variant: Write,
          )
        '';
        "io.github.cosmic_utils.minimon-applet-panel/v1/disks2" = ''
          (
              chart_visible: false,
              value_visible: false,
              label_visible: false,
              icon_visible: true,
              chart: Line,
              variant: Read,
          )
        '';
        "io.github.cosmic_utils.minimon-applet-panel/v1/memory" = ''
          (
              chart_visible: true,
              value_visible: false,
              label_visible: false,
              icon_visible: false,
              chart: Line,
              percentage: false,
              show_allocated: true,
              stack_values: false,
          )
        '';
        "io.github.cosmic_utils.minimon-applet-panel/v1/monospace_values" = "false";
        "io.github.cosmic_utils.minimon-applet-panel/v1/network1" = ''
          (
              chart_visible: true,
              value_visible: false,
              label_visible: false,
              icon_visible: false,
              chart: Line,
              adaptive: true,
              bandwidth: 62500000,
              unit: Some(0),
              variant: Combined,
              show_bytes: false,
          )
        '';
        "io.github.cosmic_utils.minimon-applet-panel/v1/network2" = ''
          (
              chart_visible: true,
              value_visible: false,
              label_visible: false,
              icon_visible: true,
              chart: Line,
              adaptive: true,
              bandwidth: 62500000,
              unit: Some(0),
              variant: Upload,
              show_bytes: false,
          )
        '';
        "io.github.cosmic_utils.minimon-applet-panel/v1/panel_spacing" = "3";
        "io.github.cosmic_utils.minimon-applet-panel/v1/refresh_rate" = "1000";
        "io.github.cosmic_utils.minimon-applet-panel/v1/sysmon" = "None";
        "io.github.cosmic_utils.minimon-applet-panel/v1/value_size_default" = "11";
      };
    in
    {
      homeManager = {
        xdg.configFile =
          lib.mapAttrs' (
            path: text:
            lib.nameValuePair "cosmic/${path}" {
              inherit text;
            }
          ) cosmicConfigFiles
          // {
            # marker file cosmic-initial-setup checks for; skips the first-run
            # welcome/setup wizard when present (must be empty).
            "cosmic-initial-setup-done".text = "";
          };

        services.gnome-keyring.enable = true;
      };
    };

  chaos.desktop.cosmic = {
    nixos =
      {
        pkgs,
        ...
      }:
      {
        services.displayManager.cosmic-greeter.enable = true;
        services.desktopManager.cosmic.enable = true;
        services.desktopManager.cosmic.xwayland.enable = true;
        services.system76-scheduler.enable = true;

        services.gnome.gnome-keyring.enable = true;
        security.pam.services.login.enableGnomeKeyring = true;
        security.pam.services.greetd.enableGnomeKeyring = true;
        security.pam.services.greetd.fprintAuth = false;

        environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
        environment.sessionVariables.NIXOS_OZONE_WL = "1";

        programs.seahorse.enable = true;

        environment.systemPackages = with pkgs; [
          cosmic-ext-applet-caffeine
          cosmic-ext-applet-privacy-indicator
          cosmic-ext-applet-minimon
          cosmic-monitor
        ];
      };
  };
}
