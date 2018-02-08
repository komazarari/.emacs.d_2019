;; 必須ではない感じのをまとめる

;; ブラウザから emacs に edit-server
(require 'edit-server)
(edit-server-start)
(setq edit-server-new-frame nil)

;; window の alpha 設定する
(when window-system
  (server-start)
  (set-frame-parameter nil 'alpha 85))

(defun set-alpha (alpha-num)
  "set frame parameter 'alpha"
  (interactive "nAlpha: ")
  (set-frame-parameter nil 'alpha (cons alpha-num '(90))))

;; 同時押し
(require 'key-chord)
;;; タイムラグを設定
(setq key-chord-two-keys-delay 0.05)
(setq key-chord-one-key-delay 0.15)
(key-chord-mode 1)
;;; 設定例
(key-chord-define-global "np" 'other-window)
(key-chord-define emacs-lisp-mode-map "df" 'describe-function)
(key-chord-define-global "vv" 'find-alternate-file)

;; 検索 M-s M-w (eww-search-words) で google 使う
(setq eww-search-prefix "https://www.google.co.jp/search?btnI&q=")
