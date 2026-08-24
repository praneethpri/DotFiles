(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-xcode t)
  (doom-themes-visual-bell-config))
(setq doom-theme 'doom-xcode)

(rainbow-mode -1)

(setq doom-font (font-spec :family "Cascadia Code" :size 16 :weight 'semi-bold)
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

(setq eshell-aliases-file (concat doom-user-dir "Scripts/run.el"))

(set-fontset-font t 'sinhala (font-spec :family "Noto Sans Sinhala"))

(set-char-table-range composition-function-table
                      '(#x0D80 . #x0DFF)
                      (list (vector "[\x0D80-\x0DFF]+" 0 'font-shape-gstring)))

(setq org-directory "~/org/")

(after! dirvish
  (setq dirvish-attributes
        '(vc-state-icon file-slots icons file-size)))

(setq dired-dwim-target t)

(setq vterm-shell "/usr/bin/fish")

(add-hook 'vterm-mode-hook (lambda () (display-line-numbers-mode -1)))

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

(org-babel-do-load-languages
 'org-babel-load-languages
 '((yaml . t)
   (shell . t)))
