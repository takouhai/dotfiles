{
  description = "taco's super awesome nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      myna = lib.nixosSystem {
        modules = [./sys/myna];
      };
      fishcrow = lib.nixosSystem {
        modules = [./sys/fishcrow];
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
