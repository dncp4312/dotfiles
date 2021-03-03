#
# ~/.zprofile
#

[[ -f ~/.zshrc ]] && . ~/.zshrc
[[ $XDG_VTNR -le 2 ]] && tbsm 
# r 1 &> /dev/null

export DISPLAY=:0
export waloc="$(grep "file" /home/xevil/.config/nitrogen/bg-saved.cfg | cut -d "=" -f 2)" 
export RANGER_LOAD_DEFAULT_RC=FALSE
