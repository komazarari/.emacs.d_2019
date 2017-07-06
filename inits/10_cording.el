(global-set-key (kbd "M-;") 'comment-dwim-2)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq flycheck-checker 'ruby-rubocop)
             (flycheck-mode 1)))
