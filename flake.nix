{
  description = "New and improved nix flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    secrets = {
      url = "git+ssh://git@github.com/mastermines1/nix-secrets";
      flake = true;
    };

    zen-browser = {
      url = "github:MarceColl/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };  
    stylix.url = "github:danth/stylix";

    nil = {
      url = "github:oxalica/nil";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, nixpkgs, home-manager, stylix, secrets, nil, ... }:
    let      
      inherit (self) outputs;
      lib = nixpkgs.lib;
      vars = secrets.vars;
    in{
      nixosConfigurations = {
        desktop = let
          system = "x86_64-linux";
          pkgs = nixpkgs;
          settings = {
            dotDir = "/home/${vars.name}/.dotfiles";
            username = vars.name;
            name = vars.name;
            personal-email = vars.personal-email;
            git-email = "85805049+mastermines1@users.noreply.github.com";
            wm = "hyprland";
            dm = "gdm";
            theme = "atelier-sulphurpool"; # Find themes at https://tinted-theming.github.io/base16-gallery/
            wallpaper = "";
            loc = vars.loc;
          };
        in lib.nixosSystem {
          modules = [
            ./profiles/desktop/default.nix
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."${vars.name}".imports = [ ./profiles/desktop/home.nix ];
              home-manager.extraSpecialArgs = {
                inherit inputs;
                inherit settings;
              };
            }
          ];
          specialArgs = {
            inherit inputs;
            inherit settings;
          };
        };
      };
    };
}