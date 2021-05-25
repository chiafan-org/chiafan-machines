# This is the base for all machines that belongs to chiafan

{ config, lib, pkgs, ... }:

{
  time.timeZone = lib.mkDefault "America/Los_Angeles";

  # Enable to use non-free packages such as nvidia drivers
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    gparted pass smbclient parted
  ] ++ lib.optionals config.vital.graphical.enable [
    google-chrome

    # Cloud Tools
    awscli2 nixops
    
    # Performance Tools
    sysstat linuxPackages.perf perf-tools flameGraph

    # Other Tools
    jq
  ];
}
