(require 'helm-config)
(helm-mode t)

;; Emulate `kill-line' in helm minibuffer
(setq helm-delete-minibuffer-contents-from-point t)
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
  "Emulate `kill-line' in helm minibuffer"
  (kill-new (buffer-substring (point) (field-end))))

(global-set-key (kbd "C-@") 'helm-M-x)
(global-set-key (kbd "C-:") 'helm-mini)
