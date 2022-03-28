# start tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Path to your oh-my-zsh installation.
export ZSH="/Users/zdziarski/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="refined"
ZSH_THEME="spaceship"

plugins=( git zsh-syntax-highlighting zsh-autosuggestions )

source $ZSH/oh-my-zsh.sh 


# My shortcuts
alias proj="cd ~/Documents/Projects"
alias work="cd ~/Documents/Work"

alias vim="nvim"
alias v="volta"

alias rpi1="ssh ubuntu@zdzoz.duckdns.org -p 2001"
alias rpi2="ssh ubuntu@zdzoz.duckdns.org -p 2002"
alias rpi3="ssh ubuntu@zdzoz.duckdns.org -p 2003"

# Force UTF-8
export LANG=en_US.UTF-8

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"

export BAT_THEME="Dracula"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
