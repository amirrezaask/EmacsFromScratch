(if-feature-use-package! :flycheck
			 flycheck
			 :hook
			 (prog-mode . flycheck-mode))

(if-feature-use-package! :debugger-adapter-protocol
			 dap-mode
			 :hook
			 prog-mode)

(if-feature-use-package! :git
			 magit
			 :commands (magit-status)
			 :init
			 (bindkey global-map 'magit-status :holy "C-x g" :evil (:normal "SPC g s")))

(if-feature-use-package! :git
			 diff-hl
			 :config
			 (global-diff-hl-mode))

(if-feature-use-package! :git
			 forge
			 :init
			 (add-hook 'magit-mode-hook (lambda () (require 'forge)))
			 )

(if-feature-use-package! :git
			 gitconfig-mode
			 :mode "/\\.gitconfig\\'")

(if-feature-use-package! :git
			 gitignore-mode
			 :mode "/\\.gitignore\\'")

(if-feature-use-package! :git
			 gitattributes-mode
			 :mode "/\\.gitattributes\\'")

(if-feature-use-package! :evil
			 evil-magit
			 :init
			 (add-hook 'magit-mode-hook (lambda () (require 'evil-magit))))

(if-feature-use-package! :language-server-protocol
			 lsp-mode
			 :defer t
			 :hook
			 ((go-mode python-mode php-mode clojure-mode elixir-mode haskell-mode csharp-mode fsharp-mode) . #'lsp)
			 :config
			 (bindkey lsp-mode-map 'treemacs :holy "C-x t" :evil (:normal "SPC l t")))

(if-feature-use-package! :language-server-protocol
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

(if-feature-use-package! :language-server-protocol
			 lsp-ui
			 :commands lsp-ui-mode)

(if-feature-use-package! :language-server-protocol
			 company-lsp
			 :commands (company-lsp)
			 )

(if-feature-use-package! :auto-completion
			 company
			 :config
			 (global-company-mode t)
			 (setq company-tooltip-limit 30)
			 (setq company-idle-delay .1)
			 (setq company-echo-delay 0)
			 (setq company-dabbrev-downcase nil)
			 (add-to-list 'company-backends '(company-capf company-dabbrev)))


(provide 'init-ide)
;;; init-ide.el ends here
