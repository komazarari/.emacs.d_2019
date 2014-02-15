;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; key-binding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key "\C-xg" 'goto-line)
(global-set-key "\C-x\C-g" 'grep-find)
;(global-set-key [mouse-2] 'goto-line)
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-z" 'scroll-down)
(global-set-key "\C-\M-y" 'insert-register)

;; 分割時に C-x p で逆戻り
(define-key ctl-x-map "p"
  #'(lambda (arg) (interactive "p") (other-window (- arg))))

(global-set-key "\C-c\C-q" 'indent-region) ;
(global-set-key "\C-c\C-r" 'query-replace-regexp) ;

;; for osx
(when (eq system-type 'darwin)
  (setq ns-command-modifier (quote meta))
  (setq ns-alternate-modifier (quote super))
  )
