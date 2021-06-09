{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../templates/dwarf.nix
  ];

  config = {
    networking = {
      hostName = "dwarf3";
      hostId = "411c2801";
    };

    # +----------------+
    # | UHD 750 Hack   |
    # +----------------+

    boot.kernelPackages = pkgs.linuxPackages_latest;
    boot.kernelParams = [ "i915.force_probe=4c8a" ];

    vital.services.chiafan-workforce = {
      enable = true;
      useChiabox = false;
      farmKey = "8d3e6ed9dc07e3f38fb7321adc3481a95fbdea515f60ff9737c583c5644c6cf83a5e38e9f3e1fc01d43deef0fa1bd0be";
      poolKey = "ad0dce731a9ef1813dca8498fa37c3abda52ad76795a8327ea883e6aa6ee023f9e06e9a0d5ea1fa3c625261b9da18f12";
      workers = [
        "/var/lib/chia/plotting/P05:/var/lib/chia/farm/F38"
        "/var/lib/chia/plotting/P05:/var/lib/chia/farm/F39"
        "/var/lib/chia/plotting/P05:/var/lib/chia/farm/F38"
        "/var/lib/chia/plotting/P05:/var/lib/chia/farm/F39"
        "/var/lib/chia/plotting/P05:/var/lib/chia/farm/F38"
        "/var/lib/chia/plotting/P06:/var/lib/chia/farm/F39"
        "/var/lib/chia/plotting/P06:/var/lib/chia/farm/F38"
        "/var/lib/chia/plotting/P06:/var/lib/chia/farm/F39"
        "/var/lib/chia/plotting/P06:/var/lib/chia/farm/F38"
        "/var/lib/chia/plotting/P06:/var/lib/chia/farm/F39"
      ];
      forwardConcurrency = 4;
      staggering = 1200;
    };
    
    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "20.09"; # Did you read the comment?
  };
}
