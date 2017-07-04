(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/elpa/dict")
(ac-config-default)

(ac-set-trigger-key "TAB")
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(define-key ac-mode-map (kbd "<C-tab>") 'auto-complete)
(setq ac-auto-start 3)
(setq ac-use-fuzzy t)

(add-to-list 'ac-user-dictionary-files "~/.emacs.d/ac-dict")
(setq ac-auto-show-menu 0.8)

;; 補完メニュー表示時のみ C-n C-p を有効にする
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

(add-to-list 'ac-modes 'haml-mode)
(add-to-list 'ac-modes 'text-mode)
(add-to-list 'ac-modes 'fundamental-mode)
