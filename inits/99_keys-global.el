;;; シェルに合わせるため、C-hは後退に割り当てる
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)
(global-set-key (kbd "C-h") 'delete-backward-char)

(global-set-key "\C-z" 'scroll-down)
(global-set-key "\C-\M-y" 'insert-register)
(global-set-key "\C-\M-k" 'kill-buffer)

;; C-, ウィンドウ切り替え
(global-set-key (kbd "C-,") 'other-window)
;;  => 95_additional にも np 同時押し

;; インデント
(global-set-key "\C-c\C-q" 'indent-region)

;; Mac の Cmd は meta key として使う
(when (eq system-type 'darwin)
  (setq ns-command-modifier (quote meta)))