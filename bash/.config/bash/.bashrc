#      | |             | |
#      | |__   __ _ ___| |__  _ __ ___
#      | '_ \ / _` / __| '_ \| '__/ __|
#     _| |_) | (_| \__ \ | | | | | (__
#    (_)_.__/ \__,_|___/_| |_|_|  \___|
#

# *** Author : Praneeth Priyankara ***

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export DOCKER_CONFIG="${XDG_STATE_HOME}"/bash/history
ERRFILE="$XDG_CACHE_HOME/X11/xsession-errors"
export EDITOR="/usr/bin/nvim"
# xrdb -load "$XDG_CONFIG_HOME/X11/xresources"

if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

case $- in
    *i*) ;;
      *) return;;
esac

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$HOME/.config/polybar/modules:$PATH"
fi
export PATH

if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
     . "$rc"
    fi
  done
fi
unset rc

##########################
######   ALIASES  ########
##########################

alias ls='ls -1a --color=auto --ignore=.. --ignore=. --group-directories-first'
alias lsl='ls -lah --color=auto --ignore=.. --ignore=. --group-directories-first'

alias ..='z ..'
alias ...='z ../..'
alias ~='z ~'
alias cd='z'
alias cls='clear'
alias r='ranger'
alias e='emacs -nw'
alias mv='mv -v'
alias cp='cp -v'
alias upd='sudo pacman -Syu --noconfirm'
alias ins='sudo pacman -S --noconfirm'
alias ser='pacman -Ss'
alias xcopy='xclip -selection clipboard'
alias readme='touch README.md'
alias logout='pkill -KILL -u priyankara'
alias sxiv='~/.config/bash/./sxiv-script.sh'
alias tp='bpytop'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias lazygitd='lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias wifi='~/Projects/Bash/./wifiqr.sh'
alias jrnl='~/Projects/Bash/./jrnl.sh'

if [[ "$TERM" == "alacritty" ]] && [[ -z "$ZELLIJ" ]]; then
    eval "$(zellij setup --generate-auto-start bash)"
fi

eval "$(zoxide init bash)"

[[ -f ~/.config/bash/prompt.sh ]] && . ~/.config/bash/prompt.sh 

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
