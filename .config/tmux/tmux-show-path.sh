# ~/.tmux-show-path.sh
#!/bin/bash
basename2() {
  path="${1%/}"
  base1="$(basename "$path")"
  parent="$(basename "$(dirname "$path")")"
  echo "$parent/$base1"
}

basename2 "$1"
