(setq doom-theme 'doom-one)

(setq doom-font (font-spec :family "Fira Code" :size 14 :weight 'semi-bold)
      doom-variable-pitch-font (font-spec :family "IBM Plex Mono" :size 13 :weight 'regular))

(setq display-line-numbers-type t)

(setq select-enable-clipboard t)

(after! evil
  (evil-ex-define-cmd "q" #'kill-current-buffer))

(after! evil
  (evil-ex-define-cmd "wq" #'kill-buffer--possibly-save))

(after! evil-mode
  (define-key evil-normal-state-map (kbd "ZZ") #'save-buffer))

(map! "<mouse-3>" #'clipboard-kill-ring-save)

(add-to-list 'load-path "~/.config/doom/Scripts/")

(provide 'run)

(after! wp
  (set-fontset-font "fontset-default"
                    'sinhala
                    (font-spec
                     :family "Noto Sans Sinhala"
                     :size 14))) ;;

(after! org
  (set-char-table-range composition-function-table '(#x0D80 . #x0DFF) 'font-shape-gstring))

(setq org-directory "~/org/")

(after! dirvish
  (setq dirvish-attributes
        '(vc-state-icon file-slots icons file-size)))

(setq dired-dwim-target t)

(setq vterm-shell "/usr/bin/fish")

(map! :leader
      :desc "Opening VTerm" "v t" #'+vterm/here)

(map! :leader
      :desc "Opening Eshell" "v e" #'eshell)

(after! org
  (org-babel-do-load-languages
   'org-babel-do-load-languages
   '((js . t))))

(add-to-list 'auto-mode-alist '("\\.mjml\\'" . web-mode))
(setq web-mode-content-types-alist '(("xml" . "\\.mjml\\'")))
