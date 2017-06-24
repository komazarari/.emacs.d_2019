;;; シェルに合わせるため、C-hは後退に割り当てる
(global-set-key (kbd "C-h") 'delete-backward-char)

(global-set-key "\C-z" 'scroll-down)
(global-set-key "\C-\M-y" 'insert-register)

;; C-t はウィンドウ切り替えにする
(global-set-key (kbd "C-t") 'other-window)

;; インデント
(global-set-key "\C-c\C-q" 'indent-region)
