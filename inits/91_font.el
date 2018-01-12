; ASCII 文字のフォントをマップする
(create-fontset-from-ascii-font "Ricty Discord-14" nil "myfont")
(create-fontset-from-ascii-font "Source Han Code JP R-14" nil "myfont2")

; ASCII 以外もマップする
(set-fontset-font "fontset-myfont" 'unicode "Ricty Discord-14" nil 'append)
(set-fontset-font "fontset-myfont2" 'unicode "Source Han Code JP R-14" nil 'append)

; デフォルトフレームに適用する
(add-to-list 'default-frame-alist '(font . "fontset-myfont"))
;(add-to-list 'default-frame-alist '(font . "fontset-myfont2"))
