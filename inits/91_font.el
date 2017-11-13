; ASCII 文字のフォントをマップする
(create-fontset-from-ascii-font "Ricty Discord-16" nil "myfont")

; ASCII 以外もマップする
(set-fontset-font "fontset-myfont" 'unicode "Ricty Discord-16" nil 'append)

; デフォルトフレームに適用する
(add-to-list 'default-frame-alist '(font . "fontset-myfont"))
