;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; package.el
(require 'package)
(setq package-user-dir "~/.emacs.d/elisp/elpa/")
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defvar my-packages
  '(
    ;; base
    init-loader
    ace-jump-mode
    recentf-ext
    visual-regexp
    visual-regexp-steroids
    exec-path-from-shell
    pcre2el
    migemo
    helm
    helm-migemo
    helm-swoop
    helm-cmd-t
    ace-isearch
    sequential-command ;; M-u,M-l,M-c を使いやすく
    zop-to-char
    redo+
    edit-server
    auto-complete
    expand-region
    multiple-cursors
    region-bindings-mode
    ;; themes
    color-theme-modern
    ;; text
    open-junk-file
    clipmon
    google-translate
    ))

(dolist (p my-packages)
  (when (or (not (package-installed-p p)))
    (package-install p)))
