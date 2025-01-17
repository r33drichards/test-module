{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flakery.url = "github:getflakery/flakes";
  };

  outputs = { self, nixpkgs, flakery }: {
    nixosConfigurations.flakery = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        flakery.nixosModules.flakery-dev
        flakery.nixosConfigurations.base
        ./configuration.nix
      ];
    };
  };
}