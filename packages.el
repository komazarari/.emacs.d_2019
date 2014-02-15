;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; package.el
(require 'package)
(setq package-user-dir "~/.emacs.d/elisp/elpa/")
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(package-initialize)


(defvar my-packages
  '(
    haml-mode
    ruby-mode
    markdown-mode
    scss-mode
    yaml-mode
    ido
    rinari
    yasnippet
    inf-ruby
    ruby-electric
    auto-complete
    ))
(dolist (p my-packages)
  (when (or (not (package-installed-p p)))
    (package-install p)))
