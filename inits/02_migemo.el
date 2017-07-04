(when (and (locate-library "migemo") (executable-find "cmigemo"))
  (setq migemo-command "cmigemo")
  (when (equal system-type 'windows-nt)
    (setq migemo-dictionary "C:/tools/cmigemo-default-win64/dict/utf-8/migemo-dict")
    ;; (setq migemo-dictionary "c:/tools/cmigemo-default-win64/dict/cp932")
    (setq migemo-options '("-q" "--emacs" "-i" "\a"))
    (setq migemo-coding-system 'utf-8-unix) ; 文字コードに注意.
    ;; (setq migemo-coding-system 'cp932-unix) ; 文字コードに注意.
    )
  (when (equal system-type 'darwin)
    (setq migemo-dictionary "/usr/local/Cellar/cmigemo/20110227/share/migemo/utf-8/migemo-dict")
    (setq migemo-dictionary "C:/tools/cmigemo-default-win64/dict/utf-8/migemo-dict") 
    (setq migemo-options '("-q" "--emacs" "-i" "\a"))
    )
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo") ; ロードパス指定.
  (migemo-init))


;;   (setq migemo-command "cmigemo")
;;   (setq migemo-dictionary "C:/tools/cmigemo-default-win64/dict/utf-8") 
;; ;  (setq migemo-dictionary "c:/tools/cmigemo-default-win64/dict/cp932") 
;;   (setq migemo-options '("-q" "--emacs" "-i" "\a"))
;;   (setq migemo-user-dictionary nil)
;;   (setq migemo-regex-dictionary nil)
;;   (setq migemo-coding-system 'utf-8-unix) ; 文字コードに注意.
;; ; (setq migemo-coding-system 'cp932-unix) ; 文字コードに注意.
;;   (load-library "migemo") ; ロードパス指定.
;;   (migemo-init)

;; (setq migemo-dictionary "C:/.emacs.d/etc/migemo-dict/utf-8/migemo-dict")
;; (setq migemo-command "cmigemo")
;; (setq migemo-options '("-q" "--emacs" "-i" "\a"))
;; (setq migemo-user-dictionary nil)
;; (setq migemo-regex-dictionary nil)
;; (setq migemo-coding-system 'utf-8-unix)
;; (load-library "migemo")


;; (require 'migemo)
;; ;;;(setq migemo-dictionary "C:/Users/username/AppData/Roaming/.emacs.d/conf/migemo/dict/cp932/migemo-dict")
;; (setq migemo-dictionary "C:/tools/cmigemo-default-win64/dict/utf-8") ; 文字コードに注意.
;; (setq migemo-command "cmigemo")
;; (setq migemo-options '("-q" "--emacs" "-i" "\a")) (setq migemo-user-dictionary nil) (setq migemo-regex-dictionary nil)
;; (setq migemo-coding-system 'utf-8-unix) ; 文字コードに注意.
;; ;;;(setq migemo-coding-system 'cp932-unix)
;; (load-library "migemo") ; ロードパス指定.
;; (migemo-init)


;; (when (locate-library "migemo")
;;   (setq migemo-command "/usr/local/bin/cmigemo") ; HERE cmigemoバイナリ
;;   (setq migemo-options '("-q" "--emacs"))
;;   (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict") ; HERE Migemo辞書
;;   (setq migemo-user-dictionary nil)
;;   (setq migemo-regex-dictionary nil)
;;   (setq migemo-coding-system 'utf-8-unix)
;;   (load-library "migemo")
;;   (migemo-init))
