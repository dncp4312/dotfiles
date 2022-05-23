<<<<<<< Updated upstream
=======
#Temporary
alias hb="cd ~/Projects/hta_be ; rails c"
alias rs='clear ; bundle exec rspec'
alias be='bundle exec'
alias ruby='c;ruby'
alias ht="cd ~/Projects/hta_be"
alias cr="cd ~/.rbenv/versions/2.7.4/lib/ruby/2.7.0"
alias gems="cd ~/.rbenv/versions/2.7.4/lib/ruby/gems/2.7.0/gems ; c"
alias rc="bundle exec rails c"
alias rt="bundle exec rails c -e test"
alias rst="bundle exec rails s -e test"
alias sk="be sidekiq"
alias -s rb=vim
alias ph='cd ~/.local/share/pry'

>>>>>>> Stashed changes
#Aliases

alias x=exit
alias c=clear
alias ea="vim ~/.zsh/.aliases.zsh"
alias ep="vim ~/.zprofile"
alias ez="vim ~/.zshrc"
alias es="vim ~/.config/sxhkd/sxhkdrc"
alias eb="vim ~/.config/bspwm/bspwmrc"
alias ec="vim ~/.config/picom/picom.conf"
alias er="vim ~/.config/polybar/config.ini"
alias ev="vim ~/.vimrc"

alias pQ='pacman -Q'
alias dT='pactree -d 1'
alias dTf='pactree'
alias dTr='pactree -r -d 1'
alias pS='sudo pacman -S'
alias pR='sudo pacman -Rns'
alias yS='yay -S --nodiffmenu'
alias rmorph='pacman -Qtdq | sudo pacman -Rns -'
alias pCC='paccache -rk1 -ruk0'

alias gpref='nano /etc/default/grub'
alias gcnfup='grub-mkconfig -o /boot/grub/grub.cfg'

alias sys='sudo systemctl'
alias sysrun='sudo systemctl start'
alias sysstp='sudo systemctl stop'
alias sysres='sudo systemctl restart'

alias running='systemctl --type=service --state=running'
alias enabled='systemctl list-unit-files | grep enabled'
alias shutnw='shutdown now'

alias ipl='ip addr | grep wlan0 | cut -d " " -f6 | grep /'
alias ipp='curl ifconfig.me'
alias chngcol='python3 ~/.local/share/plasma/desktoptheme/breeze-alphablack/desktoptheme.py set theme.accentColor'
alias yd=youtube-dl

alias rcup='rcup -v'
alias mkrc='mkrc -v'
alias lsrc='lsrc -v'

alias cmatrix='cmatrix ; c'
alias theme='/home/xevil/.ricing/terminaltheme.sh'

alias gs='c ; git status'
alias gl='c ; git log --oneline'
alias gc='git commit -c'
alias gr='git reset HEAD --hard'
alias gt='git blot'
alias gh='git glo'
alias gd='git checkout'

alias mi='micro'

alias d='docker'
alias di='docker images'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'

alias k='xdotool key'
alias ku='xdotool keyup'
alias kd='xdotool keydown'

alias bq='bspc quit'
alias br='bspc wm -r'
