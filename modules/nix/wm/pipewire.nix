{pkgs, ...}: {
  # Enable sound with pipewire.
  #sound.enable = true;
  services.pulseaudio.enable = false;
  services.pulseaudio.package = pkgs.pulseaudioFull;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  environment.systemPackages = with pkgs; [
    pavucontrol
    helvum
  ];
}
