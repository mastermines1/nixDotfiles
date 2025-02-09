{
  pkgs,
  lib,
  settings,
  ...
}: let
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
in {
  home.packages = with pkgs; [
    disfetch
    onefetch
    bat
    fd
    bc
    tldr
    eza
    feh
    btop
    fzf
    lazygit
  ];
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autocd = true;
      shellAliases = myAliases;
      history = {
        save = 5000;
        size = 5000;
        path = ''/home/${settings.username}/.zsh_history'';
        share = true;
        ignoreDups = true;
        ignoreSpace = true;
        ignoreAllDups = true;
        expireDuplicatesFirst = true;
        extended = true;
        ignorePatterns = ["c" "q"];
      };
      # historySubstringSearch = {
      #   enable = true;
      #   searchUpKey = [
      #     "^[[A"
      #     "^[OA"
      #   ];
      #   searchDownKey = [
      #     "^[[B"
      #     "^[OB"
      #   ];
      # };

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
        bindkey "^[[1;5C" forward-word
        bindkey "^[[1;5D" backward-word

        autoload -U compinit; compinit
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      '';
    };

    bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = myAliases;
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
      enableTransience = true;
      settings = {
        add_newline = false;
      };
    };

    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };

    tmux = {
      enable = true;
      clock24 = true;
      mouse = true;
      prefix = "C-Space";
      keyMode = "vi";
      baseIndex = 1;
      escapeTime = 0;
      newSession = true;
      plugins = with pkgs.tmuxPlugins; [
        vim-tmux-navigator
        catppuccin
      ];
      extraConfig = "set-option -sa terminal-overrides ',xterm*:Tc'
			bind -n M-H previous-window
			bind -n M-L next-window
			set -g renumber-windows on

			set -g default-terminal 'tmux-256color'
			# DESIGN TWEAKS
			set -g status-position top
			set -g @catppuccin_flavor 'mocha'
			set -g @catppuccin_window_status_style 'rounded'
			set -g @catppuccin_window_status 'no'
			set -g @catppuccin_window_default_text '#W'
			set -g @catppuccin_window_current_fill 'number'
			set -g @catppuccin_window_current_text '#W'
			";
    };
  };
}
