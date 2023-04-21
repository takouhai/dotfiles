{
  description = "taco's super awesome nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
    };

    nixgl = {
      url = "github:guibou/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:vaxerski/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    nur,
    nixgl,
    hyprland,
    plasma-manager,
    ...
  }: let
    user = "taco";
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    lib = nixpkgs.lib;
    plasma-manager = plasma-manager;
  in {
    nixosConfigurations = {
      myna = lib.nixosSystem {
        modules = [
          ./sys/myna
          nur.nixosModules.nur
        ];
      };
      fishcrow = lib.nixosSystem {
        modules = [
          ./sys/fishcrow
          hyprland.nixosModules.default
          nur.nixosModules.nur
        ];
      };
    };
    homeConfigurations.taco = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./home
      ];
    };
  };
}
