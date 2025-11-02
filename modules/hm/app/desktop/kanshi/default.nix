{pkgs, ...}: {
  services.kanshi = {
    enable = true;

    profiles = {
      undocked = {
        outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
          }
        ];
      };
      docked = {
        outputs = [
          {
            criteria = "DP-1";
						mode = "3840x1600";
						position = "0,0";
            status = "enable";
						scale = 1.5;
          }
          {
            criteria = "eDP-1";
            status = "enable";
          }
        ];
      };
    };
  };
}
