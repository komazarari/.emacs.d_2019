(setq inhibit-startup-screen t)
;(setq show-paren-mode 1)
(show-paren-mode nil)
(show-paren-mode 1)
; smartparen
(require 'smartparens-config)
(smartparens-global-mode t)

;; no auto save file
(setq auto-save-default nil)

;; Backup file
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/.backup"))
            backup-directory-alist))

;; 最近ひらいたファイル
(recentf-mode 1)
(global-set-key (kbd "C-c f") 'recentf-open-files)

;; languages, encodings
(set-language-environment "Japanese")
(setq default-buffer-file-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(set-clipboard-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8-unix)
(setq locale-coding-system 'utf-8)

;; yes-noの選択肢をy-nにする
(fset 'yes-or-no-p 'y-or-n-p)

;; use space
(setq-default tab-width 4 indent-tabs-mode nil)

;; リージョンの色反転なし
;(setq transient-mark-mode nil)

;; 矩形選択
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; スクラッチメッセージ
(setq initial-scratch-message "")

;; 行番号・桁番号を表示
(line-number-mode 1)
(column-number-mode 1)

;; タブ、行末の空白を可視化
(defface my-face-b-1 '((t (:background "gray"))) nil)
(defface my-face-b-2 '((t (:background "gray26"))) nil)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)

(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-b-2 append)
     ("　" 0 my-face-b-1 append)
     ("[ \t]+$" 0 my-face-u-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

;; 音無効化
(setq ring-bell-function 'ignore)
