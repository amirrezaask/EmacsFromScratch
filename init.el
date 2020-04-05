(setq debug-on-error t)
(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))
(require 'core)
(require-all (expand-file-name "elisp" user-emacs-directory))


(load-theme 'doom-one t)
(font! "Jetbrains Mono" 10)
(message "startup took %s" (- (float-time) start-timestamp))
(provide 'init)
;;; init.el ends here
 
