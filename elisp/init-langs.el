(init-with-feature-package! :data
			     json-mode
			    :mode "\\.json\\'"
			    :config
			    (add-hook 'before-save-hook 'json-mode-beautify))

(init-with-feature-package! :data
			     yaml-mode
			     :mode
			     "\\.ya?ml\\'")

(init-with-feature-package! :data
			     toml-mode
			     :mode "\\.toml\\'")

(init-with-feature-package! :data
			     csv-mode
			     :mode "\\.csv\\'")

(init-with-feature-package! :data
			     protobuf-mode
			     :mode "\\.proto\\'")


(init-with-feature-package! :markdown
			     markdown-mode
			     :mode "\\.md\\'")


(init-with-feature-package! :golang
			     go-mode
			     :mode "\\.go\\'"
			     :init (add-hook 'go-mode-hook 'eglot-ensure)
			     :config
			     (add-hook 'before-save-hook #'lsp-format-buffer t t)
			     (add-hook 'before-save-hook #'lsp-organize-imports t t)
			     (local-set-key (kbd "M-.") 'godef-jump)
			     (local-set-key (kbd "M-*") 'pop-tag-mark)
			     (add-to-list 'exec-path (concat (concat (getenv "HOME") "/go") "/bin")))

(init-with-feature-package! :golang
			     go-add-tags
			     :defer t)

(init-with-feature-package! :golang
			     gotest
			     :defer t)


(init-with-feature-package! :haskell
			     haskell-mode
			     :mode "\\.hs\\'")

(init-with-feature-package! :python
			     python-mode
			     :mode "\\.py\\'"
			     :init (add-hook 'python-mode-hook 'eglot-ensure)
			     :config
			     (add-to-list 'exec-path (concat (getenv "HOME") "/.local/bin")))

(init-with-feature-package! :python
			     lsp-python-ms
			     :hook (python-mode . (lambda ()
						    (require 'lsp-python-ms)
						    (eglot))))

(init-with-feature-package! :python
			     py-autopep8
			     :hook python-mode)

(init-with-feature-package! :elixir
			     elixir-mode
			     :mode "\\.ex\\'"
			     :config (eglot))
(init-with-feature-package! :elixir
			     alchemist
			     :defer t)

(init-with-feature-package! :rust
			     rust-mode
			     :mode "\\.rs\\'"
			     :init (add-hook 'rust-mode-hook 'eglot-ensure))

(init-with-feature-package! :rust
			     flycheck-rust
			     :mode "\\.rs\\'"
			     :init (add-hook 'flycheck-mode-hook #'flycheck-rust-setup) :hook rust-mode)

(init-with-feature-package! :rust
			     cargo
			     :mode "\\.rs\\'"
			     :init (add-hook 'rust-mode-hook #'cargo-minor-mode))


(init-with-feature-package! :lisp
			     paredit
			     :hook ((emacs-lisp-mode clojure-mode) . paredit-mode))


(init-with-feature-package! :lisp
			     parinfer
			     :hook ((emacs-lisp-mode clojure-mode) . parinfer-mode))

(init-with-feature-package! :lisp
			     rainbow-delimiters
			     :hook ((emacs-lisp-mode python-mode go-mode php-mode) . rainbow-delimiters-mode))

(init-with-feature-package! :clojure
			    clojure-mode
			    :mode "\\.cljs?\\'"
			    :init (add-hook 'clojure-mode-hook 'eglot-ensure)
			    )

(init-with-feature-package! :clojure
			    cider
			    :mode "\\.cljs?\\'"
			    :config
			    (bindkey cider-mode-map 'cider-eval-last-sexp :evil (:normal "SPC e e") :holy "C-x C-e"))

(init-with-feature-package! :lua
			     lua-mode
			     :mode "\\.lua\\'")

(init-with-feature-package! :php
			     php-mode
			     :mode "\\.php\\'"
			     :init (add-hook 'php-mode-hook 'eglot-ensure)
			     )

(init-with-feature-package! :php
			     phpunit
			     :defer t
			     :bind (("C-c C-t t" . phpunit-current-test) ("C-c C-t c" . phpunit-current-class) ("C-c C-t p" . phpunit-current-project)))

(init-with-feature-package! :javascript
			     js2-mode
			     :hook js-mode)

(init-with-feature-package! :typescript
			     tide
			     :mode "\\.ts\\'")

(init-with-feature-package! :web
			     web-mode
			     :mode ("\\.html\\'" "\\.css\\'"))

(init-with-feature-package! :dockerfile
			     dockerfile-mode
			     :mode "Dockerfile")

(init-with-feature-package! :groovy
			     groovy-mode
			     :mode ("\\.gradle\\'" "\\.groovy\\'"))

(init-with-feature-package! :java
			     gradle-mode
			     :mode "\\.gradle\\'")

(init-with-feature-eval! :java
			  (c-set-offset 'arglist-intro '+)
			  (setq java-basic-offset 2)
			  (setq c-basic-offset 2))

(init-with-feature-package! :java
			     lsp-java
			     :init
			     (add-hook 'java-mode-hook #'eglot-ensure))


(provide 'init-langs)
;;; init-langs.el ends here
