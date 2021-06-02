{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../templates/hobbit.nix
  ];

  config = {
    networking = {
      hostName = "bilbo";
      hostId = "88600056";
    };

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

    # TODO(breakds): Enable this when all are setup
    services.iscsid = {
      enable = false;
      initiatorName = "iqn.2021-05.org.linux-iscsi.initiatorhost:hardstone";
      scanTargets = [{
        target = "10.77.1.119";
        port = 3260;
        type = "sendtargets";
      }];
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
