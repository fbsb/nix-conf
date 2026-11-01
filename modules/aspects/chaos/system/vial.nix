{ chaos, ... }:
{
  chaos.all.hosts.includes = [ chaos.system.vial ];

  chaos.system.vial = {
    nixos =
      { pkgs, ... }:
      {
        services.udev.packages = [
          (pkgs.writeTextFile {
            name = "vial-udev-rules";
            destination = "/lib/udev/rules.d/59-vial.rules";
            text = ''
              KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
            '';
          })
        ];
      };
  };
}
