{
  config,
  lib,
  pkgs,
  ...
}: let
  coverart = pkgs.stdenv.mkDerivation {
    pname = "coverart";
    version = "0.0.1";

    src = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/CogentRedTester/mpv-coverart/refs/heads/master/coverart.lua";
      sha256 = "sha256-44Dhvi22E9/3lkyqbxWTN2P7M4ZMll0ZJD/hQ4QWasc=";
    };

    dontBuild = true;
    dontUnpack = true;

    buildInputs = [];

    installPhase = ''install -Dm644 $src $out/share/mpv/scripts/coverart.lua'';

		passthru.scriptName = "coverart.lua";
  };
in {
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      sponsorblock
      quality-menu
      reload
      autoload
      mpv-cheatsheet
      mpv-playlistmanager
      webtorrent-mpv-hook
      coverart
    ];
  };
}
