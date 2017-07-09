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
    use-package ;; だんだん使う
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
    helm-ag
    helm-cmd-t
    ace-isearch
    sequential-command ;; M-u,M-l,M-c を使いやすく
    zop-to-char
    redo+
    edit-server
    auto-complete
    fuzzy
    expand-region
    multiple-cursors
    region-bindings-mode
    key-chord
    smartrep
    state
    ;; format
    yaml-mode
    ;; themes
    color-theme-modern
    ;; text
    open-junk-file
    clipmon
    google-translate
    ;; cording
    comment-dwim-2
    flycheck
    rspec-mode
    ruby-electric
    ))

(when (equal system-type 'darwin)
  (setq my-packages
        (append my-packages
                '(
                  vagrant-tramp
                  ))))

(when (equal system-type 'windows-nt)
  (setq my-packages
        (append my-packages
                '(
                  state
                  mozc
                  mozc-im
                  mozc-popup
                  ))))

(dolist (p my-packages)
  (when (or (not (package-installed-p p)))
    (package-install p)))
