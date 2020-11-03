# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="odroid"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Date format
HIST_STAMPS="dd/mm/yyyy"

# Plugins
plugins=(sudo dirhistory web-search zsh-syntax-highlighting zsh-completions)

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Source file
source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/alias.zsh
source $HOME/.zsh/setopt.zsh

# Manually set language environment
export LANG=it_IT.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi

# Set tmux for all terminals
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

##echo "inizio blocco info"
echo ""
echo "$fg[cyan] Last -Syu: $reset_color $(grep "pacman -Syu" /var/log/pacman.log | tail -n1 | cut -c 2- | cut -c -16)"
echo "$fg[cyan] Kernel:    $reset_color $(uname -r)"
#echo "$fg[cyan] HDD1:$reset_color $(df -h | grep "/dev/sda1" | cut -c 23- | cut -c-4)/$(df -h | grep "/dev/sda1" | cut -c 17- | cut -c-4)  - $fg[cyan] HDD2:$reset_color $(df -h | grep "/dev/sdb3" | cut -c 23- | cut -c-4)/$(df -h | grep "/dev/sdb3" | cut -c 17- | cut -c-4)  - $fg[cyan] RAM:$reset_color $(free -m | grep "Mem:" | cut -c 26- | cut -c -4)/$(free -m | grep "Mem:" | cut -c 15- | cut -c -4)  - $fg[cyan] CPU Temp:$reset_color $(cut -c 1,2 /sys/class/thermal/thermal_zone0/temp)°C"
echo ""
##echo "fine blocco info"
