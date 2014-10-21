source ~/.antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundles <<EOB

pip
command-not-found

svn
git
git-extras

debian
tmux
colored-man

zsh-users/zsh-syntax-highlighting
zsh-users/zsh-completions src
zsh-users/zsh-history-substring-search
robbyrussell/oh-my-zsh plugins/python
robbyrussell/oh-my-zsh plugins/ruby
robbyrussell/oh-my-zsh plugins/golang

robbyrussell/oh-my-zsh plugins/brew
robbyrussell/oh-my-zsh plugins/brew-cask
robbyrussell/oh-my-zsh plugins/osx

robbyrussell/oh-my-zsh plugins/mvn
robbyrussell/oh-my-zsh plugins/mosh


EOB
antigen theme Joushou/zsh kardan
antigen apply

if [ -e ~/.env ]
then
   source ~/.env
fi
