(comrade-with-feature-package! :data
			     json-mode
			    :mode "\\.json\\'"
			    :config
			    (add-hook 'before-save-hook 'json-mode-beautify))

(comrade-with-feature-package! :data
			     yaml-mode
			     :mode
			     "\\.ya?ml\\'")

(comrade-with-feature-package! :data
			     toml-mode
			     :mode "\\.toml\\'")

(comrade-with-feature-package! :data
			     csv-mode
			     :mode "\\.csv\\'")

(comrade-with-feature-package! :data
			     protobuf-mode
			     :mode "\\.proto\\'")


(comrade-with-feature-package! :markdown
			     markdown-mode
			     :mode "\\.md\\'")


(comrade-with-feature-package! :golang
			     go-mode
			     :mode "\\.go\\'"
			     :init (add-hook 'go-mode-hook #'lsp-deferred)
			     :config
			     (add-hook 'before-save-hook #'lsp-format-buffer t t)
			     (add-hook 'before-save-hook #'lsp-organize-imports t t)
			     (local-set-key (kbd "M-.") 'godef-jump)
			     (local-set-key (kbd "M-*") 'pop-tag-mark)
			     (add-to-list 'exec-path (concat (concat (getenv "HOME") "/go") "/bin")))

(comrade-with-feature-package! :golang
			     go-add-tags
			     :defer t)

(comrade-with-feature-package! :golang
			     gotest
			     :defer t)


(comrade-with-feature-package! :haskell
			     haskell-mode
			     :mode "\\.hs\\'")

(comrade-with-feature-package! :python
			     python-mode
			     :mode "\\.py\\'"
			     :config
			     (lsp)
			     (add-to-list 'exec-path (concat (getenv "HOME") "/.local/bin")))

(comrade-with-feature-package! :python
			     lsp-python-ms
			     :hook (python-mode . (lambda ()
						    (require 'lsp-python-ms)
						    (lsp))))

(comrade-with-feature-package! :python
			     py-autopep8
			     :hook python-mode)

(comrade-with-feature-package! :elixir
			     elixir-mode
			     :mode "\\.ex\\'"
			     :config (lsp))
(comrade-with-feature-package! :elixir
			     alchemist
			     :defer t)

(comrade-with-feature-package! :rust
			     rust-mode
			     :mode "\\.rs\\'"
			     :init (add-hook 'rust-mode-hook #'lsp))

(comrade-with-feature-package! :rust
			     flycheck-rust
			     :mode "\\.rs\\'"
			     :init (add-hook 'flycheck-mode-hook #'flycheck-rust-setup) :hook rust-mode)

(comrade-with-feature-package! :rust
			     cargo
			     :mode "\\.rs\\'"
			     :init (add-hook 'rust-mode-hook #'cargo-minor-mode))


(comrade-with-feature-package! :lisp
			     paredit
			     :hook ((emacs-lisp-mode clojure-mode) . paredit-mode))


(comrade-with-feature-package! :lisp
			     parinfer
			     :hook ((emacs-lisp-mode clojure-mode) . parinfer-mode))

(comrade-with-feature-package! :lisp
			     rainbow-delimiters
			     :hook ((emacs-lisp-mode python-mode go-mode php-mode) . rainbow-delimiters-mode))

(comrade-with-feature-package! :clojure
			     clojure-mode :mode "\\.cljs?\\'" :config (lsp))

(comrade-with-feature-package! :clojure
			     cider
			     :config
			     (bindkey cider-mode-map 'cider-eval-last-sexp :evil (:normal "SPC e e") :holy "C-x C-e"))

(comrade-with-feature-package! :lua
			     lua-mode
			     :mode "\\.lua\\'")

(comrade-with-feature-package! :php
			     php-mode
			     :mode "\\.php\\'")

(comrade-with-feature-package! :php
			     phpunit
			     :defer t
			     :bind (("C-c C-t t" . phpunit-current-test) ("C-c C-t c" . phpunit-current-class) ("C-c C-t p" . phpunit-current-project)))

(comrade-with-feature-package! :javascript
			     js2-mode
			     :hook js-mode)

(comrade-with-feature-package! :typescript
			     tide
			     :mode "\\.ts\\'")

(comrade-with-feature-package! :web
			     web-mode
			     :mode ("\\.html\\'" "\\.css\\'"))

(comrade-with-feature-package! :dockerfile
			     dockerfile-mode
			     :mode "Dockerfile")

(comrade-with-feature-package! :groovy
			     groovy-mode
			     :mode ("\\.gradle\\'" "\\.groovy\\'"))

(comrade-with-feature-package! :java
			     gradle-mode
			     :mode "\\.gradle\\'")

(comrade-with-feature-eval! :java
			  (c-set-offset 'arglist-intro '+)
			  (setq java-basic-offset 2)
			  (setq c-basic-offset 2))

(comrade-with-feature-package! :java
			     lsp-java
			     :init
			     (add-hook 'java-mode-hook #'lsp))


(provide 'comrade-langs)
;;; comrade-langs.el ends here
