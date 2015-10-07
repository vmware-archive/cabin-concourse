# Setup Path
set PATH ~/bin $PATH

# supress greeting
set fish_greeting

# set nvim to default editor
set EDITOR nvim

# set git duet to automatically be global
set GIT_DUET_GLOBAL true

# aliases
alias vim=nvim
alias vi=nvim

if test -e ~/.screenlayout/mirrored.sh
  ~/.screenlayout/mirrored.sh
end

eval (direnv hook fish)
