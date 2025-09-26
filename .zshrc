# Keep configuration/state under XDG paths instead of cluttering $HOME
: "${XDG_CONFIG_HOME:=$HOME/.config}"
: "${XDG_STATE_HOME:=$HOME/.local/state}"
mkdir -p "$XDG_STATE_HOME/zsh"

# Enable richer glob patterns (**, etc.)
setopt EXTENDED_GLOB

# Normalize PATH across hosts and remove duplicates
typeset -U path PATH
path=(
  "$HOME/bin"
  "$HOME/.local/bin"
  $path
)

if [[ $OSTYPE == darwin* ]]; then
  # Prefer Homebrew paths on macOS ahead of system defaults
  for prefix in /opt/homebrew /usr/local; do
    if [[ -x "$prefix/bin/brew" ]]; then
      path=("$prefix/bin" "$prefix/sbin" $path)
      break
    fi
  done
fi

export PATH

# Unified zsh history with dedupe and XDG storage
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS

# Quality-of-life shell defaults
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt GLOB_DOTS

autoload -U colors && colors
# Simple prompt showing user@host and short working directory
PROMPT='%F{cyan}%n@%m%f %F{yellow}%1~%f %# '

# Load Oh My Zsh (theme + plugin manager) when present
if [[ -d "${ZSH:-$HOME/.oh-my-zsh}" ]]; then
  export ZSH="${ZSH:-$HOME/.oh-my-zsh}"
  ZSH_THEME=${ZSH_THEME:-agnoster}
  ENABLE_CORRECTION="true"
  plugins=(git gitignore common-aliases colorize colored-man-pages extract command-not-found fzf)
  source "$ZSH/oh-my-zsh.sh"
fi

# Enable bash-style completions even without OMZ
if ! typeset -f bashcompinit >/dev/null 2>&1; then
  autoload -Uz bashcompinit
fi
if [[ -z ${ZSH_BASHCOMPINIT:-} ]]; then
  bashcompinit
  typeset -g ZSH_BASHCOMPINIT=1
fi

# Source optional plugin clones (managed in README bootstrap)
if [[ -r "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if [[ -r "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# Enable fzf keybindings/completions when installed
[[ -f $HOME/.fzf.zsh ]] && source $HOME/.fzf.zsh

if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

if command -v conda >/dev/null 2>&1; then
  # Keep conda from duplicating the prompt prefix e.g. (base)
  export CONDA_CHANGEPS1=false
  eval "$(conda shell.zsh hook 2>/dev/null)"
fi

# Layer aliases, host-specific overrides, then secrets
[[ -f $HOME/.aliases ]] && source $HOME/.aliases

for cfg in "$XDG_CONFIG_HOME"/zsh/env.d/*.zsh(N); do
  source "$cfg"
done

[[ -f "$XDG_CONFIG_HOME/zsh/secrets.zsh" ]] && source "$XDG_CONFIG_HOME/zsh/secrets.zsh"
