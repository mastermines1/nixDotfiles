{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
      (pkgs.writeScriptBin "power-menu" (''
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
    ''))
  ];
}
