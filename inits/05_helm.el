(require 'helm-config)
(helm-mode t)
(helm-migemo-mode 1)

;; Emulate `kill-line' in helm minibuffer
(setq helm-delete-minibuffer-contents-from-point t)
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
  "Emulate `kill-line' in helm minibuffer"
  (kill-new (buffer-substring (point) (field-end))))

(require 'helm-C-x-b)
;(global-set-key (kbd "C-@") 'helm-M-x)
(global-set-key (kbd "M-[") 'helm-M-x)
(global-set-key (kbd "M-x") 'helm-M-x)
;(global-set-key (kbd "C-;") 'helm-mini)
(global-set-key (kbd "C-;") 'helm-for-files)
(global-set-key (kbd "C-:") 'helm-C-x-b) ;
;(global-set-key (kbd "C-:") 'helm-mini)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(setq helm-for-files-preferred-list
      '(helm-source-buffers-list
        helm-source-recentf
        helm-source-bookmarks
        helm-source-file-cache
        helm-source-files-in-current-dir
        ;; 必要とあれば
        ;helm-source-bookmark-set
        ;helm-source-locate)
        ))


;; ace-isearch (isearch + ace-jump
;; ace-isearch か下記の isearch-.. かどっちかを有効に
;; (global-ace-isearch-mode +1)
;; (custom-set-variables
;; ; '(ace-isearch-input-length 7)
;; ; '(ace-isearch-jump-delay 0.25)
;; ; '(ace-isearch-function 'avy-goto-char)
;;  '(ace-isearch-use-jump 'printing-char))

;; ace-isearch かこれかどっちかを有効に
(cl-defun helm-swoop-nomigemo (&key $query ($multiline current-prefix-arg))
  (interactive)
  (let (helm-migemo-mode)
    (helm-swoop :$query $query :$multiline $multiline)))
(defun isearch-forward-or-helm-swoop-or-helm-occur (use-helm-swoop)
  (interactive "p")
  (let (current-prefix-arg
        (helm-swoop-pre-input-function 'ignore))
    (call-interactively
     (case use-helm-swoop
       (1 'isearch-forward)
       ;; C-u C-sを押した場合
       ;; 1000000以上のバッファサイズならばhelm-occur、
       ;; それ以下ならばhelm-swoop
       (4 (if (< 1000000 (buffer-size)) 'helm-occur 'helm-swoop))
       ;; C-u C-u C-sでmigemoなしのhelm-swoop
       (16 'helm-swoop-nomigemo)))))
(global-set-key (kbd "C-s") 'isearch-forward-or-helm-swoop-or-helm-occur)
;; isearch 中に C-o で occur(or swoop) に移行
(define-key isearch-mode-map (kbd "C-o") (if (< 1000000 (buffer-size)) 'helm-occur 'helm-swoop))
;; ここまで
