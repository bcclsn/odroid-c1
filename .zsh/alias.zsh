alias ls='ls --classify --color=auto --human-readable'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias less='less --quiet'
alias h='cd ~'
alias grep='grep --color=auto'
alias dmesg='dmesg -H'
alias qq='exit'
alias df='df --human-readable'
alias su='su -l'
alias paclog='tail -n 40 /var/log/pacman.log'
alias shutdown='sudo shutdown -h now'
alias kill='tmux kill-session -t'
alias x='startx'
alias c='clear'
alias cleansys='sudo pacman -Rscn $(pacman -Qdtq)'
alias lss='ls --color=never'
alias hdd1='cd /mnt/HDD1'
alias hdd2='cd /mnt/HDD2'
