if [[ $(uname) == "Darwin" ]]; then
  # macos
  eval "$(/opt/homebrew/bin/brew shellenv)"
  source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
else
  # linux
fi
exit

################################################################################
# Plugins
################################################################################

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


## EXPORTS ##

export LANG=en_US.UTF-8

export XDG_CONFIG_HOME="$HOME/.config"

source $HOME/VulkanSDK/current/setup-env.sh; clear

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
alias lg="lazygit"

alias dev="cd ~/dev"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# zoxide
eval "$(zoxide init zsh)"
