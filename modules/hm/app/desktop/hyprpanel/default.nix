{ inputs, pkgs, ... }:
{
	home.packages = [
    inputs.hyprpanel.packages.${pkgs.system}.default
	];

	home.file.".config/hyprpanel/config.json".source = ./config.json;
}

