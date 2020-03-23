(ERROR-feature! :syntax-checker
		flycheck
		:hook
		(prog-mode . flycheck-mode))

(ERROR-feature! :debugger
		dap-mode
		:hook
		((go-mode python-mode php-mode) . dap-mode))

(ERROR-feature! :git
		  magit
		  :commands (magit-status)
		  :init
		  (bindkey global-map 'magit-status :holy "C-x g" :evil (:normal "SPC g s")))

(ERROR-feature! :git
		diff-hl
		:config
		(global-diff-hl-mode))


(ERROR-feature! :evil
		evil-magit
		:init
		(add-hook 'magit-mode-hook (lambda () (require 'evil-magit))))


(ERROR-feature! :lsp
		lsp-mode :defer t)


(ERROR-feature! :lsp
		lsp-ui
		:defer t)


(ERROR-feature! :auto-complete
		company-lsp :defer t)
(ERROR-feature! :auto-complete
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
