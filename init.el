(setq debug-on-error t)
(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

(require 'core)
(require 'ui)
(require 'editor)
(require 'ide)
(require 'langs)
(require 'devops)
;; (require 'window-manager)

(load-theme 'doom-one t)
(font! "Jetbrains Mono" 10)
(message "startup took %s" (- (float-time) start-timestamp))
(provide 'init)
;;; init.el ends here
 
