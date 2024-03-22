{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
    musnix.url = "github:musnix/musnix";
    mach-nix.url = "github:DavHau/mach-nix";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, stylix, musnix, mach-nix, ... }:
    let
      inherit (self) outputs;
      pkgs = nixpkgs.legacyPackages.${settings.system.system};
      lib = nixpkgs.lib;
      settings = import ./settings.nix;
      nixConf = (./hosts/${settings.system.profile}/configuration.nix);
      nixHome = (./hosts/${settings.system.profile}/home.nix);

    in{
      # If the system is running nixos, use home manager as a nix module.
      nixosConfigurations = {
        system = lib.nixosSystem {
          system = settings.system.system;
          modules = [
            nixConf
            musnix.nixosModules.musnix
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."${settings.user.username}".imports = [ nixHome ];
              home-manager.extraSpecialArgs = {
                inherit settings;
                inherit inputs;
              };
           }
          ];
          specialArgs = {
            inherit inputs;
            inherit settings;
          };
        };
      };
      # Otherwise use home manager separately.
      homeConfigurations = {
        user = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            nixHome
            stylix.homeManagerModules.stylix
          ];
          extraSpecialArgs = {
            inherit settings;
            inherit inputs;
          };
        };
      };
    };
}
