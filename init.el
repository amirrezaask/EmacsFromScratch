(setq debug-on-error t)
(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))
;; load core module
(require 'core)
(core/load-user-config)
(core/initialize)

(message "startup took %s" (- (float-time) start-timestamp))
(provide 'init)
;;; init.el ends here
 
