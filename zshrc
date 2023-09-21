if [[ $(uname) == "Darwin" ]]; then
if [ "$(arch)" = "arm64" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    eval "$(/usr/local/bin/brew shellenv)"
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

openTmux() {
  declare -A sessions
  sessions=($(tmux ls -F "#{session_name} #{session_attached}"))
  for session attached in ${(kv)sessions};
  do
      if [[ $attached -eq 0 ]]; then
          SES=$session
          break
      fi
  done
  if [[ -v SES ]]; then
      exec tmux new -A -s $SES
  else
      exec tmux
  fi
}

# start tmux
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   openTmux
# fi

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

alias vol="volta"
alias pm="pnpm"

alias proj="cd ~/Documents/Projects"
alias work="cd ~/Documents/Work"

alias rpi1="ssh ubuntu@zdzoz.duckdns.org -p 2001"
alias rpi2="ssh ubuntu@zdzoz.duckdns.org -p 2002"
alias rpi3="ssh ubuntu@zdzoz.duckdns.org -p 2003"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
