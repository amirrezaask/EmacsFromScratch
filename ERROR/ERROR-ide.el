(ERROR-with-feature-package! :syntax-checker
		flycheck
		:hook
		(prog-mode . flycheck-mode))

(ERROR-with-feature-package! :debugger
		dap-mode
		:hook
		((go-mode python-mode php-mode) . dap-mode))

(ERROR-with-feature-package! :git
		  magit
		  :commands (magit-status)
		  :init
		  (bindkey global-map 'magit-status :holy "C-x g" :evil (:normal "SPC g s")))

(ERROR-with-feature-package! :git
		diff-hl
		:config
		(global-diff-hl-mode))


(ERROR-with-feature-package! :evil
		evil-magit
		:init
		(add-hook 'magit-mode-hook (lambda () (require 'evil-magit))))


(ERROR-with-feature-package! :lsp
		lsp-mode :defer t)


(ERROR-with-feature-package! :lsp
		lsp-ui
		:defer t)


(ERROR-with-feature-package! :auto-complete
			     company-lsp :defer t)

(ERROR-with-feature-package! :auto-complete
		company
		:config
		(global-company-mode t)
		(setq company-tooltip-limit 30)
		(setq company-idle-delay .1)
		(setq company-echo-delay 0)
		(setq company-dabbrev-downcase nil)
		(add-to-list 'company-backends 'company-dabbrev)
		(add-to-list 'company-backends 'company-dabbrev-code))

(provide 'ERROR-ide)
;;; ERROR-ide.el ends here
