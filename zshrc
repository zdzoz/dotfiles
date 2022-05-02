################################################################################
# Plugins
################################################################################

# Load the Antibody plugin manager for zsh.
source <(antibody init)

# Setup required env var for oh-my-zsh plugins
export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"

antibody bundle robbyrussell/oh-my-zsh
antibody bundle robbyrussell/oh-my-zsh path:plugins/git
antibody bundle robbyrussell/oh-my-zsh path:plugins/npm
antibody bundle robbyrussell/oh-my-zsh path:plugins/tmux


antibody bundle zsh-users/zsh-autosuggestions

# This needs to be the last bundle.
antibody bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antibody bundle spaceship-prompt/spaceship-prompt


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
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  openTmux
fi

export LANG=en_US.UTF-8

export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"
export BAT_THEME="Dracula"


################################################################################
# Shortcuts
################################################################################

alias vim="nvim"
alias vol="volta"
alias cat="bat"

alias proj="cd ~/Documents/Projects"
alias work="cd ~/Documents/Work"

alias rpi1="ssh ubuntu@zdzoz.duckdns.org -p 2001"
alias rpi2="ssh ubuntu@zdzoz.duckdns.org -p 2002"
alias rpi3="ssh ubuntu@zdzoz.duckdns.org -p 2003"

alias cm="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1"



# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
