{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
      (pkgs.writeScriptBin "screenshot-menu" (''
        #!/usr/bin/env bash

        option0="Copy area"
        option1="Save area"
        option2="Current monitor"
        option3="Both monitors"

        options="$option0\n$option1\n$option2\n$option3"

        chosen="$(echo -e "$options" | fuzzel --lines 4 --dmenu)"
        case $chosen in
            $option0)
                grimblast --notify --cursor copy area;;
            $option1)
                grimblast --notify --cursor copysave area;;
            $option2)
                sleep 0.1 && grimblast --notify copy output;;
            $option3)
                sleep 0.1 && grimblast --notify copy screen;;
        esac
    ''))
  ];
}
