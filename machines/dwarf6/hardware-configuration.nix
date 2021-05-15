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
    { device = "/dev/disk/by-label/NIXOS_ROOT";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-label/NIXOS_BOOT";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-label/NIXOS_SWAP"; }
    ];

  fileSystems."/var/lib/chia/plotting/P11" =
    { device = "/dev/disk/by-label/P11";
      fsType = "ext4";
    };

  fileSystems."/var/lib/chia/plotting/P12" =
    { device = "/dev/disk/by-label/P12";
      fsType = "ext4";
    };

  fileSystems."/var/lib/chia/farm/F11" =
    { device = "/dev/disk/by-label/F11";
      fsType = "ext4";
    };

  fileSystems."/var/lib/chia/farm/F12" =
    { device = "/dev/disk/by-label/F12";
      fsType = "ext4";
    };

  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;
}
