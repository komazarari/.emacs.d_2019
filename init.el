;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))
(add-to-list 'load-path user-emacs-directory)

;;; load initial files
(load (locate-user-emacs-file "./macros"))
(load (locate-user-emacs-file "./packages"))

;;; load config files
(pkg-sync 'init-loader require
(init-loader-load (locate-user-emacs-file "./inits")))
