;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ruby mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq tab-width 2)
             (setq indent-tabs-mode nil)
             (setq ruby-indent-level tab-width)
             (make-local-variable 'ac-ignore-case)
             (setq ac-ignore-case nil)
             (make-local-variable 'ac-ignores)
             (add-to-list 'ac-ignores "end")
             )
          )

;; ruby-electric.el
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
;; FIXME
(defun ruby-insert-end ()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))
