# Linux / WSL specific config

# Ensure ~/.local/bin is in PATH
if not contains -- $HOME/.local/bin $PATH
  set -gx PATH $HOME/.local/bin $PATH
end

# Load secrets if present
if test -f ~/.config/fish/secrets.fish
  source ~/.config/fish/secrets.fish
end
