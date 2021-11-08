#Temporary
alias hb="cd ~/Projects/hta_be ; rails c"
alias rs='clear ; bundle exec rspec'
alias be='bundle exec'
alias ruby='c;ruby'

#Aliases

alias x=exit
alias c=clear

alias ls='exa --group-directories-first'
alias ll='ls -l'
alias la='ls -la'
alias grep=rg
alias cat=bat
#alias cat=ccat
alias lat=lolcat
alias yd="youtube-dl -o '~/Videos/%(title)s-%(id)s.%(ext)s"  

alias ea="vim ~/.zsh/.aliases.zsh"
alias ep="vim ~/.zprofile"
alias ez="vim ~/.zshrc"
alias es="vim ~/.config/sxhkd/sxhkdrc"
alias eb="vim ~/.config/bspwm/bspwmrc"
alias ec="vim ~/.config/picom/picom.conf"
alias er="vim ~/.config/polybar/config.ini"
alias ev="vim ~/.vimrc"

alias pQ='pacman -Q'
alias pT='pactree -d 1'
alias pTf='pactree'
alias pTr='pactree -r'
alias pS='sudo pacman -S'
alias pR='sudo pacman -Rns'
alias yS='yay -S --nodiffmenu'
alias rmorph='pacman -Qtdq | sudo pacman -Rns -'
alias pCC='paccache -rk1 -ruk0'
alias pU='sudo pacman -Syu'

alias gpref='nano /etc/default/grub'
alias gcnfup='grub-mkconfig -o /boot/grub/grub.cfg'

alias sys='sudo systemctl'
alias sysrun='sudo systemctl start'
alias sysstp='sudo systemctl stop'
alias sysres='sudo systemctl restart'

alias connected='c ; nmap -sP 192.168.1.0/24'
alias running='systemctl --type=service --state=running'
alias enabled='systemctl list-unit-files | grep enabled'
alias shutnw='sudo shutdown now'
alias suspend='sudo systemctl suspend'

alias ipl='ip addr | grep wlan0 | cut -d " " -f6 | grep /'
alias ipp='curl ifconfig.me'

alias rcup='rcup -v'
alias mkrc='mkrc -v'
alias lsrc='lsrc -v'

#alias cmatrix='cmatrix ; c'
alias matrix="unimatrix -n -s 94 -l 'o' -f | lolcat"
alias theme='/home/xevil/.ricing/terminaltheme.sh'

alias gs='c ; git status'
alias gl='c ; git log --oneline'
alias gc='git commit -c'
alias gr='git reset HEAD --hard'
alias gt='git blot'
alias gh='git glo'
alias gd='git checkout'

alias d='docker'
alias di='docker images'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'

alias k='xdotool key'
alias ku='xdotool keyup'
alias kd='xdotool keydown'

alias bq='bspc quit'
alias br='bspc wm -r'

