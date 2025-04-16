{
  pkgs,
lib,
config,
...
}: {
  services.mpd= {
    enable = true;
    package = pkgs.mpd;
    musicDirectory = "${config.home.homeDirectory}/Music";
    playlistDirectory = "${config.home.homeDirectory}/Music/Playlists";
  };
	services.mpd-mpris = {
		enable = true;
		mpd.useLocal = true;
	};
	home.packages = with pkgs; [
		inori
		mpc-cli
		beets
	];

	home.file.".config/inori/config.toml".text = ''
		qwerty_keybindings = true
		[keybindings]
		toggle_playpause = ["<space>", "p"]
		previous_song = "H"
		next_song = "L"
		# seek = "<right>"
		# seek_backwards = "<left"
		# toggle_panel = "f"
		# fold = "K"
	'';
}
