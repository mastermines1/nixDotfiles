{
  pkgs,
  lib,
  settings,
  ...
}: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    prefix = "C-Space";
    keyMode = "vi";
    baseIndex = 1;
    escapeTime = 0;
    plugins = with pkgs.tmuxPlugins; [
    ];
    extraConfig = "
    set -g renumber-windows on
    set -g status-position top
    set -g status 2
    set -g status-justify absolute-centre
    set -g status-style \"bg=default\"
    set -g status-format\[1\] \"\"
    set -g window-status-current-format \"#I:#W\"
    set -g window-status-format \"#I:#W\"
    set -g window-status-current-style \"fg=blue bold\"
    set -g window-status-style \"bg=default\"
    set -g status-right \"\"
    set -g status-left \"#S\"
		bind r source ~/.config/tmux/tmux.conf

unbind C-h
unbind C-j
unbind C-k
unbind C-l

# Smart pane switching with awareness of Vim splits.
# See: https://github.com/christoomey/vim-tmux-navigator
vim_pattern='(\\S+/)?g?\\.?(view|l?n?vim?x?|fzf)(diff)?(-wrapped)?'
is_vim=\"ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +\${vim_pattern}$'\"
bind-key -n 'C-h' if-shell \"$is_vim\" 'send-keys C-h'  'select-pane -L'
bind-key -n 'C-j' if-shell \"$is_vim\" 'send-keys C-j'  'select-pane -D'
bind-key -n 'C-k' if-shell \"$is_vim\" 'send-keys C-k'  'select-pane -U'
bind-key -n 'C-l' if-shell \"$is_vim\" 'send-keys C-l'  'select-pane -R'


bind-key -T copy-mode-vi 'C-h' select-pane -L
bind-key -T copy-mode-vi 'C-j' select-pane -D
bind-key -T copy-mode-vi 'C-k' select-pane -U
bind-key -T copy-mode-vi 'C-l' select-pane -R
  	";
  };
}
