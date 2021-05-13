{
  description = "Collection of Chiafan Machines and Miners";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-20.09";

    # Use vital-modules, with the same nixpkgs
    vital-modules.url = "github:nixvital/vital-modules?rev=3b869265725a61de267116ef3ab182abbe57f542";
    vital-modules.inputs.nixpkgs.follows = "nixpkgs";

    # Use nixos-home, with the same nixpkgs
    nixos-home.url = "github:breakds/nixos-home?rev=a2c05fc7fcac090b756086eba8b0762178391c30";
    nixos-home.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, vital-modules, nixos-home, ... }: {
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
    };
  };
}
