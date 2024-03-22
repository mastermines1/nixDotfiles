{ config, lib, pkgs, settings, ... }:

{
  services.redshift = {
    enable = true;
    tray = true;
    latitude = settings.user.location.lat;
    longitude = settings.user.location.lon;
  };
}
