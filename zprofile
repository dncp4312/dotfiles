#
# ~/.zprofile
#

[[ -f ~/.zshrc ]] && . ~/.zshrc
[[ $XDG_VTNR -le 2 ]] && tbsm r 2 &> /dev/null

export DISPLAY=:0
