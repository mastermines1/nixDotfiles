{...}: {
  services.mako = {
    enable = true;
    settings = {
      borderSize = 2;
      borderRadius = 8;
      defaultTimeout = 5000;
      anchor = "bottom-right";
      output = "HDMI-A-1";
    };
  };
}
