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

# openTmux() {
#   declare -A sessions
#   sessions=($(tmux ls -F "#{session_name} #{session_attached}"))
#   for session attached in ${(kv)sessions};
#   do
#       if [[ $attached -eq 0 ]]; then
#           SES=$session
#           break
#       fi
#   done
#   if [[ -v SES ]]; then
#       exec tmux new -A -s $SES
#   else
#       exec tmux
#   fi
# }

# start tmux and attach to any detached session
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
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

export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"
export BAT_THEME="Dracula"


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
alias keio="cd ~/Documents/School/Keio"

alias rpi1="ssh ubuntu@zdzoz.duckdns.org -p 2001"
alias rpi2="ssh ubuntu@zdzoz.duckdns.org -p 2002"
alias rpi3="ssh ubuntu@zdzoz.duckdns.org -p 2003"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

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

