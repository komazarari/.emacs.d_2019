(require 'google-translate)
(global-set-key "\C-xt" 'google-translate-at-point)
(global-set-key "\C-xT" 'google-translate-query-translate)

;; デフォルト ja -> en
(custom-set-variables
 '(google-translate-default-source-language "ja")
 '(google-translate-default-target-language "en"))

(push '("*Google Translate*") popwin:special-display-config)
