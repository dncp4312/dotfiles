#Aliases

alias x=exit
alias c=clear

alias pQ='pacman -Q'
alias pT='pactree -d 1'
alias pTf='pactree'
alias pTr='pactree -r'
alias pS='sudo pacman -S'
alias pR='sudo pacman -Rns'
alias yS='yay -S --nodiffmenu'
alias rmorph='pacman -Qtdq | sudo pacman -Rns -'
alias pCC='paccache -rk1 -ruk0'

alias gpref='nano /etc/default/grub'
alias gcnfup='grub-mkconfig -o /boot/grub/grub.cfg'
alias sysrun='systemctl start'
alias sysstp='systemctl stop'

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

alias gr='git reset HEAD --hard'
