;; flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)


;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")
