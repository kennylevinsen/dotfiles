source ~/.antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundles <<EOB

command-not-found
git
git-extras

debian
tmux
colored-man

zsh-users/zsh-syntax-highlighting
zsh-users/zsh-completions src
zsh-users/zsh-history-substring-search

EOB
antigen theme Joushou/zsh kardan
antigen apply

if [ -e ~/.env ]
then
   source ~/.env
fi
