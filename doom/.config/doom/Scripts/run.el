alias .. z ..
alias ... z ../..
alias ~ z ~

alias cls clear
alias upd sudo pacman -Syu --noconfirm $*
alias ins sudo pacman -S --noconfirm $*
alias ser pacman -S $*
alias xcopy xclip -selection clipboard $*
alias readme touch README.md

alias mv mv -v $1
alias cp cp -v $1

alias e find-file $1

alias less view-file $1
