export DISPLAY=:1
export waloc="$(grep "file" /home/xevil/.config/nitrogen/bg-saved.cfg | cut -d "=" -f 2)"
export PATH="$PATH:/home/xevil/.local/bin"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$PATH:/home/xevil/.android/android-studio/bin"
export CHROME_EXECUTABLE="/usr/bin/brave"
export MONGO_HOST=localhost
export RANGER_LOAD_DEFAULT_RC=FALSE
export SYSTEMD_EDITOR=vim
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORMTHEME="qt5ct"

[[ -f ~/.zshrc ]] && . ~/.zshrc
[[ $XDG_VTNR -le 2 && -z $SSH_TTY ]] && tbsm
