;; 前提
;; C:\\msys64 に msys2 がインストールされている
;; C:\msys64\mingw64 に mingw がインストールされている
;; find, grep, diff, ag,... などがこのPATHで使える

;; MSYS2 のコマンドを使えるようにする.
(setenv "PATH"
  (concat
   ;; 下記の行に MSYS2 のコマンドの実行可能ファイルがある場所を設定してください. スラッシュが2つ連続することに注意！
   ;; 区切り文字はセミコロン
   "C:\\msys64\\usr\\bin;"
   "C:\\msys64\\mingw64\\bin;"
   (getenv "PATH")))

;; 区切り文字はなし
;(setq exec-path (append exec-path '("C:\\Programs\\msys64\\usr\\bin")))
(setq exec-path (append exec-path '("C:\\msys64\\usr\\bin")))
(setq exec-path (append exec-path '("C:\\msys64\\mingw64\\bin")))


;; mozc 関連
;; ここから
;; PATHの通っているところに mozc_emacs_helper.exe が配置されてること
(require 'mozc-im)
(require 'mozc-popup)
(require 'mozc-cursor-color)

(setq default-input-method "japanese-mozc-im")

;; popupスタイル を使用する
(setq mozc-candidate-style 'popup)

;; カーソルカラーを設定する
;; (setq mozc-cursor-color-alist '((direct        . "red")
;;                                 (read-only     . "yellow")
;;                                 (hiragana      . "green")
;;                                 (full-katakana . "goldenrod")
;;                                 (half-ascii    . "dark orchid")
;;                                 (full-ascii    . "orchid")
;;                                 (half-katakana . "dark goldenrod")))
;; カーソルの点滅を OFF にする
(blink-cursor-mode 0)

;; C-' で IME をトグルする
(global-set-key (kbd "C-'") 'toggle-input-method)
(define-key isearch-mode-map (kbd "C-'") 'isearch-toggle-input-method)

(define-minor-mode overriding-minor-mode
  "強制的にC-'を割り当てる"             ;説明文字列
  t                                     ;デフォルトで有効にする
  ""                                    ;モードラインに表示しない
  `((,(kbd "C-'") . toggle-input-method)))

;; mozc-cursor-color を利用するための対策
(make-variable-buffer-local 'mozc-im-mode)
(add-hook 'mozc-im-activate-hook (lambda () (setq mozc-im-mode t)))
(add-hook 'mozc-im-deactivate-hook (lambda () (setq mozc-im-mode nil)))

(advice-add 'mozc-cursor-color-update
            :around (lambda (orig-fun &rest args)
                      (let ((mozc-mode mozc-im-mode))
                        (apply orig-fun args))))

;; isearch を利用する前後で IME の状態を維持するための対策
(add-hook 'isearch-mode-hook
          (lambda ()
            (setq im-state mozc-im-mode)))
(add-hook 'isearch-mode-end-hook
          (lambda ()
            (unless (eq im-state mozc-im-mode)
              (if im-state
                  (activate-input-method default-input-method)
                (deactivate-input-method)))))

;; wdired 終了時に IME を OFF にする
(require 'wdired)
(advice-add 'wdired-finish-edit
            :after (lambda (&rest args)
                     (deactivate-input-method)))

;; mozc 関連 helm
;; helm でミニバッファの入力時に IME の状態を継承しない
(setq helm-inherit-input-method nil)

;; helm の検索パターンを mozc を使って入力した場合にエラーが発生することがあるのを改善する
(advice-add 'mozc-helper-process-recv-response
            :around (lambda (orig-fun &rest args)
                      (cl-loop for return-value = (apply orig-fun args)
                               if return-value return it)))

;; helm の検索パターンを mozc を使って入力する場合、入力中は helm の候補の更新を停止する
(advice-add 'mozc-candidate-dispatch
            :before (lambda (&rest args)
                      (when (and (fboundp 'helm-alive-p)
                                 (helm-alive-p))
                        (cl-case (nth 0 args)
                          ('update
                           (unless helm-suspend-update-flag
                             (helm-kill-async-processes)
                             (setq helm-pattern "")
                             (setq helm-suspend-update-flag t)))
                          ('clean-up
                           (when helm-suspend-update-flag
                             (setq helm-suspend-update-flag nil)))))))

;; helm で候補のアクションを表示する際に IME を OFF にする
(advice-add 'helm-select-action
            :before (lambda (&rest args)
                      (deactivate-input-method)))
;; Windows の mozc では、セッション接続直後 directモード になるので hiraganaモード にする
(advice-add 'mozc-session-execute-command
            :after (lambda (&rest args)
                     (when (eq (nth 0 args) 'CreateSession)
                       ;; (mozc-session-sendkey '(hiragana)))))
                       (mozc-session-sendkey '(Hankaku/Zenkaku)))))

;; ここまで
