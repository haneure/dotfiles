set fish_greeting ""
export TERM=xterm-256color

# Environment variables
set -gx EZA_CONFIG_DIR $HOME/.config/eva
set -x OPENROUTER_API_KEY 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

# theme
#set -g theme_color_scheme terminal-dark
#set -g fish_prompt_pwd_dir_length 1
#set -g theme_display_user yes
#set -g theme_hide_hostname no
#set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
if status is-interactive
    alias g git
end
command -qv nvim && alias vim nvim

# Go
#set -g GOPATH $HOME/go
#set -gx PATH $GOPATH/bin $PATH

function set_tmux_window_name --on-variable PWD
    if set -q TMUX
        tmux rename-window (basename $PWD)
    end
end

# functions
function reload_fish
    source ~/.dotfiles/.config/fish/config.fish
end

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

#starship init fish | source
