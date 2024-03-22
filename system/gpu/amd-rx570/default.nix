{ config, lib, pkgs, ... }:

{
  hardware.opengl = {
    # Mesa
    enable = true;
    ## radv: an open-source Vulkan driver from freedesktop
    driSupport = true;
    driSupport32Bit = true;

    ## amdvlk: an open-source Vulkan driver from AMD
    extraPackages = [ pkgs.amdvlk ];
    extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
  };
  environment.variables = {
    ROC_ENABLE_PRE_VEGA = "1";
  };
}
