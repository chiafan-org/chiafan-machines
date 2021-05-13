# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/0e4def8d-c79e-42b5-a2b4-bd022171cf80";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/3F10-05E7";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/44b6f388-a5a9-41e7-a372-90a8889298f6"; }
    ];

  fileSystems."/var/lib/chia/plotting/P01" =
    { device = "/dev/disk/by-label/P01";
      fsType = "ext4";
    };

  fileSystems."/var/lib/chia/plotting/P02" =
    { device = "/dev/disk/by-label/P02";
      fsType = "ext4";
    };

  fileSystems."/var/lib/chia/farm/F01" =
    { device = "/dev/disk/by-label/F01";
      fsType = "ext4";
    };

  fileSystems."/var/lib/chia/farm/F02" =
    { device = "/dev/disk/by-label/F02";
      fsType = "ext4";
    };

  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;
}
