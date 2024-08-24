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

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export VULKAN_SDK="$HOME/VulkanSDK/1.3.283.0"
source $VULKAN_SDK/setup-env.sh; clear

export BAT_THEME="base16"


################################################################################
# Shortcuts
################################################################################

alias vim="nvim"
alias cat="bat"
alias tms="tmux-sessionizer"

alias vol="volta"
alias pm="pnpm"

alias proj="cd ~/Documents/Projects"
alias work="cd ~/Documents/Work"
alias school="cd ~/Documents/School"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# thefuck
eval $(thefuck --alias)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Wasmer
export WASMER_DIR="/Users/zdziarski/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
