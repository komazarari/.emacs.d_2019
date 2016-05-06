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
             (setq flycheck-checker 'ruby-rubocop)
             (flycheck-mode 1)
             )
          )

(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Berksfile" . ruby-mode))

;; ruby-electric.el
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
;; FIXME
(defun ruby-insert-end ()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))
