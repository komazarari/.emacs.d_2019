;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
(require 'cl)

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'custom-theme-load-path (locate-user-emacs-file "./themes"))

;;; load initial files
(load (locate-user-emacs-file "./packages"))

;;; load config files
(require 'init-loader)
(setq init-loader-show-log-after-init nil) ; 起動時のログ非表示
(init-loader-load (locate-user-emacs-file "./inits"))

(if (not (equal (init-loader-error-log) "")) ; エラーがあったら出す
    (init-loader-show-log))
