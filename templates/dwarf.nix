{ config, pkgs, lib, ... }:

{
  imports = [
    ../base
    ../modules/chiafan-helper.nix
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

    # +----------------+
    # | Services       |
    # +----------------+

    networking.firewall.allowedTCPPorts = [ 80 443 8444 8447 ];
    networking.firewall.allowedUDPPorts = [ 8444 8447 ];

    # security.acme = {
    #   acceptTerms = true;
    #   email = "bds@breakds.org";
    # };

    services.nginx = {
      enable = false;
      package = pkgs.nginxMainline;
      recommendedOptimisation = true;
      recommendedGzipSettings = true;
      recommendedProxySettings = true;

      # TODO(breakds): Make this per virtual host.
      clientMaxBodySize = "1000m";
    };
  };
}
