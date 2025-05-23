function fish_user_key_bindings
    # peco change directory
    bind \cf peco_change_directory

    #peco select history 
    bind \cr peco_select_history

    # vim-like
    bind \cl forward-char

    # prevent iterm2 from closing when typing Ctrl-D (EOF)
    bind \cd delete-char
end

# fzf plugin
fzf_configure_bindings --directory=\co
