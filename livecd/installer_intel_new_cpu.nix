# nix-build '<nixpkgs/nixos>' -A config.system.build.isoImage -I nixos-config=[this-nix-file]
#
# Or, if you want to try the livecd with qeum
#
# qemu-system-x86_64 -boot d -cdrom nixos-19.09.2350.d011e474945-x86_64-linux.iso -m 8192 -enable-kvm

{config, pkgs, ...}:

{
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix>
    # Provide an initial copy of the NixOS channel so that the user
    # doesn't need to run "nix-channel --update" first.
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
  ];

  # Hack for intel new 11th CPU with UHD 750 Integrated Graphics Card
  boot.kernelPackages = pkgs.linuxPackages_5_11;
  boot.kernelParams = [ "i915.force_probe=4c8a" ];

  # Enable Nix Flakes
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  environment.systemPackages = with pkgs; [
    vim emacs firefox git gparted
  ];
}
