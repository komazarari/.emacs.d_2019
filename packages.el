;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;; package.el
(require 'package)
(setq package-user-dir "~/.emacs.d/elisp/elpa/")
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(defvar my-packages
  '(
    ;; base
    init-loader
    use-package ;; だんだん使う
    package-utils
    auto-async-byte-compile
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
    mykie
    ace-isearch
    sequential-command ;; M-u,M-l,M-c を使いやすく
    zop-to-char
    sr-speedbar
    imenus
    ;; redo+ ;; melpa になくなったので site-lisp に置く
    edit-server
    auto-complete
    fuzzy
    expand-region
    multiple-cursors
    region-bindings-mode
    key-chord
    smartrep
    state
    magit
    shrink-whitespace
    yasnippet
    helm-c-yasnippet
    wgrep
    mozc
    mozc-im
    mozc-popup
    mozc-temp
    ac-mozc
    ripgrep
    ;; format
    yaml-mode
    groovy-mode
    dockerfile-mode
    fish-mode
    ;; themes
    color-theme-modern
    monokai-theme
    ;; text
    markdown-mode
    open-junk-file
    clipmon
    google-translate
    ;; cording
    helm-ghq
    comment-dwim-2
    flycheck
    rspec-mode
    ruby-electric
    electric-operator
    go-mode
    go-autocomplete
    go-eldoc
    rjsx-mode
    json-mode
    rainbow-delimiters
    ;; go-dlv
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
                  ))))

(dolist (p my-packages)
  (when (or (not (package-installed-p p)))
    (package-install p)))
