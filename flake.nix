{
  description = "Collection of Chiafan Machines and Miners";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.09";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs?rev=f924460e91cba6473c5dc4b8ccb1a1cfc05bc2d7";

    # Use vital-modules, with the same nixpkgs
    vital-modules.url = "github:nixvital/vital-modules";
    vital-modules.inputs.nixpkgs.follows = "nixpkgs";

    # Use nixos-home, with the same nixpkgs
    nixos-home.url = "github:breakds/nixos-home?rev=a2c05fc7fcac090b756086eba8b0762178391c30";
    nixos-home.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, vital-modules, nixos-home, ... }: let
    chia-from-unstable = system: { config, ...}: let
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
      };
    in {
      nixpkgs.overlays = [
        (final: prev: {
          chia = pkgs-unstable.chia;
        })
      ];
    };
    
  in {
    nixosConfigurations = {
      dwarf1 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          vital-modules.nixosModules.foundation
          ./machines/dwarf1
        ];
      };

      dwarf2 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          vital-modules.nixosModules.foundation
          ./machines/dwarf2
        ];
      };

      dwarf3 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          vital-modules.nixosModules.foundation
          ./machines/dwarf3
        ];
      };

      dwarf4 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          vital-modules.nixosModules.foundation
          ./machines/dwarf4
        ];
      };

      dwarf6 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          vital-modules.nixosModules.foundation
          ./machines/dwarf6
        ];
      };

      shepherd1 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          vital-modules.nixosModules.foundation
          ./machines/shepherd1
        ];
      };

      hobbit1 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          vital-modules.nixosModules.foundation
          ./machines/hobbit1
        ];
      };

      laborfactory = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          (chia-from-unstable "x86_64-linux")
          vital-modules.nixosModules.foundation
          ./machines/laborfactory
        ];
      };
    };
  };
}
