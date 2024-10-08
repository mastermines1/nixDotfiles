{ config, lib, pkgs, settings, ... }:

{
  services.gammastep = {
    enable = true;
    temperature.night = 3500;
    temperature.day = 6500;
    latitude = settings.location.lat;
    longitude = settings.location.lon;
  };
}
