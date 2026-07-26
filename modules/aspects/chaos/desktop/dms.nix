{ chaos, inputs, ... }:
{
  flake-file.inputs = {
    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
    };
  };

  chaos.desktop._.dms-shell.to-users.homeManager =
    { ... }:
    {
      imports = [ inputs.dms.homeModules.dank-material-shell ];

      programs.dank-material-shell.enable = true;

      services.gnome-keyring.enable = true;
    };

  chaos.desktop._.dms.nixos =
    { ... }:
    {
      imports = [
        inputs.dms.nixosModules.dank-material-shell
        inputs.dms.nixosModules.greeter
      ];

      # DMS ships with no compositor of its own; Hyprland is the one we pair it
      # with here. withUWSM makes Hyprland export its env to systemd and start
      # graphical-session.target, which is what the "dms" systemd user service
      # (from the dank-material-shell module) binds to.
      programs.hyprland = {
        enable = true;
        withUWSM = true;
      };

      # xdg.portal is configured automatically by programs.hyprland (enables
      # xdg-desktop-portal-hyprland), no extra wiring needed here.

      programs.dank-material-shell = {
        enable = true;
        systemd.enable = true;

        greeter = {
          enable = true;
          compositor.name = "hyprland";
        };
      };

      environment.sessionVariables.NIXOS_OZONE_WL = "1";

      # See chaos-cosmic-keyring memory notes: greetd is the PAM service that
      # runs on real interactive login (used by both cosmic-greeter and the
      # dms-greeter here), and fprintd short-circuits it before pam_unix ever
      # captures a password to seed the keyring with.
      services.gnome.gnome-keyring.enable = true;
      security.pam.services.login.enableGnomeKeyring = true;
      security.pam.services.greetd.enableGnomeKeyring = true;
      security.pam.services.greetd.fprintAuth = false;
    };
}
