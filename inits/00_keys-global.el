;;; シェルに合わせるため、C-hは後退に割り当てる
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)
(global-set-key (kbd "C-h") 'delete-backward-char)

(global-set-key "\C-z" 'scroll-down)
(global-set-key "\C-\M-y" 'insert-register)
(global-set-key "\C-\M-k" 'kill-buffer)

;; C-t はウィンドウ切り替えにする
(global-set-key (kbd "C-t") 'other-window)

;; インデント
(global-set-key "\C-c\C-q" 'indent-region)

;; Mac の Cmd は meta key として使う
(when (eq system-type 'darwin)
  (setq ns-command-modifier (quote meta)))
