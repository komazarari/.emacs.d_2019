(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))
(flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
(flycheck-add-mode 'javascript-eslint 'javascript-mode)
(setq js2-basic-offset 2)

(eval-after-load 'flycheck
  '(custom-set-variables
    '(flycheck-disabled-checkers '(javascript-jshint javascript-jscs))
    ))

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
          '(javascript-jshint)))

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(add-hook 'js2-jsx-mode-hook 'flycheck-mode)