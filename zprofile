export DISPLAY=:1
export waloc="$(grep "file" /home/xevil/.config/nitrogen/bg-saved.cfg | cut -d "=" -f 2)"
export PATH="$PATH:/home/xevil/Path"
export PATH="$PATH:/home/xevil/Drives/Android/android-sdk/flutter/bin"
export PATH="$PATH:/home/xevil/Drives/Android/android-sdk/android-studio/bin"
export CHROME_EXECUTABLE="/usr/bin/brave"
export RANGER_LOAD_DEFAULT_RC=FALSE
export SYSTEMD_EDITOR=vim

[[ $XDG_VTNR -le 2 && -z $SSH_TTY ]] && tbsm
[[ -f ~/.zshrc ]] && . ~/.zshrc
