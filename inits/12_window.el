(when window-system
  (server-start)
  (set-frame-parameter nil 'alpha 85))

(defun set-alpha (alpha-num)
  "set frame parameter 'alpha"
  (interactive "nAlpha: ")
  (set-frame-parameter nil 'alpha (cons alpha-num '(90))))
