(if-feature-use-package! :flycheck
			 flycheck
			 :hook
			 (prog-mode . flycheck-mode))

(if-feature-use-package! :dap
			 dap-mode
			 :hook
			 ((go-mode python-mode php-mode) . dap-mode))

(if-feature-use-package! :magit
			 magit
			 :commands (magit-status)
			 :init
			 (bindkey global-map 'magit-status :holy "C-x g" :evil (:normal "SPC g s")))

(if-feature-use-package! :magit
			 diff-hl
			 :config
			 (global-diff-hl-mode))


(if-feature-use-package! :evil
			 evil-magit
			 :init
			 (add-hook 'magit-mode-hook (lambda () (require 'evil-magit))))

(if-feature-use-package! :lsp
			 lsp-mode
			 :defer t
			 :init (add-hook 'prog-mode-hook #'lsp)
			 :config
			 (bindkey lsp-mode-map 'treemacs :holy "C-x t" :evil (:normal "SPC l t")))

(if-feature-use-package! :lsp
			 lsp-treemacs
			 :commands lsp-treemacs-errors-list)

(if-feature-use-package! :snippets
			 yasnippet
			 :init
			 (add-hook 'prog-mode-hook (lambda ()
						     (yas-reload-all)
						     (yas-minor-mode)
						     )))
(if-feature-use-package! :snippets
			 yasnippet-snippets)

(if-feature-use-package! :lsp
			 lsp-ui
			 :commands lsp-ui-mode)

(if-feature-use-package! :lsp
			 company-lsp
			 :commands (company-lsp))

(if-feature-use-package! :company
			 company
			 :config
			 (global-company-mode t)
			 (setq company-tooltip-limit 30)
			 (setq company-idle-delay .1)
			 (setq company-echo-delay 0)
			 (setq company-dabbrev-downcase nil)
			 (add-to-list 'company-backends 'company-dabbrev)
			 (add-to-list 'company-backends 'company-dabbrev-code))

(provide 'init-ide)
;;; init-ide.el ends here
