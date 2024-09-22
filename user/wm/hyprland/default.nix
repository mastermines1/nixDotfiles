{ pkgs, lib, settings, ... }:
{
  imports = [ 
    ../wayland
    ../../app/desktop/waybar
    ./scripts/power-menu.nix
    ./scripts/screenshot-menu.nix
    ./scripts/swaylock-fancy
  ];

  home.packages = with pkgs; [
    xdg-desktop-portal-hyprland
    wl-clipboard
    hyprland-protocols
    grim
    grimblast
    slurp
  ];

  # Hyprland Config
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = { enable = true; };
    systemd.enable = true;

    extraConfig = ''
        monitor=HDMI-A-1,1920x1080@60,0x0,1

        monitor=DP-2,preferred,auto,1

        # Workspase monitor binding
        workspace=1,monitor:HDMI-A-1
        workspace=2,monitor:HDMI-A-1
        workspace=3,monitor:HDMI-A-1
        workspace=4,monitor:HDMI-A-1
        workspace=5,monitor:DP-2
        workspace=6,monitor:DP-2, default:true
        workspace=7,monitor:HDMI-A-1
        workspace=8,monitor:DP-2
        workspace=9,monitor:HDMI-A-1
        workspace=10,monitor:DP-2


        input {
            kb_file=
            kb_layout=gb
            kb_variant=
            kb_model=
            kb_options=
            kb_rules=

            follow_mouse=1

            touchpad {
                natural_scroll=no
            }
        }

        general {
            #sensitivity=1.0 # for mouse cursor
            gaps_in=3
            gaps_out=8
            border_size=2
            #apply_sens_to_raw=0 # whether to apply the sensitivity to raw input (e.g. used by games where you aim using your mouse)
        }
        decoration {
            rounding = 8
            blur {
                enabled = true
                size = 5
                passes = 2
                ignore_opacity = true
            }
        }

        animations {
            enabled=1
            animation=windows,1,7,default
            animation=border,1,10,default
            animation=fade,1,10,default
            animation=workspaces,1,6,default
        }

        dwindle {
            pseudotile=0 # enable pseudotiling on dwindle
            preserve_split=true
        }

        gestures {
            workspace_swipe=no
        }

        # Window swallowing
        misc {
          enable_swallow = true
          swallow_regex = ^(alacritty)$
            disable_hyprland_logo=true
        }

        windowrulev2 = float,class:(floating)
        windowrule=float,com.usebottles.bottles

        # Window rules
        windowrule=monitor 1, WebCord
        windowrule=workspace 5, WebCord
        windowrule=monitor 1, whatsapp
        windowrule=workspace 5, whatsapp
        windowrule=monitor 0, firefox
        windowrule=workspace 2, firefox
        windowrule=size 100 100, Alacritty
        windowrule=monitor 0, Alacritty
        windowrule=workspace 1, Alacritty
        windowrule=monitor 1, Spotify
        windowrule=workspace 6, Spotify

        #Steam window rules
        windowrule=monitor 0, steam
        windowrulev2=workspace 4 silent, title:^(Steam)$
        #windowrule=monitor 0, title:^(Sign in to Steam)$
        windowrulev2=workspace 4 silent, title:^(Sign in to Steam)$
        #windowrule=monitor 0, title:^(Special Offers)$
        windowrulev2=workspace 4 silent, title:^(Special Offers)$
        #windowrulev2=monitor 0 silent, title:^(notificationtoasts_7_desktop)(.*)$
        windowrulev2=workspace 4 silent, class:^(steam_app_)(.*)$


        # Binds
        bind=SUPER,RETURN,exec,alacritty
        bind=SUPER,Q,killactive
        bind=SUPER,L,exec,swaylock-fancy
        bind=SUPERSHIFT,space,exec,hyprctl --batch "dispatch togglefloating active; dispatch resizeactive 100 100"
        bind=SUPER,D,exec,fuzzel
        bind=SUPER,P,pseudo
        bind=SUPER,F,fullscreen
        bind=SUPER,M,exec,firefox
        bind=SUPER,E,exec,emacsclient -c
        bind=SUPERSHIFT,E,exec,power-menu


        # Screenshots
        bind=,Print,exec,hyprctl dispatch exec "[noanim] screenshot-menu"
        #bind=SHIFT,Print,exec,grimblast --notify --cursor copysave area

        bindm=SUPER,mouse:272,movewindow
        bindm=SUPER,mouse:273,resizewindow

        bind=SUPER,left,movefocus,l
        bind=SUPER,right,movefocus,r
        bind=SUPER,up,movefocus,u
        bind=SUPER,down,movefocus,d

        bind=SUPERSHIFT,left,swapwindow,l
        bind=SUPERSHIFT,right,swapwindow,r
        bind=SUPERSHIFT,up,swapwindow,u
        bind=SUPERSHIFT,down,swapwindow,d

        bind=SUPER,1,workspace,1
        bind=SUPER,2,workspace,2
        bind=SUPER,3,workspace,3
        bind=SUPER,4,workspace,4
        bind=SUPER,5,workspace,5
        bind=SUPER,6,workspace,6
        bind=SUPER,7,workspace,7
        bind=SUPER,8,workspace,8
        bind=SUPER,9,workspace,9
        bind=SUPER,0,workspace,10

        bind=SUPERSHIFT,1,movetoworkspacesilent,1
        bind=SUPERSHIFT,2,movetoworkspacesilent,2
        bind=SUPERSHIFT,3,movetoworkspacesilent,3
        bind=SUPERSHIFT,4,movetoworkspacesilent,4
        bind=SUPERSHIFT,5,movetoworkspacesilent,5
        bind=SUPERSHIFT,6,movetoworkspacesilent,6
        bind=SUPERSHIFT,7,movetoworkspacesilent,7
        bind=SUPERSHIFT,8,movetoworkspacesilent,8
        bind=SUPERSHIFT,9,movetoworkspacesilent,9
        bind=SUPERSHIFT,0,movetoworkspacesilent,10

        bind=SUPER,f4,exec,hyprctl kill

        #Autostart
        exec-once=ln -s /run/current-system/sw/bin/bash /bin/bash
        exec-once=waybar
        exec-once=mako
        exec-once=hyprpaper
        exec-once=emacs --daemon
        exec-once=clipse --listen
        exec-once=aw-qt
        exec-once=openrgb --startminimized -p '' + settings.system.dotDir + ''/user/app/OpenRGB/my-profile.orp
        exec-once=[workspace 5 silent] webcord
        exec-once=[workspace 5 silent] whatsapp-for-linux
        exec-once=[workspace 2 silent] firefox
        exec-once=[workspace 4 silent] steam -console
        exec-once=[workspace 1 silent] alacritty
        exec-once=[workspace 6 silent] spotify

        # Fix Steam
        windowrulev2 = stayfocused, title:^()$,class:^(steam)$
        windowrulev2 = minsize 1 1, title:^()$,class:^(steam)$

        # Fix Reaper
        windowrule=noanim,^(REAPER)$
        windowrulev2 = nofocus,class:REAPER,title:^$

    '';
  };
}
