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

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvchad = {
      url = "github:NvChad/starter";
      flake = false;
    };
    nvf.url = "github:notashelf/nvf/v0.7";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    home-manager,
    stylix,
    secrets,
    nixvim,
    nvchad,
    nvf,
    ...
  }: let
    lib = nixpkgs.lib;
    vars = secrets.vars;
  in {

	nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    nixosConfigurations = {
      desktop = let
        settings = {
          dotDir = "/home/${vars.name}/.dotfiles";
          username = vars.name;
          name = vars.name;
          personal-email = vars.personal-email;
          git-email = "85805049+mastermines1@users.noreply.github.com";
          wm = "hyprland";
          dm = "tuigreet";
          theme = "atelier-sulphurpool"; # Find themes at https://tinted-theming.github.io/base16-gallery/
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
                nixvim.homeManagerModules.nixvim
                nvf.homeManagerModules.default
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
