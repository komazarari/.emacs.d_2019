(defun coffee-custom ()
  "coffee-mode-hook"
  (and (set (make-local-variable 'tab-width) 2)
       (set (make-local-variable 'coffee-tab-width) 2))
  )

(add-hook 'coffee-mode-hook
          '(lambda ()
             (coffee-custom)
             )
          )

(add-to-list 'auto-mode-alist '("\\.cson" . coffee-mode))
