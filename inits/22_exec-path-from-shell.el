(when (memq system-type '(gnu/linux darwin))
  (exec-path-from-shell-initialize)
  )
