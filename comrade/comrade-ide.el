(comrade-with-feature-package! :flycheck
			     flycheck
			     :hook
			     (prog-mode . flycheck-mode))

(comrade-with-feature-package! :dap
			     dap-mode
			     :hook
			     ((go-mode python-mode php-mode) . dap-mode))

(comrade-with-feature-package! :magit
			     magit
			     :commands (magit-status)
			     :init
			     (bindkey global-map 'magit-status :holy "C-x g" :evil (:normal "SPC g s")))

(comrade-with-feature-package! :magit
			     diff-hl
			     :config
			     (global-diff-hl-mode))


(comrade-with-feature-package! :evil
			     evil-magit
			     :init
			     (add-hook 'magit-mode-hook (lambda () (require 'evil-magit))))


(comrade-with-feature-package! :lsp
			     lsp-mode
			     :defer t)


(comrade-with-feature-package! :lsp
			     lsp-ui
			     :defer t)


(comrade-with-feature-package! :company
			     company-lsp :defer t)

(comrade-with-feature-package! :company
			     company
			     :config
			     (global-company-mode t)
			     (setq company-tooltip-limit 30)
			     (setq company-idle-delay .1)
			     (setq company-echo-delay 0)
			     (setq company-dabbrev-downcase nil)
			     (add-to-list 'company-backends 'company-dabbrev)
			     (add-to-list 'company-backends 'company-dabbrev-code))

(provide 'comrade-ide)
;;; comrade-ide.el ends here
