# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# Minimal init: source only powerlevel10k + zsh-syntax-highlighting from the
# oh-my-zsh install (skipping oh-my-zsh.sh itself saves ~500ms on every shell).
export ZSH=$HOME/.oh-my-zsh
fpath=($ZSH/custom/plugins/zsh-syntax-highlighting $ZSH/functions $ZSH/completions $fpath)

# Cached compinit: only re-scan fpath once per day
autoload -Uz compinit
_zcompdump="${ZDOTDIR:-$HOME}/.zcompdump-${HOST/.*/}-${ZSH_VERSION}"
if [[ -n "$_zcompdump"(#qN.mh-24) ]]; then
  compinit -C -d "$_zcompdump"
else
  compinit -u -d "$_zcompdump"
fi
unset _zcompdump

# History (previously provided by oh-my-zsh lib/history.zsh)
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history hist_expire_dups_first hist_ignore_dups hist_ignore_space hist_verify share_history

# Powerlevel10k
source $ZSH/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

# Lazy-load nvm — defer the ~600ms nvm.sh source until first use
export NVM_DIR="$HOME/.nvm"
_lazy_nvm() {
  unset -f nvm node npm npx _lazy_nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}
nvm()  { _lazy_nvm; nvm  "$@"; }
node() { _lazy_nvm; node "$@"; }
npm()  { _lazy_nvm; npm  "$@"; }
npx()  { _lazy_nvm; npx  "$@"; }

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

alias vim="nvim"

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

. "$HOME/.cargo/env"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# Inline pyenv init without `pyenv rehash` (skips ~300ms on every shell startup;
# run `pyenv rehash` manually after installing Python versions or packages).
export PYENV_SHELL=zsh
export PATH="$PYENV_ROOT/shims:$PATH"
for _f in /opt/homebrew/Cellar/pyenv/*/completions/pyenv.zsh(N); do source "$_f"; break; done
unset _f
pyenv() {
  local command=${1:-}
  [ "$#" -gt 0 ] && shift
  case "$command" in
    rehash|shell) eval "$(command pyenv "sh-$command" "$@")" ;;
    *) command pyenv "$command" "$@" ;;
  esac
}
eval "$(direnv hook zsh)"

[[ -f ~/.machine-profile ]] && source ~/.zshrc.d/$(cat ~/.machine-profile).zsh 2>/dev/null
[[ -f ~/.secrets.zsh ]] && source ~/.secrets.zsh

fresh_claude() {
  local session_name="${1:-claude}"
  local dir="${FRESH_CLAUDE_DIR:-$HOME}"
  tmux new-session -d -s "$session_name" -n "claude" -c "$dir" \; \
    send-keys -t "$session_name" "claude -n $session_name" Enter \; \
    split-window -h -t "$session_name" -c "$dir" \; \
    send-keys -t "$session_name" "nvim" Enter \; \
    select-pane -t "$session_name" -L
  if [ -n "$TMUX" ]; then
    tmux switch-client -t "$session_name"
  else
    tmux attach-session -t "$session_name"
  fi
}

# Must be sourced last: zsh-syntax-highlighting hooks into widgets at source time
source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
