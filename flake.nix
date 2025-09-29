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
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    stylix,
    secrets,
    ...
  }: let
    lib = nixpkgs.lib;
    vars = secrets.vars;
  in {
    nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    nixosConfigurations = {
      desktop = let
        settings = {
          profile = "desktop";
          dotDir = "/home/${vars.name}/.dotfiles";
          username = vars.name;
          name = vars.name;
          personal-email = vars.personal-email;
          git-email = "85805049+mastermines1@users.noreply.github.com";
          wm = "hyprland";
          bar = "waybar";
          dm = "tuigreet";
          theme = "catppuccin-mocha";
          wallpaper = "";
          loc = vars.loc;
          editor = "nvim";
        };
      in
        lib.nixosSystem {
          modules = [
            ./profiles/desktop/default.nix
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."${vars.name}".imports = [
                ./profiles/desktop/home.nix
              ];
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
      mac = let
        settings = {
          profile = "desktop";
          dotDir = "/home/${vars.name}/.dotfiles";
          username = vars.name;
          name = vars.name;
          personal-email = vars.personal-email;
          git-email = "85805049+mastermines1@users.noreply.github.com";
          wm = "hyprland";
          bar = "waybar";
          dm = "tuigreet";
          theme = "catppuccin-mocha";
          wallpaper = "";
          loc = vars.loc;
          editor = "nvim";
        };
      in
        lib.nixosSystem {
          modules = [
            ./profiles/mac/default.nix
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."${vars.name}".imports = [
                ./profiles/desktop/home.nix
              ];
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
      laptop = let
        settings = {
          profile = "laptop";
          dotDir = "/home/${vars.name}/.dotfiles";
          username = vars.name;
          name = vars.name;
          personal-email = vars.personal-email;
          git-email = "85805049+mastermines1@users.noreply.github.com";
          wm = "hyprland";
          bar = "waybar";
          dm = "tuigreet";
          theme = "catppuccin-mocha";
          wallpaper = "";
          loc = vars.loc;
          editor = "nvim";
        };
      in
        lib.nixosSystem {
          modules = [
            ./profiles/laptop/default.nix
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."${vars.name}".imports = [
                ./profiles/laptop/home.nix
              ];
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
      laptop_GNOME = let
        settings = {
          profile = "laptop_GNOME";
          dotDir = "/home/${vars.name}/.dotfiles";
          username = vars.name;
          name = vars.name;
          personal-email = vars.personal-email;
          git-email = "85805049+mastermines1@users.noreply.github.com";
          wm = "hyprland";
          bar = "waybar";
          dm = "gdm";
          theme = "catppuccin-mocha";
          wallpaper = "";
          loc = vars.loc;
          editor = "nvim";
        };
      in
        lib.nixosSystem {
          modules = [
            ./profiles/laptop_GNOME/default.nix
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users."${vars.name}".imports = [
                ./profiles/laptop_GNOME/home.nix
              ];
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
