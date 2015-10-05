# supress greeting
set fish_greeting

# set nvim to default editor
set EDITOR nvim

# aliases
alias vim=nvim
alias vi=nvim

if test -e $HOME/.screenlayout/mirrored.sh
  $HOME/.screenlayout/mirrored.sh
end

eval (direnv hook fish)
