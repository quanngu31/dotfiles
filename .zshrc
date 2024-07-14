# Set up the prompt
#autoload -Uz promptinit
#promptinit
#prompt bert

# (not very) customized prompt
export PROMPT='%F{magenta}%n%f: %B%F{033}%2~%f%b ] %# ' 
RPROMPT=%F{yellow}%*%f

# Keep history in ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt appendhistory
setopt sharehistory

setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Use modern completion system
autoload -Uz compinit
compinit
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh
# Plugins
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source <(fzf --zsh)


zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''

zstyle ':completion:*' menu no
# zstyle ':completion:*' menu select=long
zstyle ':fzf-tab:completion:cd:*' fzf-preview 'ls --color $readpath'
zstyle ':completion:*:git-checkout:*' sort false

#eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# enable colors in some commands
alias rm='rm -v'
alias ls='ls --color'
alias la='ls -a'
alias ll='ls -l'
alias grep='grep --color'
alias glol='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
alias glog='git log --graph'

# Java versions
# export JAVA_HOME=$(/usr/libexec/java_home -v 17.0)
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)


#LD_LIBRARY_PATH=/usr/local/opt/openssl/lib:"${LD_LIBRARY_PATH}"
#export LD_LIBRARY_PATH


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
