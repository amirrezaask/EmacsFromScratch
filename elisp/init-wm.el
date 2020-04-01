(if-feature-use-package! :x-window-manager
			 exwm
			 :config
			 (require 'exwm)
			 (require 'exwm-config)
			 (exwm-config-default)
			 (display-battery-mode 1))

(if-feature-eval! :x-window-manager
		  (defun exwm-current-workspace ()
		    (interactive)
		    (message "Current workspace is %s" exwm-workspace-current-index))
		  (bindkey global-map 'exwm-current-workspace :holy "C-c C-w n")
		  (bindkey global-map 'exwm-input-toggle-keyboard :holy "C-c C-w C-t c")
		  )
(provide 'init-wm)
