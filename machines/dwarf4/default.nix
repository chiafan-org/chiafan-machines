{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../templates/dwarf.nix
  ];

  config = {
    networking = {
      hostName = "dwarf4";
      hostId = "339032f0";
    };

    vital.services.chiafan-workforce = {
      enable = true;
      farmKey = "8d3e6ed9dc07e3f38fb7321adc3481a95fbdea515f60ff9737c583c5644c6cf83a5e38e9f3e1fc01d43deef0fa1bd0be";
      poolKey = "ad0dce731a9ef1813dca8498fa37c3abda52ad76795a8327ea883e6aa6ee023f9e06e9a0d5ea1fa3c625261b9da18f12";
      workers = [
        "/plotting/P07:/plots/F07"
        "/plotting/P07:/plots/F07"
        "/plotting/P07:/plots/F07"
        "/plotting/P07:/plots/F07"
        "/plotting/P08:/plots/F07"
        "/plotting/P08:/plots/F07"
        "/plotting/P08:/plots/F07"
      ];
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