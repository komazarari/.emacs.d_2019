;; ;; デフォルト フォント
;; (set-face-attribute 'default nil :family "Noto Sans Mono CJK JP" :height 120)
;; ;; プロポーショナル フォント
;; (set-face-attribute 'variable-pitch nil :family "Noto Sans Mono CJK JP" :height 120)
;; ;; 等幅フォント
;; (set-face-attribute 'fixed-pitch nil :family "Noto Sans Mono CJK JP" :height 120)
;; ;; ツールチップ表示フォント
;; (set-face-attribute 'tooltip nil :family "Noto Sans Mono CJK JP" :height 120)


;; ;; デフォルト フォント
;; (set-face-attribute 'default nil :family "Source Han Code JP" :height 105 :weight 'semi-light)
;; ;; プロポーショナル フォント
;; (set-face-attribute 'variable-pitch nil :family "Source Han Code JP" :height 105)
;; ;; 等幅フォント
;; (set-face-attribute 'fixed-pitch nil :family "Source Han Code JP" :height 105)
;; ;; ツールチップ表示フォント
;; (set-face-attribute 'tooltip nil :family "Source Han Code JP" :height 105)

;; デフォルト フォント
;; (set-face-attribute 'default nil :family "Ricty" :height 130 :weight 'semi-bold)
(set-face-attribute 'default nil :family "Ricty" :height 130 :weight 'bold)
;; プロポーショナル フォント
(set-face-attribute 'variable-pitch nil :family "Ricty" :height 130 :weight 'bold)
;; 等幅フォント
(set-face-attribute 'fixed-pitch nil :family "Ricty" :height 130 :weight 'bold)
;; ツールチップ表示フォント
(set-face-attribute 'tooltip nil :family "Ricty" :height 90)

;; (set-face-attribute 'default nil :family "Source Han Code JP" :height 120)
;; (add-to-list 'face-font-rescale-alist '(".*Source Han Code.*" . 0.8))

;; (90 (window-system)
;;   (set-default-font "Ricty Discord-15"))

; 全角かな設定
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  (font-spec :family "Source Han Code JP" :size 22))
; 半角ｶﾅ設定
(set-fontset-font (frame-parameter nil 'font)
                  'katakana-jisx0201
                  (font-spec :family "Source Han Code JP" :size 22))
; ずれ確認用
; 0123456789012345678901234567890123456789
; ｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵｱｲｳｴｵ
; あいうえおあいうえおあいうえおあいうえお

; ASCII 文字のフォントをマップする
;; (create-fontset-from-ascii-font "Ricty Discord-14" nil "myfont")
;; (create-fontset-from-ascii-font "Source Han Code JP R-14" nil "myfont2")
;; (create-fontset-from-ascii-font "Noto Sans Mono CJK JP-12" nil "myfont2")
;; (create-fontset-from-ascii-font "Fira Code" nil "myfont3")

; ASCII 以外もマップする
;; (set-fontset-font "fontset-myfont" 'unicode "Ricty Discord-14" nil 'append)
;; (set-fontset-font "fontset-myfont2" 'unicode "Source Han Code JP R-14" nil 'append)
;; (set-fontset-font "fontset-myfont2" 'unicode "Noto Sans Mono CJK JP-12" nil 'append)
;; (set-fontset-font "fontset-myfont3" 'unicode "Fira Code" nil 'append)

; デフォルトフレームに適用する
;; (add-to-list 'default-frame-alist '(font . "fontset-myfont"))
;; (add-to-list 'default-frame-alist '(font . "fontset-myfont2"))
;; (add-to-list 'default-frame-alist '(font . "fontset-myfont3"))

;; (when (window-system)
;;   (set-default-font "Ricty Discord-15"))

;; (when (window-system)
;;   (set-default-font "Fira Code"))
;; (let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
;;                (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
;;                (36 . ".\\(?:>\\)")
;;                (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
;;                (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
;;                (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
;;                (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
;;                (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
;;                (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
;;                (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
;;                (48 . ".\\(?:x[a-zA-Z]\\)")
;;                (58 . ".\\(?:::\\|[:=]\\)")
;;                (59 . ".\\(?:;;\\|;\\)")
;;                (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
;;                (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
;;                (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
;;                (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
;;                (91 . ".\\(?:]\\)")
;;                (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
;;                (94 . ".\\(?:=\\)")
;;                (119 . ".\\(?:ww\\)")
;;                (123 . ".\\(?:-\\)")
;;                (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
;;                (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
;;                )
;;              ))
;;   (dolist (char-regexp alist)
;;     (set-char-table-range composition-function-table (car char-regexp)
;;                           `([,(cdr char-regexp) 0 font-shape-gstring]))))
