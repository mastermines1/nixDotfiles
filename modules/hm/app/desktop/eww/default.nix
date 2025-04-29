{
  pkgs,
  settings,
  ...
}: {
	programs.eww = {
		enable = true;
		# configDir = ./config/${settings.profile};
	};
}
