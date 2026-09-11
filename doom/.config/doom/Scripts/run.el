;;; run.el --- Eshell aliases configuration

(defvar eshell-command-aliases-list
  '(
    ("z" "cd $1")
    (".." "cd ..")
    ("..." "cd ../..")
    ("~" "cd ~")

    ("cls" "clear")
    ("upd" "sudo pacman -Syu --noconfirm $*")
    ("ins" "sudo pacman -S --noconfirm $*")
    ("ser" "pacman -Ss $*")
    ("xcopy" "xclip -selection clipboard $*")
    ("readme" "touch README.md")

    ("mv" "mv -v $1")
    ("cp" "cp -v $1")

    ("e" "find-file $1")

    ("less" "view-file $1")
    )
  "Eshell command aliases")

(provide 'run)
;;; run.el ends here
