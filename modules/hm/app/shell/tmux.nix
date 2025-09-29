{
  pkgs,
  lib,
  settings,
  ...
}:
{
programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    prefix = "C-Space";
    keyMode = "vi";
    baseIndex = 1;
    escapeTime = 0;
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
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

    bind r source-file \"~/.config/tmux/tmux.conf\"
  	";
  };
}
