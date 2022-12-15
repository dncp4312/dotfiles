export DISPLAY=:0
# export waloc="$(grep "file" $HOME/.config/nitrogen/bg-saved.cfg | cut -d "=" -f 2)"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/xbin"
export PATH="$HOME/.local/share/rbenv/bin:$PATH"
export PATH="$HOME/.local/share/rbenv/shims:$PATH"
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"
export CHROME_EXECUTABLE="/usr/bin/brave"
export MONGO_HOST=localhost
export RANGER_LOAD_DEFAULT_RC=FALSE
export SYSTEMD_EDITOR=vim
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORMTHEME="qt5ct"
export EXA_COLORS="da=33"
export FZF_DEFAULT_COMMAND='rg --files'
export FEHBG="$HOME/.local/bin/restore_fehbg"
export GTK_THEME=Orchis-Purple-Dark-Compact
export GTK_THEME=Graphite-Dark-Alt

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export GEM_HOME=${XDG_DATA_HOME}/gem
export GEM_SPEC_CACHE=${XDG_CACHE_HOME}/gem
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export KDEHOME="$XDG_CONFIG_HOME"/kde
export ZDOTDIR="$XDG_CONFIG_HOME"/zsh
export HISTFILE=${XDG_DATA_HOME}/zsh/history
export LESSHISTFILE=${XDG_CACHE_HOME}/less/history
export LESSCHARSET=UTF-8
export RBENV_ROOT="$XDG_DATA_HOME"/rbenv
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export SOLARGRAPH_CACHE="$XDG_CACHE_HOME"/solargraph
export TIMEWARRIORDB="$XDG_CONFIG_HOME"/timewarrior

[[ -f ~/.zshrc ]] && . ~/.zshrc
[[ $XDG_VTNR -le 2 && -z $SSH_TTY && $TTY =~ /dev/tty[0-9] ]] && exec startx "$XINITRC" -- vt1 &> /dev/null
# [[ $XDG_VTNR -eq 1 && -z $SSH_TTY && $TTY =~ /dev/tty[0-9] ]] && exec startx /usr/bin/bspwm -- vt1 &> /dev/null
# [[ $XDG_VTNR -eq 2 && -z $SSH_TTY && $TTY =~ /dev/tty[0-9] ]] && exec startx /usr/bin/firefox -width 1920 -height 1080 -- vt1 &> /dev/null
