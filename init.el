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
 '(package-selected-packages
   (quote
    (helm-cmd-t sequential-command ace-isearch helm-swoop migemo pcre2el visual-regexp-steroids ace-jump-mode init-loader))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
