(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/elpa/dict")
(require 'auto-complete-config)
(ac-config-default)

(ac-set-trigger-key "TAB")
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(setq ac-auto-start 6)

(add-to-list 'ac-user-dictionary-files "~/.emacs.d/ac-dict")
(setq ac-auto-show-menu 0.8)

;; 補完メニュー表示時のみ C-n C-p を有効にする
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
