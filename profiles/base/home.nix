{
  lib,
  config,
  pkgs,
  settings,
  ...
}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
}
