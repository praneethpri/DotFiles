set -g fish_greeting

if status is-interactive
    if not set -q ZELLIJ
        if test "$TERM" = "Alacritty"
            eval (zellij setup --generate-auto-start fish | string collect)
            sleep 0.1
            xdotool key ctrl+g
        end
    end
end

zoxide init fish | source

abbr -a upd sudo pacman -Syu --noconfirm
abbr -a ins sudo pacman -S --noconfirm
abbr -a ser pacman -Ss

# User specific aliases and functions
alias ls='ls -1a --color=auto --ignore=.. --ignore=. --group-directories-first'
alias lsl='ls -lah --color=auto --ignore=.. --ignore=. --group-directories-first'
alias logout='pkill -KILL -u ndppriyankara'
alias ..='z ..'
alias ...='z ../..'
alias cd='z'
alias cls='clear'
alias r='ranger'
alias e='emacs -nw'
alias mv='mv -v'
alias cp='cp -v'
alias xcopy='xclip -selection clipboard'
alias readme='touch README.md'
alias logout='pkill -KILL -u priyankara'
alias sxiv='~/projects/Bash/sxiv-script/./sxiv-script.sh'
alias tp='bpytop'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias lazygitd='lazygit --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias wifi='~/Projects/Bash/./wifiqr.sh'

function home
    z ~
end
