set fish_greeting ""
export TERM=xterm-256color

# Environment variables
set -gx EZA_CONFIG_DIR $HOME/.config/eva
# set -gx OPENROUTER_API_KEY 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
set -gx OPENROUTER_API_KEY sk-9gJ8g1C53NBkSL5ljZkQjQ
set -gx KUBECONFIG $HOME/randebu/Kubernetes/aincrad/k3s.yaml

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

# pnpm
set -gx PNPM_HOME /Users/iak/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# # --- NGINX MODE SWITCHER FOR FISH ---

set -x NGINX_CONF_DIR /opt/homebrew/etc/nginx

function nginx-valet
    if test -f $NGINX_CONF_DIR/nginx.manual.conf
        sudo mv $NGINX_CONF_DIR/nginx.conf $NGINX_CONF_DIR/nginx.manual.conf 2>/dev/null
    end
    if test -f $NGINX_CONF_DIR/nginx.valet.conf
        sudo mv $NGINX_CONF_DIR/nginx.valet.conf $NGINX_CONF_DIR/nginx.conf
        echo "🔄 Switched nginx.conf to Valet mode."
    end
    sudo nginx -t; and sudo brew services restart nginx
    echo "✅ Now running in Valet mode."
end

function nginx-manual
    if test -f $NGINX_CONF_DIR/nginx.valet.conf
        sudo mv $NGINX_CONF_DIR/nginx.conf $NGINX_CONF_DIR/nginx.valet.conf 2>/dev/null
    end
    if test -f $NGINX_CONF_DIR/nginx.manual.conf
        sudo mv $NGINX_CONF_DIR/nginx.manual.conf $NGINX_CONF_DIR/nginx.conf
        echo "🔄 Switched nginx.conf to Manual mode."
    end
    sudo nginx -t; and sudo brew services restart nginx
    echo "✅ Now running in Manual mode."
end

function nginx-mode
    if grep -q valet $NGINX_CONF_DIR/nginx.conf
        echo "💫 Currently in Valet mode"
    else
        echo "⚙️  Currently in Manual mode"
    end
end

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/iak/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
