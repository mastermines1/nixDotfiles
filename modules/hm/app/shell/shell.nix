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
      path = ''/home/${settings.username}/.zsh_history'';
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

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableTransience = true;
    settings = {
      add_newline = false;
    };
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
    fd
    bc
    tldr
    eza
    tree
    feh
    jq
    btop
    comma
    fzf
  ];

	programs.tmux = { 
		enable = true;
		clock24 = true;
		mouse = true;
		prefix = "C-Space";
		keyMode = "vi";
		baseIndex = 1;
		escapeTime = 0;
		newSession = true;
		plugins = with pkgs.tmuxPlugins; [
			yank
			vim-tmux-navigator
		];
		extraConfig = 
			"set-option -sa terminal-overrides \",xterm*:Tc\"
			bind -n M-H previous-window
			bind -n M-L next-window
			# DESIGN TWEAKS

			# don't do anything when a 'bell' rings
			set -g visual-activity off
			set -g visual-bell off
			set -g visual-silence off
			setw -g monitor-activity off
			set -g bell-action none
			
			# clock mode
			setw -g clock-mode-colour yellow
			
			# copy mode
			setw -g mode-style 'fg=black bg=red bold'
			
			# panes
			set -g pane-border-style 'fg=red'
			set -g pane-active-border-style 'fg=yellow'
			
			# statusbar
			set -g status-position top
			set -g status-justify left
			set -g status-style 'fg=red'
			
			set -g status-left ''
			set -g status-left-length 10
			
			set -g status-right-style 'fg=black bg=yellow'
			set -g status-right ''
			set -g status-right-length 50
			
			setw -g window-status-current-style 'fg=black bg=red'
			setw -g window-status-current-format ' #I #W #F '
			
			setw -g window-status-style 'fg=red bg=black'
			setw -g window-status-format ' #I #[fg=white]#W #[fg=yellow]#F '
			
			setw -g window-status-bell-style 'fg=yellow bg=red bold'
			
			# messages
			set -g message-style 'fg=yellow bg=red bold'

			";
	};

}
