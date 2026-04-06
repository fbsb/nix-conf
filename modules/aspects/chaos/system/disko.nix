{
  inputs,
  lib,
  ...
}:
{
  den.schema.host = {
    options = {
      mainDisk = lib.mkOption {
        type = lib.types.str;
        description = "The disk to install to, e.g. /dev/sda";
      };

      disko.bootPartitionSize = lib.mkOption {
        type = lib.types.str;
        default = "1G";
        description = "Size of the EFI boot partition.";
      };

      disko.luksPartitionSize = lib.mkOption {
        type = lib.types.str;
        default = "100%";
        description = "Size of the LUKS partition.";
      };

      disko.swapSize = lib.mkOption {
        type = lib.types.str;
        default = "8G";
        description = "Size of the swap LVM logical volume.";
      };

      disko.bootMountOptions = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [
          "defaults"
          "fmask=0022"
          "dmask=0022"
        ];
        description = "Mount options for the boot (vfat) partition.";
      };

      disko.btrfsMountOptions = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [
          "defaults"
          "noatime"
          "ssd"
          "discard=async"
          "compress=zstd"
        ];
        description = "Mount options for btrfs subvolumes.";
      };
    };
  };

  flake-file.inputs = {
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  chaos.system.provides.disko =
    { host, ... }:
    {
      nixos = {
        imports = [
          inputs.disko.nixosModules.disko
        ];

        disko.devices = {
          disk = {
            main = {
              type = "disk";
              device = host.mainDisk;
              content = {
                type = "gpt";
                partitions = {
                  part_00_ESP = {
                    size = host.disko.bootPartitionSize;
                    type = "EF00";
                    label = "ESP";
                    name = "ESP";
                    start = "2048";
                    content = {
                      type = "filesystem";
                      format = "vfat";
                      mountpoint = "/boot";
                      mountOptions = host.disko.bootMountOptions;
                    };
                  };
                  part_01_luks = {
                    name = "system_luks";
                    size = host.disko.luksPartitionSize;
                    label = "system_luks";
                    content = {
                      type = "luks";
                      name = "system";
                      extraOpenArgs = [ ];
                      settings = {
                        allowDiscards = true;
                      };
                      content = {
                        type = "lvm_pv";
                        vg = "system";
                      };
                    };
                  };
                };
              };
            };
          };

          lvm_vg = {
            system = {
              type = "lvm_vg";
              lvs = {
                swap = {
                  size = host.disko.swapSize;
                  content = {
                    type = "swap";
                    discardPolicy = "both";
                    resumeDevice = true; # resume from hibernation from this device
                  };
                };
                root = {
                  size = "80%";
                  content = {
                    type = "btrfs";
                    subvolumes = {
                      "@" = {
                        mountpoint = "/";
                        mountOptions = host.disko.btrfsMountOptions;
                      };
                      "@nix" = {
                        mountpoint = "/nix";
                        mountOptions = host.disko.btrfsMountOptions;
                      };
                      "@home" = {
                        mountpoint = "/home";
                        mountOptions = host.disko.btrfsMountOptions;
                      };
                      "@persistent" = {
                        mountpoint = "/persistent";
                        mountOptions = host.disko.btrfsMountOptions;
                      };
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
}
