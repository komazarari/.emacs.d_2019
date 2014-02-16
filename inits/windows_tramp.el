(setenv "PATH"
  (concat
   "C:\\Program Files (x86)\\PuTTY" ";"
   "C:\\cygwin64\\usr\\local\\bin" ";"
   "C:\\cygwin64\\usr\\bin" ";"
   "C:\\cygwin64\\bin" ";"
   (getenv "PATH")))

(require 'tramp)
;(setq tramp-default-method "plink")
(setq tramp-default-method "ssh")
(setq tramp-shell-prompt-pattern "^[ $]+")
