{ config, pkgs, ... }:
let
  colours = config.lib.stylix.colors;
  moduleConfig = {
    clock = {
      interval = 1;
      format = "{:%H:%M:%S}";
      max-length = 25;
      tooltip = true;
      tooltip-format = "{:%d-%m-%Y}";
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
      exec = "~/.dotfiles/user/app/desktop/waybar/scripts/cavaw -b 16";
      return-type = "json";
      on-click = "spotifycli --playpause";
      on-scroll-up = "spotifycli --prev";
      on-scroll-down = "spotifycli --next";
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
  programs.waybar = {
    enable = true;
    settings = {
      leftBar = {
        height = 15;
        layer = "top";
        position = "top";
        output = "HDMI-A-1";
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "custom/music" ];
        modules-right = [ "wireplumber" "clock" ];
        inherit (moduleConfig) wireplumber clock network "hyprland/workspaces" "custom/music";
      };

      rightBar = {
        layer = "top";
        position = "top";
        output = "DP-2";
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ ];
        inherit (moduleConfig) clock "hyprland/workspaces";
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
