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

(add-hook 'javascript-mode-hook
          (setq js-indent-level 2))

(require 'go-autocomplete)
;; (require 'go-dlv)
(add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'go-mode-hook
          '(lambda ()
             (add-hook 'before-save-hook 'gofmt-before-save)
             (local-set-key (kbd "M-.") 'godef-jump)
             (local-set-key (kbd "M-,") 'pop-tag-mark)
             (setq tab-width 4)
             (setq whitespace-style '(
                                      face
                                      trailing
                                      empty
                                      space-mark
                                      ))
             )
          )
