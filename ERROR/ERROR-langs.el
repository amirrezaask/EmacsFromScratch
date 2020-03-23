(ERROR-feature! :json
	        json-mode
		:mode "\\.json\\'"
		:config
		(add-hook 'before-save-hook 'json-mode-beautify))

(ERROR-feature! :yaml
	        yaml-mode
		:mode
		"\\.ya?ml\\'")

(ERROR-feature! :markdown
	        markdown-mode
		:mode "\\.md\\'")


(ERROR-feature! :golang
	       go-mode
	       :mode "\\.go\\'"
	       :config
	       (lsp)
	       (add-hook 'before-save-hook #'lsp-format-buffer t t)
	       (add-hook 'before-save-hook #'lsp-organize-imports t t)
	       (add-hook 'go-mode-hook 'go-eldoc-setup)
	       (local-set-key (kbd "M-.") 'godef-jump)
	       (local-set-key (kbd "M-*") 'pop-tag-mark)
	       (add-to-list 'exec-path (concat (concat (getenv "HOME") "/go") "/bin")))

(ERROR-feature! :golang
		go-add-tags
		:defer t)

(ERROR-feature! :golang
		gotest
		:defer t)


(ERROR-feature! :haskell
	        haskell-mode
		:mode "\\.hs\\'")

(ERROR-feature! :python
	        python-mode
		:mode "\\.py\\'"
		:config
		(add-to-list 'exec-path (concat (getenv "HOME") "/.local/bin"))
		(lsp))

(ERROR-feature! :python
	        lsp-python-ms
		:hook (python-mode . (lambda ()
				       (require 'lsp-python-ms)
				       (lsp))))

(ERROR-feature! :python
		py-autopep8
		:hook python-mode)

(ERROR-feature! :elixir
		elixir-mode
		:mode "\\.ex\\'" :config (lsp))

(ERROR-feature! :elixir
		alchemist
		:defer t)

(ERROR-feature! :rust
		rust-mode
		:mode "\\.rs\\'"
		:init (add-hook 'rust-mode-hook #'lsp))

(ERROR-feature! :rust
	        flycheck-rust
		:mode "\\.rs\\'"
		:init (add-hook 'flycheck-mode-hook #'flycheck-rust-setup) :hook rust-mode)

(ERROR-feature! :rust
		cargo
		:mode "\\.rs\\'"
		:init (add-hook 'rust-mode-hook #'cargo-minor-mode))


(ERROR-feature! :lisp
		paredit
		:hook ((emacs-lisp-mode clojure-mode) . paredit-mode))


(ERROR-feature! :lisp
		parinfer
		:hook ((emacs-lisp-mode clojure-mode) . parinfer-mode))

(ERROR-feature! :lisp
		rainbow-delimiters
		:hook ((emacs-lisp-mode python-mode go-mode php-mode) . rainbow-delimiters-mode))

(ERROR-feature! :clojure
		clojure-mode :mode "\\.cljs?\\'" :config (lsp))

(ERROR-feature! :clojure
		cider
		:config
		(bindkey cider-mode-map 'cider-eval-last-sexp :evil (:normal "SPC e e") :holy "C-x C-e"))

(ERROR-feature! :lua
		lua-mode
		:mode "\\.lua\\'")

(ERROR-feature! :php
		php-mode
		:mode "\\.php\\'"
		:init (add-hook 'php-mode-hook #'lsp))
(ERROR-feature! :php
		phpunit
		:defer t
		:bind (("C-c C-t t" . phpunit-current-test) ("C-c C-t c" . phpunit-current-class) ("C-c C-t p" . phpunit-current-project)))

(ERROR-feature! :javascript
		js2-mode
		:hook js-mode)

(ERROR-feature! :typescript
	        tide
		:mode "\\.ts\\'")

(ERROR-feature! :web
		web-mode
		:mode ("\\.html\\'" "\\.css\\'"))

(ERROR-feature! :dockerfile
		dockerfile-mode
		:mode "Dockerfile")

(provide 'ERROR-langs)
;;; ERROR-langs.el ends here
