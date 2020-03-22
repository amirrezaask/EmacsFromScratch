;; (setq debug-on-error t)
(add-to-list 'load-path (expand-file-name "ERROR" user-emacs-directory))
(require 'ERROR-bootstrap)
(message "startup took %s" (- (float-time) start-timestamp))
(provide 'init)
;;; init.el ends here
 
