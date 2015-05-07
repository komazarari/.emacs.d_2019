;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; package.el
(require 'package)
(setq package-user-dir "~/.emacs.d/elisp/elpa/")
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(package-initialize)

(unless package-archive-contents
    (package-refresh-contents))

(defvar my-packages
  '(
    init-loader
    exec-path-from-shell
    cl-lib
    haml-mode
    ruby-mode
    rspec-mode
    rbenv
    php-mode
    markdown-mode
    scss-mode
    yaml-mode
    ido
    yasnippet
    inf-ruby
    ruby-electric
    fuzzy
    auto-complete
    rinari
    helm
    magit
    multiple-cursors
    region-bindings-mode
    coffee-mode
    edit-server
    feature-mode
    smart-compile
    ctags-update
    haskell-mode
    ac-haskell-process
    flymake-haskell-multi
    smartparens
    ))
(dolist (p my-packages)
  (when (or (not (package-installed-p p)))
    (package-install p)))
