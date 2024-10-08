{pkgs, lib, settings, ...}:

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
      extended = true;
      ignorePatterns = ["c" "q"];
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
    initExtra = ''
    PROMPT=" ◉ %U%F{magenta}%n%f%u@%U%F{blue}%m%f%u:%F{yellow}%~%f
     %F{green}→%f "
    RPROMPT="%F{red}▂%f%F{yellow}▄%f%F{green}▆%f%F{cyan}█%f%F{blue}▆%f%F{magenta}▄%f%F{white}▂%f"
    [ $TERM = "dumb" ] && unsetopt zle && PS1='$ '
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

  programs.nh = {
    enable = true;
    flake = settings.dotDir;
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
    tree
    feh
    jq
    btop
  ];
}