{ config, pkgs, lib, ... }:

{
  imports = [
    ../base
  ];

  config = {
    vital.mainUser = "chiafan";

    users.users."chiafan" = {
      # TODO(breakds): Add more member's public key
      openssh.authorizedKeys.keyFiles = [
        ../data/keys/breakds_samaritan.pub
      ];
      shell = pkgs.bash;
    };

    vital.pre-installed.level = 5;
    vital.games.steam.enable = false;

    vital.graphical = {
      enable = true;
      xserver.dpi = 100;
      nvidia.enable = lib.mkDefault false;
      remote-desktop.enable = true;
    };

    environment.systemPackages = with pkgs; [ chia ];

    networking.firewall.allowedTCPPorts = [ 80 443 8444 8447 ];
    networking.firewall.allowedUDPPorts = [ 8444 8447 ];
  };
}
