#export DISPLAY=:1
export DISPLAY=:0
export waloc="$(grep "file" $HOME/.config/nitrogen/bg-saved.cfg | cut -d "=" -f 2)"
export PATH="$PATH:rHOME/.local/bin"
export PATH="$HOME/.local/share/rbenv/bin:$PATH"
export PATH="$PATH:$HOME/.android/android-studio/bin"
export CHROME_EXECUTABLE="/usr/bin/brave"
export RANGER_LOAD_DEFAULT_RC=FALSE
export SYSTEMD_EDITOR=vim


export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export GEM_HOME=${XDG_DATA_HOME}/gem
export GEM_SPEC_CACHE=${XDG_CACHE_HOME}/gem
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export KDEHOME="$XDG_CONFIG_HOME"/kde
export HISTFILE=${XDG_CACHE_HOME}/bash/history
export LESSHISTFILE=${XDG_CACHE_HOME}/less/history
export RBENV_ROOT="$XDG_DATA_HOME"/rbenv
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
#export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
#export ZDOTDIR=$HOME/.config/zsh

[[ -f ~/.zshrc ]] && . ~/.zshrc
# [[ $XDG_VTNR -le 2 && -z $SSH_TTY && $TTY =~ /dev/tty[0-9] ]] && tbsm r 1
# [[ $XDG_VTNR -le 2 && -z $SSH_TTY && $TTY =~ /dev/tty[0-9] ]] && exec startx -- vt1 &> /dev/null
