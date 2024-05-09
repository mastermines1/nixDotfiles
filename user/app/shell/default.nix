{ pkgs, settings, ... }:
let
  # My shell aliases
  myAliases = {
    cat = "bat";
    htop = "btop";
    fd = "fd -Lu";
    gitfetch = "onefetch";
    neofetch = "disfetch";
    ls = "eza";
    cd = "z";
    df = "df -h";
  };
in
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = myAliases;
    initExtra = ''
      export PATH=$PATH:/home/milesc/.config/emacs/bin
      cbonsai -p --message=$(date +%H:%M)
    '';
    oh-my-zsh = {
      enable = true;
      plugins = [ "sudo" "git" ];
      theme = "bira";
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
    disfetch
    onefetch
    bat
    bottom
    fd
    bc
    direnv
    nix-direnv
    tldr
    eza
    fzf
    tree
    feh
    jq
    btop
    nh

  ];

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
}
