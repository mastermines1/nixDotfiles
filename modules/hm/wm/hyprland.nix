{pkgs, lib, settings, osConfig, ...}:

{
  imports = [
    ./scripts/power-menu.nix
    ./scripts/screenshot-menu.nix
    ./scripts/swaylock-fancy
    ./wayland.nix
    ../app/desktop/waybar.nix
  ];
  
  home.packages = with pkgs; [
    xdg-desktop-portal-hyprland
    wl-clipboard
    hyprland-protocols
    grim
    grimblast
    slurp
  ];

  services.copyq.enable = true;

  # Config
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {

      # Define monitors
      monitor = if (osConfig.networking.hostName == settings.userName + "-destkop") then [
        "HDMI-A-1,preferred,0x0,1"
        "DP-2,preferred,auto,1"
      ] else[];
      
      # Define workspaces
      workspace = if (osConfig.networking.hostName == settings.userName + "-desktop") then [
        "1,monitor:HDMI-A-1"
        "2,monitor:HDMI-A-1"
        "3,monitor:HDMI-A-1"
        "4,monitor:HDMI-A-1"
        "5,monitor:DP-2"
        "6,monitor:DP-2, default:true"
        "7,monitor:HDMI-A-1"
        "8,monitor:DP-2"
        "9,monitor:HDMI-A-1"
        "10,monitor:DP-2"
      ] else [];

      input = {
        kb_layout="gb";
        follow_mouse = 1;
        touchpad = [
          natural_scroll = "no";
        ];
      };

      general= {
        gaps_in = 3;
        gaps_out = 7;
        border_size = 2;
      };

      decoration = {
        rounding = 8;
        blur = {
          enabled = true;
          size = 5;
          passes = 2;
          new_optimizations = true;
          ignore_opacity = true;
          xray = true;
          popups = true;
        };
      };

      animations = {
        enabled = 1;
        animation = [
          "windows,1,7,default"
          "border,1,10,default"
          "fade,1,10,default"
          "workspaces,1,6,default"
        ]
      };

      dwindle = {
        pseudotile = 0; # enable pseudotiling on dwindle
        preserve_split = true;
      };

      misc = {
        disable_splash_rendering = true;
        disable_hyprland_logo = true;
      };

      exec-once = [
        "waybar"
        "mako"
        "sleep 5 && emacs --daemon"
        "[workspace 5 silent] webcord"
        "[workspace 5 silent] whatsapp-for-linux"
        "[workspace 2 silent] zen"
        "[workspace 4 silent] steam -console"
        "[workspace 6 silent] spotify"
        "[workspace 1 silent] alacritty"
      ];

      windowrule = [
        "monitor 1, WebCord"
        "workspace 5, WebCord"
        "monitor 1, whatsapp"
        "workspace 5, whatsapp"
        "monitor 0, zen"
        "workspace 2, zen"
        "monitor 0, Alacritty"
        "workspace 1, Alacritty"
        "monitor 1, Spotify"
        "workspace 6, Spotify"

        "monitor 0, steam"
        "workspace 4 silent, title:^(Steam)$"
        "monitor 0, title:^(Sign in to Steam)$"
        "workspace 4 silent, title:^(Sign in to Steam)$"
        "monitor 0, title:^(Special Offers)$"
        "workspace 4 silent, title:^(Special Offers)$"
        "monitor 0 silent, title:^(notificationtoasts_7_desktop)(.*)$"
        "workspace 4 silent, class:^(steam_app_)(.*)$"
      ];

      binds = [
        "SUPER,RETURN,exec,alacritty"
        "SUPER,Q,killactive"
        "SUPER,L,exec,swaylock-fancy"
        "SUPERSHIFT,space,exec,hyprctl --batch "dispatch togglefloating active; dispatch resizeactive 100 100""
        "SUPER,D,exec,fuzzel"
        "SUPER,P,pseudo"
        "SUPER,F,fullscreen"
        "SUPER,M,exec,zen"
        "SUPER,E,exec,emacsclient -c"
        "SUPERSHIFT,E,exec,power-menu"

        # Screenshots
        ",Print,exec,hyprctl dispatch exec "[noanim] screenshot-menu""

        "SUPER,left,movefocus,l"
        "SUPER,right,movefocus,r"
        "SUPER,up,movefocus,u"
        "SUPER,down,movefocus,d"

        "SUPER,1,workspace,1"
        "SUPER,2,workspace,2"
        "SUPER,3,workspace,3"
        "SUPER,4,workspace,4"
        "SUPER,5,workspace,5"
        "SUPER,6,workspace,6"
        "SUPER,7,workspace,7"
        "SUPER,8,workspace,8"
        "SUPER,9,workspace,9"
        "SUPER,0,workspace,10"

        "SUPERSHIFT,1,movetoworkspacesilent,1"
        "SUPERSHIFT,2,movetoworkspacesilent,2"
        "SUPERSHIFT,3,movetoworkspacesilent,3"
        "SUPERSHIFT,4,movetoworkspacesilent,4"
        "SUPERSHIFT,5,movetoworkspacesilent,5"
        "SUPERSHIFT,6,movetoworkspacesilent,6"
        "SUPERSHIFT,7,movetoworkspacesilent,7"
        "SUPERSHIFT,8,movetoworkspacesilent,8"
        "SUPERSHIFT,9,movetoworkspacesilent,9"
        "SUPERSHIFT,0,movetoworkspacesilent,10"

        "SUPER,f4,exec,hyprctl kill"
      ];

      bindm = [
        "SUPER,mouse:272,movewindow"
        "SUPER,mouse:273,resizewindow"
      ];
    };
  };
}