# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-open'
set -g @plugin 'tmux-plugins/tmux-online-status'
set -g @plugin 'tmux-plugins/tmux-battery'
set -g @plugin 'tmux-plugins/tmux-cpu'
set -g @plugin 'tmux-plugins/tmux-sidebar'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'christoomey/vim-tmux-navigator'
set -g @plugin 'tmux-plugins/tmux-sensible' # recommened tmux defaults
set -g @plugin 'tmux-plugins/tmux-yank' # allows copying to system vie tmux
set -g @plugin 'tmux-plugins/tmux-resurrect'

set -g status-right 'Online: #{online_status}  #{battery_status_bg} Batt: #{battery_icon} #{battery_percentage} #{battery_remain} | %a %h-%d %H:%M '
set -g @shell_mode 'vi'
set -g @yank_selection 'primary'

###########################
#  Configuration
###########################
# remap prefix to Control + a
set -g prefix C-a
unbind-key C-b
bind-key C-a send-prefix
# use 256 term for pretty colors
set -g default-terminal "screen-256color"

# mouse support
# set -g mouse on

# increase scroll-back history
set -g history-limit 5000
# Do not rename windows
set-window-option -g allow-rename off
# Navigate around panes easily using vim-like keybindings
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R


run-shell "powerline-daemon -q"

source "/home/tachyons/.local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf"
# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
