###################################################################################################################################################################
#####                                     Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.                                      #####
##   Initialization code that may require console input (password prompts, [y/n]  confirmations, etc.) must go above this block; everything else may go below.   ##
###################################################################################################################################################################

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###################################################################################################################################################################
#####                                                                        functions                                                                        #####
###################################################################################################################################################################

show_colour() {
    perl -e 'foreach $a(@ARGV){print "\e[48:2::".join(":",unpack("C*",pack("H*",$a)))."m \e[49m "};print "\n"' "$@"
}

run() { nohup $1 $2 > /dev/null & disown }

f() { find . $1 | rg $1 }

rv() { selection=$(rg $1 --vimgrep | fzf)
       line=$(echo $selection| cut -d: -f2)
       file=$(echo $selection| cut -d: -f1)
       vim +$line $file
     }

rb() { curl cht.sh/ruby/$1 }

installed () { awk '/%NAME%/{getline;PKG=$1} /%INSTALLDATE%/{getline;IDATE=strftime("%Y-%m-%d %H:%M",$1);print IDATE" "PKG}' /var/lib/pacman/local/*/desc|sort }

gsd() { git stash drop stash@{$1} }

sm() {
    current=$(git branch --show-current)
    green='\033[0;32m'
    nc='\033[0m'

    printf "\n${green}Checking out master...${nc}\n"
    git checkout master

    printf "\n${green}Fetching upstream master...${nc}\n"
    git fetch upstream master

    printf "\n${green}Merging upstream master...${nc}\n"
    git merge upstream/master --ff-only

    printf "\n${green}Updating origin...${nc}\n"
    git push origin master

    printf "\n${green}Checking out $current...${nc}\n"
    git checkout $current
}

ppr() {
    green='\033[0;32m'
    nc='\033[0m'

    sm

    printf "\n${green}Rebasing...${nc}\n"
    git rebase master

    printf "\n${green}Updating remote...${nc}\n"
    git push -u origin $current

    printf "\n${green}Pull-request prepared.${nc}\n"
    printf "\n${green}Opening bitbucket...${nc}\n"
    firefox "https://bitbucket.org/dncp4312/hta_be/branches/?status=all"	
}

function vif() { file=$(fzf) || return ; vim "$file" }
function fcd() { dir=$(find -type d | fzf) || return ; 
		 clear ; echo "\033[0;30mCurrent Directory :\033[0m"   
		 cd "$dir" ; exa --group-directories-first --color=always }

###################################################################################################################################################################
#####                                                                         themes                                                                          #####
###################################################################################################################################################################

#(cat ~/.cache/wal/sequences &)

###################################################################################################################################################################
#####                                                                         sources                                                                         #####
###################################################################################################################################################################

  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f /home/xevil/.zsh/.grml.zsh ]]    || source /home/xevil/.zsh/.grml.zsh
  [[ ! -f /home/xevil/.zsh/.p10k.zsh ]]    || source /home/xevil/.zsh/.p10k.zsh     ;   source /home/xevil/.zsh/.p10k/powerlevel10k.zsh-theme
  [[ ! -f /home/xevil/.zsh/.aliases.zsh ]] || source /home/xevil/.zsh/.aliases.zsh

###################################################################################################################################################################
#####                                                                      customizations                                                                     #####
###################################################################################################################################################################

p10k finalize
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
theme xeha 
bindkey -v
eval "$(rbenv init -)"
#eval $(thefuck --alias)
cd ~/Projects/hta_be/
