export DISPLAY=:0
export waloc="$(grep "file" /home/xevil/.config/nitrogen/bg-saved.cfg | cut -d "=" -f 2)"
export RANGER_LOAD_DEFAULT_RC=FALSE


[[ $XDG_VTNR -le 2 ]] && tbsm
[[ -f ~/.zshrc ]] && . ~/.zshrc
