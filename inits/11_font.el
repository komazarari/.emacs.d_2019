(when window-system
  (set-face-attribute 'default nil
                      :family "Ricty"
                      :height 160))

;; Mac では日本語をヒラギノ丸ゴProNに
(when (eq system-type 'darwin)
  (set-fontset-font "fontset-default"
                    'japanese-jisx0208
                    '("Hiragino Maru Gothic ProN")))
