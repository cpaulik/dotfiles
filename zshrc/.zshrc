# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# Path to your oh-my-zsh installation.

export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(command-not-found pip emacs wd zsh-syntax-highlighting nvm)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# environment variables for virtualenvwrapper
export PROJECT_HOME=$HOME/workspace

# set full color terminal
# set default editor
export EDITOR="vim"
export VISUAL="vim"
export ALTERNATE_EDITOR=""

# set path for miniconda
# You may need to manually set your language environment
export LANG=en_US.UTF-8
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# setup environment variables for local pip wheel cache
# export STANDARD_CACHE_DIR="${XDG_CACHE_HOME:-${HOME}/.cache}/pip"
# export WHEELHOUSE="${STANDARD_CACHE_DIR}/wheelhouse"
# export PIP_FIND_LINKS="file://${WHEELHOUSE}"
# export PIP_WHEEL_DIR="${WHEELHOUSE}"

# vi mode
bindkey -v

# smart history search after typing and pressing up-down keys or C-j and C-k
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search
bindkey '^k' up-line-or-beginning-search
bindkey '^j' down-line-or-beginning-search


# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

# search for files in current folder
alias lsg='ls | grep'
alias llg='ll | grep'
alias lag='la | grep'

alias ls="eza --color=always --long --no-filesize --icons=always --no-time --no-user --no-permissions -a"
alias ll="eza -l --icons=always -a"
alias l="eza -l --icons --git -a"

# navigation
alias ..='cd ..'

source <(fzf --zsh)

if [[ "$CLAUDECODE" != "1" ]]; then
    eval "$(zoxide init zsh)"
    alias cd="z"
fi



export BAT_THEME=gruvbox-dark
export LANG=en_US.UTF-8

alias cat="bat"

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

zstyle ':completion:*' list-prompt   '' # disable asking if I want to see N completions
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

export GIT_INTERNAL_GETTEXT_TEST_FALLBACKS=1

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home

export PIP_EXTRA_INDEX_URL='https://pypi.prod.planet-labs.com/simple/'

# export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-11.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home
. "$HOME/.cargo/env"

# export NVM_DIR="$HOME/.nvm"
#   [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm

export CLOUDSDK_PYTHON=/Users/christoph/.pyenv/versions/3.12.1/bin/python

export CLAUDE_CODE_USE_VERTEX=1
export CLOUD_ML_REGION=us-east5
export ANTHROPIC_VERTEX_PROJECT_ID=engine-468307

curl-planet() { curl -H "Authorization: Bearer $(planet --auth-profile planet-user auth print-access-token)" "$@"; }
