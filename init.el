;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;; load initial files
(package-initialize)

(load (locate-user-emacs-file "./packages"))

(require 'cl-lib)
(require 'generic-x)

(add-to-list 'load-path "~/.emacs.d/elisp/site-lisp")

;;; load config files
(require 'init-loader)
(setq init-loader-show-log-after-init nil) ; 起動時のログ非表示
(init-loader-load (locate-user-emacs-file "./inits"))

(if (not (equal (init-loader-error-log) "")) ; エラーがあったら出す
    (init-loader-show-log))

;(when load-file-name
;  (setq user-emacs-directory (file-name-directory load-file-name)))
; (add-to-list 'load-path user-emacs-directory)
;(add-to-list 'custom-theme-load-path (locate-user-emacs-file "./themes"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "3f44e2d33b9deb2da947523e2169031d3707eec0426e78c7b8a646ef773a2077" "ff8c6c2eb94e776c9eed9299a49e07e70e1b6a6f926dec429b99cf5d1ddca62a" "4c8372c68b3eab14516b6ab8233de2f9e0ecac01aaa859e547f902d27310c0c3" "713f898dd8c881c139b62cf05b7ac476d05735825d49006255c0a31f9a4f46ab" default)))
 '(package-selected-packages
   (quote
    (git-gutter web-mode ido-vertical-mode ido-occasional imenus sr-speedbar fish-mode auto-async-byte-compile package-utils monokai-theme zenburn-theme rainbow-delimiters tangotango-theme json-mode go-mode groovy-mode org-pomodoro alert mozc-temp mozc mozc-im mozc-popup wgrep dockerfile-mode php-mode markdown-mode fuzzy smartrep comment-dwim-2 vagrant-tramp key-chord key-combo google-translate clipmon edit-server redo+ zop-to-char helm-migemo helm-cmd-t sequential-command ace-isearch helm-swoop migemo pcre2el visual-regexp-steroids ace-jump-mode init-loader))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
