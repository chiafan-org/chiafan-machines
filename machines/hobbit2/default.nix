{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../templates/hobbit.nix
  ];

  config = {
    networking = {
      hostName = "hobbit2";
      hostId = "5ccfa0cc";
    };

    environment.systemPackages = with pkgs; [
      python3Packages.rtslib  # provide targetctl
      targetcli
    ];

    services.target = {
      enable = true;
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
