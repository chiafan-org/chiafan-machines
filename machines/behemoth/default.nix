{ config, pkgs, lib, ... }:

{
  imports = [
    ../../base
    ./hardware-configuration.nix
  ];

  config = {
    vital.mainUser = "chiafan";

    networking = {
      hostName = "behemoth";
      hostId = "5c6aaab6";
    };

    # Use the GRUB 2 boot loader.
    boot.loader.grub = {
      enable = true;
      version = 2;
      device = "/dev/sdc";
    };

    users.users."chiafan" = {
      openssh.authorizedKeys.keyFiles = [
        ../../data/keys/breakds_samaritan.pub
      ];
      shell = pkgs.bash;
    };

    vital.pre-installed.level = 5;
    vital.games.steam.enable = false;
    vital.programs.texlive.enable = false;
    vital.programs.modern-utils.enable = true;
    vital.programs.accounting.enable = false;
    vital.programs.vscode.enable = false;


    vital.graphical.enable = false;

    environment.systemPackages = with pkgs; [ chia ];

    networking.firewall.allowedTCPPorts = [ 8444 8447 ];
    networking.firewall.allowedUDPPorts = [ 8444 8447 ];

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "21.05"; # Did you read the comment?
  };
}
