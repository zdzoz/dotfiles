if [[ $(uname) == "Darwin" ]]; then
  if [ "$(arch)" = "i386" ]; then
      eval "$(/usr/local/bin/brew shellenv)"
  else
      eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

################################################################################
# Plugins
################################################################################

source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

################################################################################
# Configuration
################################################################################

# start tmux and attach to any detached session
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ] && [ -z "$VSCODE_RESOLVING_ENVIRONMENT" ]; then
  if tmux has-session -t main 2>/dev/null && tmux ls | grep main | grep -q attached; then
      # create new session
      exec tmux
  else
    # create or attach
    exec tmux new -As main
  fi
fi

export LANG=en_US.UTF-8

source $HOME/VulkanSDK/1.4.304.1/setup-env.sh; clear

export BAT_THEME="base16"

export EDITOR="vi"
set -o vi


################################################################################
# Shortcuts
################################################################################

alias vim="nvim"
alias v="nvim"
alias cat="bat"
alias tms="tmux-sessionizer"
alias leaks="MallocStackLogging=1 leaks"

alias proj="cd ~/Documents/Projects"
alias work="cd ~/Documents/Work"
alias school="cd ~/Documents/School"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# zoxide
eval "$(zoxide init zsh)"
