{ pkgs, lib, settings, ... }:
{
  imports = [ 
    ../wayland
    ../../app/desktop/waybar
  ];

  home.packages = with pkgs; [
    xdg-desktop-portal-hyprland
    wl-clipboard
    hyprland-protocols
    wl-clipboard
    grim
    grimblast
    slurp
    (pkgs.writeScriptBin "power-menu" ''
        #!/usr/bin/env bash

        option0="󰏥 Suspend"
        option1="󰐥 Shutdown"
        option2="󰜉 Reboot"
        option3=" Windows"

        options="$option0\n$option1\n$option2\n$option3"

        chosen="$(echo -e "$options" | fuzzel --lines 4 --dmenu)"
        case $chosen in
            $option0)
                systemctl suspend;;
            $option1)
                systemctl poweroff;;
            $option2)
                systemctl reboot;;
            $option3)
                systemctl reboot --boot-loader-entry=auto-windows;;
        esac
    '')
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
        workspace=6,monitor:DP-2
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
            sensitivity=1.0 # for mouse cursor
            gaps_in=3
            gaps_out=8
            border_size=2
#            col.active_border=0x66ee1111
#            col.inactive_border=0x66333333
#!/usr/bin/env bash
            apply_sens_to_raw=0 # whether to apply the sensitivity to raw input (e.g. used by games where you aim using your mouse)
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
        }

        # Window rules
        windowrule=monitor 1,discord
        windowrule=workspace 5,discord
        windowrule=monitor 1,webcord
        windowrule=workspace 5,webcord
        windowrule=monitor 1,whatsapp
        windowrule=workspace 5,whatsapp
        windowrule=monitor 0,firefox
        windowrule=workspace 2,firefox
        windowrule=monitor 0, alacritty
        windowrule=workspace 1, alacritty
        windowrule=monitor 0, steam
        windowrule=workspace 4, steam
	windowrule=monitor 1, spotify
	windowrule=workspace 6, spotify

        windowrule=float,com.usebottles.bottles

        # Binds
        bind=SUPER,RETURN,exec,alacritty
        bind=SUPER,Q,killactive
        bind=SUPER,L,exit
        bind=SUPERSHIFT,space,togglefloating
        bind=SUPER,D,exec,fuzzel
        bind=SUPER,P,pseudo
        bind=SUPER,F,fullscreen
        bind=SUPER,M,exec,firefox
        bind=SUPER,E,exec,"emacsclient -c"
        bind=SUPERSHIFT,E,exec,power-menu
        bind=SUPER,V,exec,mpv $(wl-paste) & notify-send "Opening $(wl-paste) in mpv."

        # Screenshots
        bind=,Print,exec,grimblast --notify --cursor copy active
        bind=SHIFT,Print,exec,grimblast --notify --cursor copysave active
        bind=SUPER,S,exec,grimblast --notify --cursor copy area
        bind=SUPERSHIFT,S,exec,grimblast --notify --cursor copysave area

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

        bind=SUPER,mouse_down,workspace,e+1
        bind=SUPER,mouse_up,workspace,e-1
        bind=SUPER,f4,exec,hyprctl kill

        #Autostart
        exec-once=waybar
        exec-once=mako
        exec-once=hyprpaper
        exec-once=emacs --daemon
        exec-once=aw-qt
        exec-once=webcord
        exec-once=whatsapp-for-linux
        exec-once=firefox
        exec-once=steam
        exec-once=alacritty
        exec-once=spotify

        # Fix Steam
        windowrulev2 = stayfocused, title:^()$,class:^(steam)$
        windowrulev2 = minsize 1 1, title:^()$,class:^(steam)$

        # Fix Reaper
        windowrule=noanim,^(REAPER)$
        windowrulev2 = nofocus,class:REAPER,title:^$

    '';
  };
}
