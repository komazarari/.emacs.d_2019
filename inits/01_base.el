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

;;; リージョンを削除できるように
(delete-selection-mode t)

;; 自動で対応するカッコ入力する
(electric-pair-mode t)

;; 対応カッコ強調
(show-paren-mode 1)

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

;; 位置を出すようにする
(column-number-mode 1)

;; 基本的に utf-8 にする
(setq default-buffer-file-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
;(set-clipboard-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
;(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8-unix)

;; windows 以外は shell から PATH 引き継ぎ
;; windows はめんどくさいので windows-init.el に...
(when (not (equal system-type 'windows-nt))
  (exec-path-from-shell-initialize)
  )

;; mykie
(require 'mykie)

;; ace-jump
(require 'ace-jump-mode)
(setq ace-jump-mode-gray-background nil)
(setq ace-jump-word-mode-use-query-char nil)
(setq ace-jump-mode-move-keys
      (append "asdfghjkl;wertyuio" nil))
;; (global-set-key (kbd "C-o") 'ace-jump-word-mode)
(mykie:global-set-key "C-o"
  :default    ace-jump-word-mode
  :C-u!       ace-jump-line-mode
  :C-u*2!     ace-jump-char-mode
  )

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

;; Backup file
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/.backup"))
            backup-directory-alist))

;; ;; 矩形選択
;; (cua-mode t)
;; (setq cua-enable-cua-keys nil)
;; C-x SPC で標準でできるのでそちらを使おう

;; ido (見直す)
(setq ido-enable-flex-matching 1)
(ido-mode 1)
(ido-vertical-mode 1)
;; (setq ido-vertical-define-keys 'C-n-and-C-p-only)
(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)
;; (ido-everywhere 1)

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


;; 標準 misc 系
(require 'misc)
;; 次の文字までを削除
;;(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "M-z") 'zop-up-to-char)

;; M-f の挙動を変更、次の単語の先頭にする
(global-set-key (kbd "M-f") 'forward-to-word)
(global-set-key (kbd "M-b") 'backward-to-word)

;; ウィンドウレイアウトをもどしたり
(winner-mode 1)
(global-set-key (kbd "C-\\") 'winner-undo)

;; undo / redo カイゼン C-/ で undo, C-M-/ で redo
(require 'redo+)
(global-set-key (kbd "C-M-/") 'redo)

;; ediff
;; コントロールバッファを同一フレームに
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; 左右に分割
(setq ediff-split-window-function 'split-window-horizontally)

;; M-\ 二回で スペース調整
(global-set-key (kbd "M-\\") 'shrink-whitespace)

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/elpa/dict")
(ac-config-default)
(ac-set-trigger-key "TAB")
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(define-key ac-mode-map (kbd "<C-tab>") 'auto-complete)
(setq ac-auto-start 4)
(setq ac-use-fuzzy t)
(add-to-list 'ac-user-dictionary-files "~/.emacs.d/ac-dict")
(setq ac-auto-show-menu 0.2)
;; 補完メニュー表示時のみ C-n C-p を有効にする
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(add-to-list 'ac-modes 'haml-mode)
(add-to-list 'ac-modes 'text-mode)
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'fundamental-mode)


;; 現在位置からいい感じに region 選択
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-M-=") 'er/contract-region)

;; カーソル分身周り
(require 'multiple-cursors)
(multiple-cursors-mode)
(require 'region-bindings-mode)
(region-bindings-mode-enable)
(define-key region-bindings-mode-map "a" 'mc/mark-all-like-this)
(define-key region-bindings-mode-map "p" 'mc/mark-previous-lines)
(define-key region-bindings-mode-map "n" 'mc/mark-next-lines)
(define-key region-bindings-mode-map "P" 'mc/mark-previous-like-this)
(define-key region-bindings-mode-map "N" 'mc/mark-next-like-this)
(define-key region-bindings-mode-map "s" 'mc/skip-to-next-like-this)
(define-key region-bindings-mode-map "S" 'mc/skip-to-previous-like-this)
(define-key region-bindings-mode-map "m" 'mc/mark-more-like-this-extended)
(define-key region-bindings-mode-map "q" 'query-replace-regexp)

;; org-mode の移動
(require 'smartrep)
(require 'org)
(smartrep-define-key org-mode-map "C-c"
  '(("C-n" . org-next-visible-heading)
    ("C-p" . org-previous-visible-heading)
    ("C-u" . outline-up-heading)
    ("C-f" . org-forward-heading-same-level)
    ("C-b" . org-backward-heading-same-level)))

;; window のリサイズ
(smartrep-define-key global-map "C-x"
  '(("o" . other-window)
    ("0" . delete-window)
    ("1" . delete-other-windows)
    ("2" . split-window-below)
    ("3" . split-window-right)
    ("{" . shrink-window-horizontally)
    ("}" . enlarge-window-horizontally)
    ("+" . balance-windows)
    ("^" . enlarge-window)
    ("-" . shrink-window)))

;; タイトルバーにフルパス
(setq frame-title-format "%f")

;; 空白とかを可視化
(require 'whitespace)
(setq whitespace-style '(
                         face           ; faceで可視化
                         trailing       ; 末尾
                         tabs           ; タブ
                         space
                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         tab-mark
                         ))
; from http://cloverrose.hateblo.jp/entry/2013/04/12/041758
(setq whitespace-display-mappings
      '(
        ;; (space-mark   ?\     [?\u00B7]     [?.]) ; space - centered dot
        (space-mark   ?\xA0  [?\u00A4]     [?_]) ; hard space - currency
        (space-mark   ?\x8A0 [?\x8A4]      [?_]) ; hard space - currency
        (space-mark   ?\x920 [?\x924]      [?_]) ; hard space - currency
        (space-mark   ?\xE20 [?\xE24]      [?_]) ; hard space - currency
        (space-mark   ?\xF20 [?\xF24]      [?_]) ; hard space - currency
        (space-mark ?\u3000 [?\u25a1] [?_ ?_]) ; full-width-space - square
        ;; NEWLINE is displayed using the face `whitespace-newline'
        ;; (newline-mark ?\n    [?$ ?\n])  ; eol - dollar sign
        ;; (newline-mark ?\n    [?\u21B5 ?\n] [?$ ?\n])	; eol - downwards arrow
        ;; (newline-mark ?\n    [?\u00B6 ?\n] [?$ ?\n])	; eol - pilcrow
        ;; (newline-mark ?\n    [?\x8AF ?\n]  [?$ ?\n])	; eol - overscore
        ;; (newline-mark ?\n    [?\x8AC ?\n]  [?$ ?\n])	; eol - negation
        ;; (newline-mark ?\n    [?\x8B0 ?\n]  [?$ ?\n])	; eol - grade
        ;;
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark     ?\t    [?\u00BB ?\t] [?\\ ?\t]) ; tab - left quote mark
))
(defvar my/bg-color "#232323")
(set-face-attribute 'whitespace-trailing nil
                    :background my/bg-color
                    :foreground "DeepPink"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :background my/bg-color
                    :foreground "LightSkyBlue"
                    :underline t)
(set-face-attribute 'whitespace-space nil
                    :background my/bg-color
                    :foreground "GreenYellow"
                    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
                    :background my/bg-color)
(setq whitespace-action '(auto-cleanup))
(global-whitespace-mode 1)

;; yasnippet
(require 'yasnippet)
(require 'helm-c-yasnippet)
(setq helm-yas-space-match-any-greedy t)
(global-set-key (kbd "C-c y") 'helm-yas-complete)
(push '("emacs.+/snippets/" . snippet-mode) auto-mode-alist)
(yas-global-mode 1)


(require 'wgrep nil t)
;; ;; (setf wgrep-enable-key "e")
;; (setq wgrep-enable-key "p")
;; ;;; wgrep終了時にバッファを保存
;; (setq wgrep-auto-save-buffer t)
;; ;;; read-only bufferにも変更を適用する
;; (setq wgrep-change-readonly-file t)
