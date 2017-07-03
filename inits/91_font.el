; ASCII 文字のフォントをマップする
(create-fontset-from-ascii-font "Ricty Discord" nil "myfont")

; ASCII 以外もマップする
(set-fontset-font "fontset-myfont" 'unicode "Ricty Discord" nil 'append)

; デフォルトフレームに適用する
(add-to-list 'default-frame-alist '(font . "fontset-myfont"))
