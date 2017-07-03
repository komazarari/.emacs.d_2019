;;; dired の a で開くやつ
(put 'dired-find-alternate-file 'disabled nil)

;;; 右から左に読む言語に対応させないことで描画高速化
(setq-default bidi-display-reordering nil)

;;; splash screenを無効にする
(setq inhibit-splash-screen t)

;;; 同じ内容を履歴に記録しないようにする
(setq history-delete-duplicates t)

;; C-u C-SPC C-SPC …でどんどん過去のマークを遡る
(setq set-mark-command-repeat-pop t)

;;; 複数のディレクトリで同じファイル名のファイルを開いたときのバッファ名を調整する
(require 'uniquify)

;;; filename<dir> 形式のバッファ名にする
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "[^*]+")

;;; ファイルを開いた位置を保存する
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places"))

;;; インデントにTABを使わないようにする
(setq-default indent-tabs-mode nil)

;;; 現在行に色をつける
;(global-hl-line-mode 1)

 ;;; ミニバッファ履歴を次回Emacs起動時にも保存する
(savehist-mode 1)

;;; モードラインに時刻を表示する
(display-time)

 ;;; GCを減らして軽くする
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;;; ログの記録行数を増やす
(setq message-log-max 10000)

;;; 履歴をたくさん保存する
(setq history-length 1000)

;;; メニューバーとツールバーとスクロールバーを消す
(menu-bar-mode -1)
(tool-bar-mode -1)
;(scroll-bar-mode -1)

;; 基本的に utf-8 にする
(setq default-buffer-file-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
;(set-clipboard-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
;(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8-unix)

;; ace-jump
(require 'ace-jump-mode)
(setq ace-jump-mode-gray-background nil)
(setq ace-jump-word-mode-use-query-char nil)
(setq ace-jump-mode-move-keys
      (append "asdfghjkl;:]qwertyuiop@zxcvbnm,." nil))
(global-set-key (kbd "C-o") 'ace-jump-word-mode)

;; 補完
(global-set-key (kbd "M-/") 'hippie-expand)

(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially   ;
        try-complete-file-name             ;
;        try-expand-all-abbrevs             ; 略語展開
;        try-expand-list                    ; 括弧内容
;        try-expand-line                    ; 行
        try-expand-dabbrev                 ;
        try-expand-dabbrev-all-buffers     ;
        try-expand-dabbrev-from-kill       ;
;        try-complete-lisp-symbol-partially ; Emacs lisp シンボル
;        try-complete-lisp-symbol           ; Emacs lisp シンボル all
        ))


;; 警告音鳴らさない
(setq ring-bell-function 'ignore)

;; dired中に e で WritableDired
(require 'wdired)
(setq wdired-allow-to-change-permissions t)
(define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)

; ffap 見直す
;(ffap-bindings)

;; no auto save file
(setq auto-save-default nil)

;; ;; 矩形選択
;; (cua-mode t)
;; (setq cua-enable-cua-keys nil)
;; C-x SPC で標準でできるのでそちらを使おう

;; ido (見直す)
(ido-mode 1)
(ido-everywhere 1)

;; recentf-ext 最近の500fileを保存
(setq recentf-max-saved-items 500)
(setq recentf-exclude
      '("/TAGS$" "/var/tmp/"))
(require 'recentf-ext)

;; visual-regexp
(require 'visual-regexp)
(require 'visual-regexp-steroids)
;(setq vr/engine 'pcre2el)
(global-set-key (kbd "M-%") 'vr/query-replace)

;; sequential-COMMAND
;; 単語入力してから M-u, M-c とかできる
;; C-a C-a でファイル先頭にいける
(require 'sequential-command-config)
(sequential-command-setup-keys)
