# Setup Path
set -x PATH ~/bin $PATH

# supress greeting
set -x fish_greeting

# sets nvim to default editor
set -x EDITOR nvim

# set git duet to automatically be global
set -x GIT_DUET_GLOBAL true
set -x GIT_DUET_ROTATE_AUTHOR 1

# aliases
alias vim=nvim
alias vi=nvim

if test -e ~/.screenlayout/mirrored.sh
  ~/.screenlayout/mirrored.sh
end

eval (direnv hook fish)
