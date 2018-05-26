#  _          _          ____            _ _   _     _       _               _
# | |   _   _| | _____  / ___| _ __ ___ (_) |_| |__ ( )___  | |__   __ _ ___| |__  _ __ ___
# | |  | | | | |/ / _ \ \___ \| '_ ` _ \| | __| '_ \|// __| | '_ \ / _` / __| '_ \| '__/ __|
# | |__| |_| |   <  __/  ___) | | | | | | | |_| | | | \__ \ | |_) | (_| \__ \ | | | | | (__
# |_____\__,_|_|\_\___| |____/|_| |_| |_|_|\__|_| |_| |___/ |_.__/ \__,_|___/_| |_|_|  \___|

stty -ixon
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.

# Setting Bash prompt. Capitalizes username and host if root user (my root user uses this same config file).
if [ "$EUID" -ne 0 ]
	then export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
	else export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 4)\]$(hostname | awk '{print toupper($0)}') \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
fi

#Generic shortcuts:
alias music="ncmpcpp"
alias clock="ncmpcpp -s clock"
alias visualizer="ncmpcpp -s visualizer"
alias news="newsbeuter"
alias email="neomutt"
alias files="ranger"
alias chat="weechat"
alias audio="ncpamixer"
alias calender="calcurse"
#export BROWSER="chromium"

# System Maintainence
alias mw="~/.config/mutt/mutt-wizard.sh"
alias muttwizard="~/.config/mutt/mutt-wizard.sh"
alias progs="(pacman -Qet && pacman -Qm) | sort -u" # List programs I've installed
alias orphans="pacman -Qdt" # List orphan programs
alias upgr="notify-send -i ~/.scripts/larbs.png 'Upgrade started' & neofetch && sudo packer -Syyuv --noconfirm && notify-send -i ~/.scripts/larbs.png 'Upgrade complete'."
alias atltime="sudo timedatectl set-timezone America/New_York && i3 restart" # Eastcoast time
alias tuctime="sudo timedatectl set-timezone America/Phoenix && i3 restart" # Arizona time
alias sdn="sudo shutdown now"
alias newnet="sudo systemctl restart NetworkManager" # Refresh wifi
alias nf="clear && neofetch" # Le Redditfetch
#Install an AUR package manually (for Parabola to get AUR access):
aurinstall() { curl -O https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz && tar -xvf $1.tar.gz && cd $1 && makepkg --noconfirm -si && cd .. && rm -rf $1 $1.tar.gz ;}
alias psref="gpg-connect-agent RELOADAGENT /bye" # Refresh gpg

# Some aliases
alias p="sudo pacman"
alias SS="sudo systemctl"
alias v="vim"
alias sv="sudo vim"
alias r="ranger"
alias sr="sudo ranger"
alias ka="killall"
alias g="git"
alias gitup="git push origin master"
alias trem="transmission-remote"
alias mkd="mkdir -pv"
alias rf="source ~/.bashrc"
alias ref="shortcuts.sh && source ~/.bashrc" # Refresh shortcuts manually and reload bashrc
alias bars="bash ~/.config/polybar/launch.sh" # Run Polybar relaunch script
alias bw="wal -i ~/.config/wall.png" # Rerun pywal
weath() { curl wttr.in/$1 ;} # Check the weather (give city or leave blank).

# Adding color
alias ls='ls -hN --color=auto --group-directories-first'
alias crep="grep --color=always" # Color grep - highlight desired sequence.
alias ccat="highlight --out-format=xterm256" #Color cat - print file with syntax highlighting.

# Internet
alias yt="youtube-dl --add-metadata -ic" # Download video link
alias yta="youtube-dl --add-metadata -xic" # Download only audio
alias YT="youtube-viewer"
alias ethspeed="speedometer -r enp0s25"
alias wifispeed="speedometer -r wlp3s0"
alias starwars="telnet towel.blinkenlights.nl"
alias tpbs="clear && figlet -c TPB Search && tpb.sh" # Pirate Bay search

# TeX
alias Txa="cp ~/Documents/LaTeX/article.tex"
alias Txs="cp ~/Documents/LaTeX/beamer.tex"
alias Txh="cp ~/Documents/LaTeX/handout.tex"
alias TC='texclear'

# Audio and Music
alias mute="pamixer -m"
alias unmute="pamixer -u"
alias vu="pamixer --allow-boost -i 5"
alias vd="pamixer --allow-boost -d 5"
alias pause="mpc toggle"
alias next="mpc next"
alias prev="mpc prev"
alias trupause="mpc pause"
alias beg="mpc seek 0%"
alias lilbak="mpc seek -10"
alias lilfor="mpc seek +10"
alias bigbak="mpc seek -120"
alias bigfor="mpc seek +120"

hello-larbs() { sed -i -e '/larbs.png/,$d' ~/.config/i3/config ;}
source ~/.bash_shortcuts
source /home/robert/.bash_shortcuts

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
