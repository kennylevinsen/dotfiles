
# Various configuration
export HISTFILE=$HOME/.zsh_history_${HOST}
export HISTSIZE=5000
export SAVEHIST=$HISTSIZE

setopt prompt_subst
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_verify
setopt hist_fcntl_lock
setopt share_history # share command history data

autoload -Uz colors
autoload -Uz compinit
colors
compinit -u

# Fix keys
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

# Fetch platform information
ISVM=0
if ([ -e /proc/cpuinfo ] && grep "flags.*hypervisor" /proc/cpuinfo > /dev/null) || \
   ([ -e /proc/bus/pci/devices ] && grep "virtio-pci" /proc/bus/pci/devices > /dev/null) || \
   (hash pciconf 2>/dev/null && pciconf -l | grep virtio_pci > /dev/null)
then
      ISVM=1
fi

ISLOCAL=$( ([ -n "${SSH_TTY}" ] || [ -n "${SSH_CLIENT}" ]) && echo 0 || echo 1)
PLATFORM="$(uname -s | tr "[A-Z]" "[a-z]")"

# Handle plugins
ZGEN_AUTOLOAD_COMPINIT=0
source "${HOME}/.zgen.zsh"

if ! zgen saved
then
   #Plugins
   zgen oh-my-zsh plugins/git
   zgen oh-my-zsh plugins/git-extras
   zgen oh-my-zsh plugins/colored-man-pages
   zgen oh-my-zsh plugins/history-substring-search

   hash tmux 2>/dev/null && zgen oh-my-zsh plugins/tmux

   zgen load zsh-users/zsh-syntax-highlighting
   zgen load zsh-users/zsh-completions src

   zgen load kennylevinsen/zsh kardan.zsh-theme

   zgen save
fi

# Load extra files
[ -e ~/.zshrc_platform_${PLATFORM} ] && source ~/.zshrc_platform_${PLATFORM}
[ -e ~/.zshrc_host_${HOST} ] && source ~/.zshrc_host_${HOST}
[ -e ~/.env ] && source ~/.env
[ -e ~/.env_platform_${PLATFORM} ] && source ~/.env_platform_${PLATFORM}
[ -e ~/.env_host_${HOST} ] && source ~/.env_host_${HOST}

unset ISVM
unset ISLOCAL
unset PLATFORM
