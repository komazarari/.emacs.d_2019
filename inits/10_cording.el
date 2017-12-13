(global-set-key (kbd "M-;") 'comment-dwim-2)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(add-hook 'ruby-mode-hook
          '(lambda ()
             (flycheck-select-checker 'ruby-rubocop)
             (flycheck-mode 1)
             (ruby-electric-mode t)
             )
          )

(add-to-list 'auto-mode-alist '("Jenkinsfile" . groovy-mode))
