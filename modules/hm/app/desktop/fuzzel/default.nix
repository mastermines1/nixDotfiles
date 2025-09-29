{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.fuzzel = {
  enable = true;
	settings = {
		main = {
		width = 60;
		};
	};
	};
}
