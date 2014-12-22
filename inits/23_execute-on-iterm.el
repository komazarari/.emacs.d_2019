;;; iterm
(when (eq system-type 'darwin)
  (defun execute-on-iterm (command)
    (interactive "MCommand: ")
    (do-applescript
     (format "tell application \"iTerm\"
activate
tell current session of current terminal
write text \"%s\"
end tell
end tell"
             command))))
