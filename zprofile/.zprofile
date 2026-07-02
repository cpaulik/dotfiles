eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$HOME/node_modules/.bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

[[ -f ~/.machine-profile ]] && source ~/.zprofile.d/$(cat ~/.machine-profile).zsh 2>/dev/null
