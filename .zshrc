# Set up the prompt
#autoload -Uz promptinit
#promptinit
#prompt adam1

# (not very) customized prompt
export PS1='%F{magenta}%n%f: %B%F{172}%1~%f%b ] %# ' 

# Keep history in ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
#eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/k/k.sh

# enable colors in some commands
alias ls='ls --color=always'
alias la='ls -a'
alias ll='ls -l'
alias grep='grep --color'
# shortcuts
alias anyvpn='/opt/cisco/anyconnect/bin/vpn'
alias gmuvpn-connect='anyvpn connect STUDENT'
alias gmuvpn-disconnect='anyvpn disconnect'

alias mars='cd /Users/quannguyen/Documents/GMU/SP2022/CS465/; java -jar Mars4_5.jar'

# Color man pages
function man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

function timeout() {
    perl -e 'alarm shift; exec @ARGV' "$@";
}


alias cputemp="sudo powermetrics --samplers smc"
# pmset -g thermlog # dont know how to name


### Stuff for development


# For Common Lisp
alias clisp="clisp -q"
alias sbcl="rlwrap sbcl"


# Java versions
export JAVA_HOME=$(/usr/libexec/java_home -v 17.0)
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.8) # mac JRE


# idk what this is...
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# for cs 468 stuff
#LD_LIBRARY_PATH=/usr/local/opt/openssl/lib:"${LD_LIBRARY_PATH}"
#export LD_LIBRARY_PATH
