;; (setq debug-on-error t)
(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))
(require 'init-bootstrap)
(message "startup took %s" (- (float-time) start-timestamp))
(provide 'init)
;;; init.el ends here
 
