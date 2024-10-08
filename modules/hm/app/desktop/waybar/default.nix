{ config, pkgs, ... }:
let
  colours = config.lib.stylix.colors;
  moduleConfig = {
    "clock#time" = {
      interval = 1;
      format = "{:%H:%M:%S}";
      min-length = 7;
      max-length = 7;
      tooltip = true;
      tooltip-format = "{:%d-%m-%Y}";
    };
    "clock#date" = {
      format = "{:%d/%m/%y}";
      tooltip.enable = true;
      tooltip.format = "{:A}";
    };
    wireplumber = {
      scroll-step = 5;
      on-click = "pavucontrol";
      on-click-right = "amixer set Master toggle";
    };
    network = {
      interval = 1;
      format-wifi = "{icon}  {bandwidthTotalBits}";
      format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
      format-disconnected = "󰤭";
      tooltip-format = "{ifname} via {gwaddr}";
      tooltip-format-wifi = "{essid} ({signalStrength}%) on {ifname}";
      tooltip-format-disconnected = "Disconnected";
    };

    "custom/music" = {
      format = "{icon}{}";
      format-icons = {
        Paused = "";
        Stopped = "&#x202d;ﭥ ";
      };
      escape = true;
      tooltip = true;
      exec = "cavay -b 16";
      return-type = "json";
      on-click = "${pkgs.spotify-cli-linux}/bin/spotifycli --playpause";
      on-scroll-up = "${pkgs.spotify-cli-linux}/bin/spotifycli --prev";
      on-scroll-down = "${pkgs.spotify-cli-linux}/bin/spotifycli --next";
      #on-click-right = "g4music";
      max-length = 35;
    };

    "hyprland/workspaces" = {
      format = "{icon}";
      on-click = "activate";
      persistent-workspaces = {
        HDMI-A-1 = [ 1 2 3 4 7 9 ];
        DP-2 = [ 5 6 8 10 ];
      };
      format-icons = {
        active = "";
        default = "";
        empty = "";
      };
    };
  };

in{

  imports = [
    ./scripts/cavay.nix
  ];

  programs.waybar = {
    enable = true;
    settings = {
      leftBar = {
        height = 15;
        layer = "top";
        position = "top";
        output = "HDMI-A-1";
        modules-left = [ "tray" ];
        modules-center = [ "custom/music" ];
        modules-right = [ "wireplumber" "clock#time" ];
        inherit (moduleConfig) wireplumber "clock#time" network "hyprland/workspaces" "custom/music";
      };

      rightBar = {
        layer = "top";
        position = "top";
        output = "DP-2";
        modules-left = [ ];
        modules-center = [ "clock#time" ];
        modules-right = [ "clock#date" ];
        inherit (moduleConfig) "clock#time" "clock#date" "hyprland/workspaces";
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0 0 10px 10px;
        font-size: 15px;
        min-height: 10px;
      }
''+(builtins.readFile ./style.css);
  };
  home.file.".config/waybar/colours.css".text = ''
    @define-color base00 #''+colours.base00+'';
    @define-color base01 #''+colours.base01+'';
    @define-color base02 #''+colours.base02+'';
    @define-color base03 #''+colours.base03+'';
    @define-color base04 #''+colours.base04+'';
    @define-color base05 #''+colours.base05+'';
    @define-color base06 #''+colours.base06+'';
    @define-color base07 #''+colours.base07+'';
    @define-color base08 #''+colours.base08+'';
    @define-color base09 #''+colours.base09+'';
    @define-color base0A #''+colours.base0A+'';
    @define-color base0B #''+colours.base0B+'';
    @define-color base0C #''+colours.base0C+'';
    @define-color base0D #''+colours.base0D+'';
    @define-color base0E #''+colours.base0E+'';
    @define-color base0F #''+colours.base0F+'';
  '';
}
