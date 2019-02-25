(require 'helm)
(require 'helm-config)
(helm-mode t)
(helm-migemo-mode 1)

;; Emulate 'kill-line' in helm minibuffer
(setq helm-delete-minibuffer-contents-from-point t)
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
  "Emulate 'kill-line' in helm minibuffer"
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

(require 'helm-ghq)
(add-to-list 'exec-path "~/dev/bin")

(setq helm-for-files-preferred-list
      '(helm-source-buffers-list
        helm-source-recentf
        helm-source-cmd-t-caches
        helm-source-files-in-current-dir
        helm-source-file-cache
        helm-source-bookmarks
        ;; 必要とあれば
        ;helm-source-bookmark-set
        ;helm-source-locate)
        ))
(when (executable-find "ghq")
  (setq helm-for-files-preferred-list
        (append helm-for-files-preferred-list '(helm-source-ghq))))

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

;; from http://emacs.rubikitch.com/helm-ag/
;;; ag以外の検索コマンドも使える
;; (setq helm-ag-base-command "grep -rin")
;; (setq helm-ag-base-command "csearch -n")
;; (setq helm-ag-base-command "pt --nocolor --nogroup")
(setq helm-ag-base-command "rg --vimgrep --no-heading")
;;; 現在のシンボルをデフォルトのクエリにする
(require 'helm-files)
(require 'helm-ag)
(setq helm-ag-insert-at-point 'symbol)

;;; C-M-gはちょうどあいてる
;;; C-M-g で helm-ag (grep), C-u C-M-g で helm-cmd-t-grep (git grep)
(mykie:global-set-key "C-M-g"
  :default    helm-ag
  :C-u!       helm-cmd-t-grep
  )
;; (global-set-key (kbd "C-M-g") 'helm-ag)
(global-set-key (kbd "C-M-k") 'backward-kill-sexp) ;推奨

(defun helm-ag-dot-emacs ()
  ".emacs.d以下を検索"
  (interactive)
  (helm-ag "~/.emacs.d/"))
(require 'projectile nil t)
(defun helm-projectile-ag ()
  "Projectileと連携"
  (interactive)
  (helm-ag (projectile-project-root)))
;; (helm-ag "~/.emacs.d/")


;; 以下 http://emacs.rubikitch.com/imenus/ のやつ
(require 'imenus)
;;; ido化: imenus/with-ido imenus-mode-buffers/with-idoを定義
(with-ido-completion imenus)
;;; エラー対策
(defun imenu-find-default--or-current-symbol (&rest them)
  (condition-case nil
      (apply them)
    (error (thing-at-point 'symbol))))
(advice-add 'imenu-find-default :around 'imenu-find-default--or-current-symbol)
;; C-M-s C-M-sで現在のシンボルをhelm-multi-swoopできるよ！
(global-set-key (kbd "C-M-s") (with-ido-completion imenus-mode-buffers))


;;; M-oでのmulti-occurをシンボル正規表現にするよう改良
(push '(occur . imenus-ido-multi-occur) imenus-actions)
(defun imenus-ido-multi-occur (buffers input)
  (multi-occur buffers
               (format "\\_<%s\\_>"
                       (regexp-quote (replace-regexp-in-string "^.*|" "" input)))))

;;; C-M-sで関数呼び出しをhelm-multi-swoopできるようにした
(push '(helm-multi-swoop . imenus-helm-multi-swoop) imenus-actions)
(defun imenus-helm-multi-swoop (buffers input)
  (helm-multi-swoop (replace-regexp-in-string "^.*|" "" input)
                    (mapcar 'buffer-name buffers)))
(define-key imenus-minibuffer-map (kbd "C-M-s") 'imenus-exit-to-helm-multi-swoop)
(defun imenus-exit-to-helm-multi-swoop ()
  "Exit from imenu prompt; start `helm-multi-swoop' with the current input."
  (interactive)
  (setq imenus-exit-status 'helm-multi-swoop)
  (imenus-exit-minibuffer))
