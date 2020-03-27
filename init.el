;; (setq debug-on-error t)
(add-to-list 'load-path (expand-file-name "comrade" user-emacs-directory))
(require 'comrade-bootstrap)
(message "startup took %s" (- (float-time) start-timestamp))
(provide 'init)
;;; init.el ends here
 
