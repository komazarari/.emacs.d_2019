;; デフォルト フォント
(set-face-attribute 'default nil :family "Noto Sans Mono CJK JP" :height 120)
;; プロポーショナル フォント
(set-face-attribute 'variable-pitch nil :family "Noto Sans Mono CJK JP" :height 120)
;; 等幅フォント
(set-face-attribute 'fixed-pitch nil :family "Noto Sans Mono CJK JP" :height 120)
;; ツールチップ表示フォント
(set-face-attribute 'tooltip nil :family "Noto Sans Mono CJK JP" :height 90)

;; (when (window-system)
;;   (set-default-font "Ricty Discord-15"))

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
