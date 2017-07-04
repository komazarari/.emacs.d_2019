;; 必須ではない感じのをまとめる

;; ブラウザから emacs に edit-server
(require 'edit-server)
(edit-server-start)
(setq edit-server-new-frame nil)

;; window の alpha 設定する
(when window-system
  (server-start)
  (set-frame-parameter nil 'alpha 85))

(defun set-alpha (alpha-num)
  "set frame parameter 'alpha"
  (interactive "nAlpha: ")
  (set-frame-parameter nil 'alpha (cons alpha-num '(90))))

