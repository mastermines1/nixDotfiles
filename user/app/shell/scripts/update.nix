{ config, lib, pkgs, settings, ... }:

{
  home.packages = with pkgs; [
    # Scripts
    (pkgs.writeScriptBin "update" (''
      #!/usr/bin/env bash

      set -e
      pushd ''+settings.system.dotDir+'' > /dev/null

      case $1 in
        "install")
          echo "Not implemented yet...";;

        "log")
          cat "update.log";;

        "push")
          echo "Pushing to Origin..."
          git push origin main;;

        "test")
          git --no-pager diff -U0
          echo "Building test config..."
          # Add all files to commit so the flake can see them.
          git add -A

          # Build test system. Will use home manager if on another os, and nixos-rebuild if not.

          sudo nixos-rebuild test --flake .#system
          echo "NixOS Test Built OK!";;

        "flake")
          echo "Updating flake lock file..."
          nix flake update .;;

        *)
          git --no-pager diff -U0
          echo "Building config and committing..."
          git add -A
          read -rp "Enter commit message (leave blank for generation number): " msg
          sudo nixos-rebuild switch --flake .#system -I ./hosts/${settings.system.profile}

          # If the user has entered no comit message, generate it.
          if ! [[ -n "$msg" ]]; then
            msg=$(nixos-rebuild list-generations | grep current)
          fi
          git commit -am "$msg"
          echo "NixOS Rebuilt OK!";;
      esac

      popd > /dev/null
    ''))
  ];
}
