{}:
{
  imports = [ 
   ./fonts.nix
  ];

  services.xserver = {
    enable = true;
  };
}
