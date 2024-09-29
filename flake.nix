{
  description = "New and improved nix flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    secrets = {
      url = "git+ssh://git@github.com/Mastermines1/nix-secrets?ref=main";
      flake = true;
    };

    zen-browser.url = "github:MarceColl/zen-browser-flake";
    stylix.url = "github:danth/stylix";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, comin, stylix, musnix, secrets, ... }:
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
            git-email = vars.git-email;
            wm = "hyprland";
            dm = "gdm";
            #theme = "gruvbox-material-dark-soft"; # Find themes at https://tinted-theming.github.io/base16-gallery/
            #wallpaper = ./wallpapers/purple-landscape.jpeg;
            #reThemeWall = true;
            loc = vars.loc;
          };
        in lib.nixosSystem {
          modules = [
            ./hosts/desktop/default.nix
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."${vars.name}".imports = [ ./hosts/desktop/home.nix ];
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