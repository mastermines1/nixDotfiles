{ pkgs, settings, ... }:
let
  # My shell aliases
  myAliases = {
    cat = "bat";
    htop = "btm";
    fd = "fd -Lu";
    gitfetch = "onefetch";
    neofetch = "disfetch";
    ls = "eza";
    #update = "sudo nixos-rebuild switch --flake ~/.dotfiles#system";
    # update-test = "sudo nixos-rebuild test --flake ~/nixos/flake.nix#system";
    # update-flake = "nix flake update ~/nixos && sudo nixos-rebuild switch --flake ~/nixos/flake.nix#system";
    # update-list = "nixos-rebuild dry-build --flake ~/nixos/flake.nix#system";
    cd = "z";
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
      eval $(thefuck --alias)
      export PATH=$PATH:/home/milesc/.config/emacs/bin 
      export PATH=$PATH:
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
    plocate
  ];

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
}

