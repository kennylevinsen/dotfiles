source ~/.zgen.zsh

# Some assistance
export HISTFILE=$HOME/.zsh_history_${HOST}
export HISTSIZE=5000
export SAVEHIST=$HISTSIZE

autoload -Uz colors
colors
autoload -Uz compinit
compinit

setopt prompt_subst
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_verify
setopt hist_fcntl_lock
setopt share_history # share command history data

# Fix delete key
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char

zgen oh-my-zsh plugins/git
zgen oh-my-zsh plugins/git-extras
zgen oh-my-zsh plugins/tmux
zgen oh-my-zsh plugins/colored-man-pages
zgen oh-my-zsh plugins/history-substring-search

zgen load zsh-users/zsh-syntax-highlighting
zgen load zsh-users/zsh-completions src

zgen load joushou/zsh kardan.zsh-theme

[ -e ~/.zshrc_${HOST} ] && source ~/.zshrc_${HOST}
[ -e ~/.env ] && source ~/.env
[ -e ~/.env_${HOST} ] && source ~/.env_${HOST}
