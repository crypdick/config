# Base paths and XDG defaults
: "${XDG_CONFIG_HOME:=$HOME/.config}"
: "${XDG_STATE_HOME:=$HOME/.local/state}"
mkdir -p "$XDG_STATE_HOME/zsh"

setopt EXTENDED_GLOB

# PATH management
typeset -U path PATH
path=(
  "$HOME/bin"
  "$HOME/.local/bin"
  $path
)

if [[ $OSTYPE == darwin* ]]; then
  for prefix in /opt/homebrew /usr/local; do
    if [[ -x "$prefix/bin/brew" ]]; then
      path=("$prefix/bin" "$prefix/sbin" $path)
      break
    fi
  done
fi

export PATH

# History configuration
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY

# Shell ergonomics
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt GLOB_DOTS

autoload -U colors && colors
PROMPT='%F{cyan}%n@%m%f %F{yellow}%1~%f %# '

# Load oh-my-zsh when available
if [[ -d "${ZSH:-$HOME/.oh-my-zsh}" ]]; then
  export ZSH="${ZSH:-$HOME/.oh-my-zsh}"
  ZSH_THEME=${ZSH_THEME:-agnoster}
  plugins=(git gitignore common-aliases colorize colored-man-pages extract command-not-found fzf)
  source "$ZSH/oh-my-zsh.sh"
fi

# Optional extras
if [[ -r "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if [[ -r "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

[[ -f $HOME/.fzf.zsh ]] && source $HOME/.fzf.zsh

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

if command -v conda >/dev/null 2>&1; then
  eval "$(conda shell.zsh hook 2>/dev/null)"
fi

# Aliases and local configuration
[[ -f $HOME/.aliases ]] && source $HOME/.aliases

for cfg in "$XDG_CONFIG_HOME"/zsh/env.d/*.zsh(N); do
  source "$cfg"
done

[[ -f "$XDG_CONFIG_HOME/zsh/secrets.zsh" ]] && source "$XDG_CONFIG_HOME/zsh/secrets.zsh"
