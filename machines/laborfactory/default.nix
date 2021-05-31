{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../base
    ../../modules/iscsi/iscsid.nix
  ];

  config = {
    vital.mainUser = "breakds";

    networking = {
      hostName = "laborfactory";
      hostId = "194b127e";
    };

    users.users."breakds" = {
      # TODO(breakds): Add more member's public key
      openssh.authorizedKeys.keyFiles = [
        ../../data/keys/breakds_samaritan.pub
      ];
      shell = pkgs.bash;
    };

    vital.pre-installed.level = 5;
    vital.games.steam.enable = false;

    vital.graphical = {
      enable = true;
      xserver.displayManager = "lightdm";
      xserver.dpi = 100;
      nvidia = {
        enable = true;
        prime = {
          enable = true;
          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };
      remote-desktop.enable = false;
    };

    environment.systemPackages = with pkgs; [
      chia
    ];

    # +----------------+
    # | Services       |
    # +----------------+

    services.iscsid = {
      enable = true;
      initiatorName = "iqn.2021-05.org.linux-iscsi.initiatorhost:laborfactory";
      scanTargets = [{
        target = "10.77.1.119";
        port = 3260;
        type = "sendtargets";
      }];
    };

    networking.firewall.allowedTCPPorts = [ 80 443 8444 8447 ];
    networking.firewall.allowedUDPPorts = [ 8444 8447 ];

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "20.09"; # Did you read the comment?
  };
}
