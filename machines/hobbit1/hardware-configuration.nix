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

  fileSystems."/opt/experiment" =
    { device = "/dev/disk/by-label/EXPERIMENT";
      fsType = "ext4";
      options = "auto nofail";
    };

  swapDevices =
    [ { device = "/dev/disk/by-label/NIXOS_SWAP"; }
    ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;
}
