export BAT_THEME="base16"
export EDITOR="vi"
export LANG=en_US.UTF-8

if status is-interactive
  if type -q tmux # check if tmux exists
    and not set -q TMUX # make sure tmux env var is not set
    and not set -q VSCODE_RESOLVING_ENVIRONMENT # make sure vscode env var is not set
    and not string match -q -- "$TERM" "*screen*"
    and not string match -q -- "$TERM" "*tmux*"
    and not string match -q -- "$TERM" "linux" # prevent defaulting to tmux in tty

    if tmux has-session -t main 2>/dev/null; and tmux ls | grep main | grep -q attached
      exec tmux
    else
      exec tmux new -As main
    end
  end

  fish_vi_key_bindings

  alias vim="nvim"
  alias v="nvim"
  alias cat="bat"
  alias tms="tmux-sessionizer"
  alias leaks="MallocStackLogging=1 leaks"
  alias lg="lazygit"

  alias dev="cd ~/dev"

  test -r '/home/oskar/.opam/opam-init/init.fish' && source '/home/oskar/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
end

