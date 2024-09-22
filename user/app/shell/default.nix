{ pkgs, lib, settings, ... }:
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
    c = "clear";
    q = "exit";
    h = "history";
  };
in
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    shellAliases = myAliases;
    history = {
      save = 5000;
      size = 5000;
      path = ''/home/''+settings.user.username+''/.zsh_history'';
      share = true;
      ignoreDups = true;
      ignoreSpace = true;
      ignoreAllDups = true;
      expireDuplicatesFirst = true;
    };
    historySubstringSearch = {
      enable = true;
      searchUpKey = [
        "^[[A"
        "^[OA"
      ];
      searchDownKey = [
        "^[[B"
        "^[OB"
      ];
    };
    plugins = [
      {
        #fzf-tab
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "c7fb028ec0bbc1056c51508602dbd61b0f475ac3";
          sha256 = "061jjpgghn8d5q2m2cd2qdjwbz38qrcarldj16xvxbid4c137zs2";
        };
      }
    ];

    initExtra = ''
    # Set the directory we want to store zinit and plugins
    ZINIT_HOME="''${XDG_DATA_HOME:-''${HOME}/.local/share}/zinit/zinit.git"

    # Download Zinit, if it's not there yet
    if [ ! -d "$ZINIT_HOME" ]; then
       mkdir -p "$(dirname $ZINIT_HOME)"
       git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
    fi

    # Source/Load zinit
    source "''${ZINIT_HOME}/zinit.zsh"

    # Add in snippets
    zinit snippet OMZP::git
    zinit snippet OMZP::sudo
    zinit snippet OMZP::archlinux
    zinit snippet OMZP::aws
    zinit snippet OMZP::kubectl
    zinit snippet OMZP::kubectx
    zinit snippet OMZP::command-not-found

    # Load completions
    autoload -Uz compinit && compinit

    zinit cdreplay -q

    eval "$(oh-my-posh init zsh --config ''+settings.system.dotDir+''/user/app/shell/omp.toml)"

    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

    export PATH=$PATH:/home/''+settings.user.username+''/.config/emacs/bin

    '';
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

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  home.packages = with pkgs; [
    disfetch
    onefetch
    bat
    bottom
    fd
    bc
    tldr
    eza
    fzf
    tree
    feh
    jq
    btop
    ffmpeg
    oh-my-posh
    gh
    git
  ];

  home.sessionVariables = {
    FLAKE = builtins.toString settings.system.dotDir;
  };
}
