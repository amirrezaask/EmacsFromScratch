(init-with-feature-package! :flycheck
			     flycheck
			     :hook
			     (prog-mode . flycheck-mode))

(init-with-feature-package! :dap
			     dap-mode
			     :hook
			     ((go-mode python-mode php-mode) . dap-mode))

(init-with-feature-package! :magit
			     magit
			     :commands (magit-status)
			     :init
			     (bindkey global-map 'magit-status :holy "C-x g" :evil (:normal "SPC g s")))

(init-with-feature-package! :magit
			     diff-hl
			     :config
			     (global-diff-hl-mode))


(init-with-feature-package! :evil
			     evil-magit
			     :init
			     (add-hook 'magit-mode-hook (lambda () (require 'evil-magit))))

(init-with-feature-package! :lsp
			    lsp-mode
			    :hook ((go-mode clojure-mode python-mode java-mode elixir-mode) . #'lsp))

(init-with-feature-package! :lsp
			    lsp-ui
			    :commands lsp-ui-mode)

(init-with-feature-package! :lsp
			    company-lsp
			    :commands (company-lsp))

(init-with-feature-package! :company
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
