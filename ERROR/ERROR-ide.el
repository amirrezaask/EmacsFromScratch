(ERROR-feature! :syntax-checker
	       (use-package flycheck :hook (prog-mode . flycheck-mode)))

(ERROR-feature! :debugger
	       (use-package dap-mode  :defer t :hook ((go-mode python-mode php-mode) . dap-mode)))

(ERROR-feature! :git
		  (use-package magit
		    :commands (magit-status)
		    :init
		    (bindkey global-map 'magit-status :holy "C-x g" :evil (:normal "SPC g s")))

		  (use-package diff-hl  :config (global-diff-hl-mode))

		  (ERROR-feature! :bugs
				    (use-package evil-magit :defer t :init (add-hook 'magit-mode-hook (lambda () (require 'evil-magit))))))


(ERROR-feature! :lsp
	       (use-package lsp-mode :defer t)
	       (use-package lsp-ui  :defer t))

(ERROR-feature! :auto-complete
	       (use-package company-lsp  :defer t)
	       (use-package company
			    :config
			    (global-company-mode t)
			    (setq company-tooltip-limit 30)
			    (setq company-idle-delay .1)
			    (setq company-echo-delay 0)
			    (setq company-dabbrev-downcase nil)
			    (add-to-list 'company-backends 'company-dabbrev)
			    (add-to-list 'company-backends 'company-dabbrev-code)))

(provide 'ERROR-ide)
;;; ERROR-ide.el ends here
