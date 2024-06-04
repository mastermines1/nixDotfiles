{ lib, pkgs, settings, ... }:

{
  home.packages = with pkgs; [
    nh
    # Scripts
    (pkgs.writeScriptBin "update" (''
      #!/usr/bin/env bash

      set -e
      pushd ''+settings.system.dotDir+'' > /dev/null

      case $1 in
        "install")
          echo "Not implemented yet...";;

        "history")
          git log -p $2;;

        "push")
          echo "Pushing to Origin..."
          git push origin main;;

        "pull")
          echo "Pulling from Origin..."
          git pull;;

        "test")
          # Add all files to commit so the flake can see them.
          git add -A
          ${nh}/bin/nh os test . -H system $2;;

        "flake")
          echo "Updating flake lock file..."
          nix flake update .;;

        *)
          git add -A
          read -rp "Enter commit message (leave blank for generation number): " msg
          ${nh}/bin/nh os switch . -H system $1

          # If the user has entered no comit message, generate it.
          if ! [[ -n "$msg" ]]; then
            msg=$(nixos-rebuild list-generations | grep current)
          fi
          git commit -am "$msg"
      esac

      popd > /dev/null
    ''))
  ];
}
