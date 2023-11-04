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

    hyprland.url = "github:hyprwm/Hyprland/2df0d034bc4a18fafb3524401eeeceaa6b23e753";

    nix-alien.url = "github:thiagokokada/nix-alien";

    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    home-manager,
    hyprland,
    nix-alien,
    nixgl,
    nixpkgs,
    nur,
    plasma-manager,
    self,
    ...
  }: let
    user = "taco";
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      myna = lib.nixosSystem {
        modules = [
          ./sys/myna
          nur.nixosModules.nur
          hyprland.nixosModules.default
        ];
      };
      fishcrow = lib.nixosSystem {
        modules = [
          ./sys/fishcrow
          nur.nixosModules.nur
          hyprland.nixosModules.default
        ];
      };
    };
    homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        ./home
        hyprland.homeManagerModules.default
      ];
    };
  };
}
