(ERROR-feature! :json
	       (use-package json-mode  :mode "\\.json\\'"
			    :config
			    (add-hook 'before-save-hook 'json-mode-beautify)))

(ERROR-feature! :yaml
	       (use-package yaml-mode  :mode "\\.ya?ml\\'"))

(ERROR-feature! :markdown
	       (use-package markdown-mode  :mode "\\.md\\'"))


(ERROR-feature! :golang
	       (use-package go-mode
			    :mode "\\.go\\'"
			    
			    :config
			    (lsp)
			    (add-hook 'before-save-hook #'lsp-format-buffer t t)
			    (add-hook 'before-save-hook #'lsp-organize-imports t t)
			    (add-hook 'go-mode-hook 'go-eldoc-setup)
			    (local-set-key (kbd "M-.") 'godef-jump)
			    (local-set-key (kbd "M-*") 'pop-tag-mark)
			    (add-to-list 'exec-path (concat (concat (getenv "HOME") "/go") "/bin")))
	       
	       (use-package go-add-tags  :defer t :config (global-set-key "C-c C-s" 'go-add-tags))
	       (use-package gotest  :defer t :config (global-set-key (kbd "C-c C-t C-t") 'go-test-current-test) (global-set-key (kbd "C-c C-t C-f") 'go-test-current-file)))

(ERROR-feature! :haskell
	       (use-package haskell-mode :mode "\\.hs\\'"))


(ERROR-feature! :python
	       (use-package python-mode
			    :defer t
			    :mode "\\.py\\'"
			    :config
			    (add-to-list 'exec-path (concat (getenv "HOME") "/.local/bin"))
			    (lsp))

	       (use-package lsp-python-ms
			    
			    :hook (python-mode . (lambda ()
						   (require 'lsp-python-ms)
						   (lsp))))
	       (use-package py-autopep8  :defer t :hook python-mode))

(ERROR-feature! :elixir
	       (use-package elixir-mode  :mode "\\.ex\\'" :config (lsp))
	       (use-package alchemist  :defer t))

(ERROR-feature! :rust
	       (use-package rust-mode  :mode "\\.rs\\'" :init (add-hook 'rust-mode-hook #'lsp))
	       (use-package flycheck-rust :mode "\\.rs\\'" :init (add-hook 'flycheck-mode-hook #'flycheck-rust-setup) :hook rust-mode)
	       (use-package cargo :mode "\\.rs\\'" :init (add-hook 'rust-mode-hook #'cargo-minor-mode)))


(ERROR-feature! :general-lisp
	       (use-package paredit :hook ((emacs-lisp-mode clojure-mode) . paredit-mode))
	       (use-package parinfer
			    :hook ((emacs-lisp-mode clojure-mode) . parinfer-mode))
	       (use-package rainbow-delimiters  :hook ((emacs-lisp-mode python-mode go-mode php-mode) . rainbow-delimiters-mode)))

(ERROR-feature! :clojure
	       (use-package clojure-mode :mode "\\.cljs?\\'" :config (lsp))
	       (use-package cider 
			    :init
			    (add-hook 'cider-mode-hook (lambda () (call-interactively 'cider-jack-in)))
			    :config
			    (bindkey cider-mode-map 'cider-eval-last-sexp :evil (:normal "SPC e e") :holy "C-x C-e")))

(ERROR-feature! :lua
	       (use-package lua-mode :mode "\\.lua\\'"))

(ERROR-feature! :php
	       (use-package php-mode  :defer :init (add-hook 'php-mode-hook #'lsp))
	       (use-package phpunit  :defer t
			    :bind (("C-c C-t t" . phpunit-current-test) ("C-c C-t c" . phpunit-current-class) ("C-c C-t p" . phpunit-current-project))))

(ERROR-feature! :javascript
	       (use-package js2-mode  :defer t :hook js-mode))

(ERROR-feature! :typescript
	       (use-package tide  :defer t :mode "\\.ts\\'"))

(ERROR-feature! :web
	       (use-package web-mode  :defer t :mode ("\\.html\\'" "\\.css\\'")))
(ERROR-feature! :dockerfile
		  (use-package dockerfile-mode :defer t :mode "Dockerfile"))
(provide 'ERROR-langs)
;;; ERROR-langs.el ends here
