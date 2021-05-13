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

    # +----------------+
    # | UHD 750 Hack   |
    # +----------------+

    boot.kernelPackages = pkgs.linuxPackages_latest;
    boot.kernelParams = [ "i915.force_probe=4c8a" ];

    # +----------------+
    # | Services       |
    # +----------------+

    networking.firewall.allowedTCPPorts = [ 80 443 5000 8444 ];

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

    vital.services.chia-blockchain = {
      enable = true;
      plottingDirectory = "/var/lib/chia/plotting";
      plotsDirectory = "/var/lib/chia/farm";
      dotchiaDirectory = "/var/lib/chia/dotchia";
    };
  };
}
