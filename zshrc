source ~/.zgen.zsh

# Some assistance
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=5000
autoload colors; colors;
setopt prompt_subst
setopt hist_ignore_space
setopt hist_ignore_all_dups

zgen oh-my-zsh plugins/command-not-found
zgen oh-my-zsh plugins/git
zgen oh-my-zsh plugins/git-extras
zgen oh-my-zsh plugins/debian
zgen oh-my-zsh plugins/tmux
zgen oh-my-zsh plugins/colored-man

zgen load zsh-users/zsh-syntax-highlighting
zgen load zsh-users/zsh-completions src
zgen load zsh-users/zsh-history-substring-search

zgen load joushou/zsh kardan.zsh-theme

if [ -e ~/.env ]
then
   source ~/.env
fi
