#Temporary
alias hb="cd ~/Projects/hta_be ; rails c"
alias rs='clear ; bundle exec rspec'
alias be='bundle exec'
alias ruby='c;ruby'
alias ht="cd ~/Projects/hta_be"
alias cr="cd ~/.rbenv/versions/2.7.4/lib/ruby/2.7.0"
alias gems="cd ~/.rbenv/versions/2.7.4/lib/ruby/gems/2.7.0/gems ; c"
alias rc="rails c"
alias rt="rails c -e test"
alias rst="rails s -e test"
alias sk="be sidekiq"
alias -s rb=vim
alias ph='cd ~/.local/share/pry'

#Aliases

alias x=exit
alias c=clear
alias v=vim
alias su='sudo -i'

alias ls='exa --group-directories-first'
alias ll='ls -l'
alias la='ls -lag'
# alias grep=rg
# alias cat=bat
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
alias syssta='systemctl status'

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

alias gs='c ; git status'
alias gl='c ; git log --oneline'
alias gc='git commit -m'
alias gr='git reset HEAD --hard'
alias gb='git branch'
alias gum='git reset HEAD~1 --hard'
alias gt='git blot'
alias gh='git glo'
alias gd='git checkout'
alias gsm='git stash push -m'
alias gsp='git stash pop'
alias gsl='git stash list'
alias gsa='git stash apply --index'
alias gca='git commit --amend --no-edit'
alias gwa='git worktree add'
alias gwr='git worktree remove'

alias d='docker'
alias di='c;docker images'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'

alias k='xdotool key'
alias ku='xdotool keyup'
alias kd='xdotool keydown'

alias bq='bspc quit'
alias br='bspc wm -r'

alias theme='/home/xevil/.ricing/terminaltheme.sh'
alias matrix="unimatrix -n -s 94 -l 'o' -f | lolcat"
alias discord="LIBVA_DRIVER_NAME=i915 discord --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-feature=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy"
alias fzf="fzf --height=80% --layout=reverse-list --border=horizontal --no-info --preview='bat --color=always --style=numbers {}' --color='border:magenta,prompt:magenta,hl:magenta,hl+:white,pointer:white,marker:white,bg+:magenta,gutter:grey'"
alias ncdu='ncdu --color dark'
