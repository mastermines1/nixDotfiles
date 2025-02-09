{
  pkgs,
  lib,
  settings,
  osConfig,
  ...
}: {
  imports = [
    ./scripts/power-menu.nix
    ./wayland.nix
    ../app/desktop/waybar
  ];

  home.packages = with pkgs; [
    xdg-desktop-portal-hyprland
    wl-clipboard
    slurp
		hyprshot
  ];

  services.copyq.enable = true;

  # Config
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      # Define monitors
      monitor =
        if (osConfig.networking.hostName == settings.username + "-destkop")
        then [
          "HDMI-A-1,preferred,0x0,1"
          "HDMI-A-2,preferred,1920x0,1"
        ]
        else [];

      # Define workspaces
      workspace =
        if (osConfig.networking.hostName == settings.username + "-desktop")
        then [
          "1,monitor:HDMI-A-1"
          "2,monitor:HDMI-A-1"
          "3,monitor:HDMI-A-1"
          "4,monitor:HDMI-A-1"
          "5,monitor:HDMI-A-2"
          "6,monitor:HDMI-A-2, default:true"
          "7,monitor:HDMI-A-1"
          "8,monitor:HDMI-A-2"
          "9,monitor:HDMI-A-1"
          "10,monitor:HDMI-A-2"
        ]
        else [];

      input = {
        kb_layout = "gb";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = "no";
        };
      };

      general = {
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
        };
        shadow.enabled = false;
      };

      animations = {
        enabled = 1;
        animation = [
          "windows,1,7,default"
          "border,1,10,default"
          "fade,1,10,default"
          "workspaces,1,6,default"
        ];
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
        "openrgb --minimized"
        "sleep 5 && emacs --daemon"
        "[workspace 5 silent] discord"
        "[workspace 5 silent] wasistlos"
        "[workspace 2 silent] zen"
        "[workspace 4 silent] steam -console"
        "[workspace 6 silent] spotify"
        "[workspace 1 silent] alacritty"
      ];

      windowrule = [
        # "monitor 1, discord"
        # "workspace 5, discord"
        # "monitor 1, wasistlos"
        # "workspace 5, wasistlos"
        # "monitor 0, zen"
        # "workspace 2, zen"
        # "monitor 0, Alacritty"
        # "workspace 1, Alacritty"
        # "monitor 1, Spotify"
        # "workspace 6, Spotify"

        # "monitor 0, steam"
        # "workspace 4 silent, steam"
        "monitor 0, title:^(Sign in to Steam)$"
        "workspace 4 silent, title:^(Sign in to Steam)$"
        "monitor 0, title:^(Special Offers)$"
        "workspace 4 silent, title:^(Special Offers)$"
        "monitor 0 silent, nofocus, noinitalfocus, title:^(notificationtoasts_7_desktop)(.*)$"
        "workspace 4 silent, class:^(steam_app_)(.*)$"
      ];

      bind = [
        "SUPER,RETURN,exec,alacritty"
        "SUPER,Q,killactive"
        "SUPER,L,exec,${pkgs.swaylock-fancy}"
        "SUPERSHIFT,space,exec,hyprctl --batch \"dispatch togglefloating active; dispatch resizeactive 100 100\""
        "SUPER,D,exec,fuzzel"
        "SUPER,P,pseudo"
        "SUPER,F,fullscreen"
        "SUPER,M,exec,zen"
        "SUPER,E,exec,emacsclient -c"
        "SUPERSHIFT,E,exec,power-menu"

        # Screenshots
        ",Print,exec,hyprshot -m region --clipboard-only -z"
        "SUPER,Print,exec,hyprshot -m region -z -o ~/Pictures/Screenshots"

        "SUPER,h,movefocus,l"
        "SUPER,l,movefocus,r"
        "SUPER,j,movefocus,u"
        "SUPER,k,movefocus,d"

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
