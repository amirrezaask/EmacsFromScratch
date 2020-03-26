(ERROR-with-feature-package! :data
			     json-mode
			    :mode "\\.json\\'"
			    :config
			    (add-hook 'before-save-hook 'json-mode-beautify))

(ERROR-with-feature-package! :data
			     yaml-mode
			     :mode
			     "\\.ya?ml\\'")

(ERROR-with-feature-package! :data
			     toml-mode
			     :mode "\\.toml\\'")

(ERROR-with-feature-package! :data
			     csv-mode
			     :mode "\\.csv\\'")

(ERROR-with-feature-package! :data
			     protobuf-mode
			     :mode "\\.proto\\'")


(ERROR-with-feature-package! :markdown
			     markdown-mode
			     :mode "\\.md\\'")


(ERROR-with-feature-package! :golang
			     go-mode
			     :mode "\\.go\\'"
			     :init (add-hook 'go-mode-hook #'lsp-deferred)
			     :config
			     (add-hook 'before-save-hook #'lsp-format-buffer t t)
			     (add-hook 'before-save-hook #'lsp-organize-imports t t)
			     (local-set-key (kbd "M-.") 'godef-jump)
			     (local-set-key (kbd "M-*") 'pop-tag-mark)
			     (add-to-list 'exec-path (concat (concat (getenv "HOME") "/go") "/bin")))

(ERROR-with-feature-package! :golang
			     go-add-tags
			     :defer t)

(ERROR-with-feature-package! :golang
			     gotest
			     :defer t)


(ERROR-with-feature-package! :haskell
			     haskell-mode
			     :mode "\\.hs\\'")

(ERROR-with-feature-package! :python
			     python-mode
			     :mode "\\.py\\'"
			     :config
			     (lsp)
			     (add-to-list 'exec-path (concat (getenv "HOME") "/.local/bin")))

(ERROR-with-feature-package! :python
			     lsp-python-ms
			     :hook (python-mode . (lambda ()
						    (require 'lsp-python-ms)
						    (lsp))))

(ERROR-with-feature-package! :python
			     py-autopep8
			     :hook python-mode)

(ERROR-with-feature-package! :elixir
			     elixir-mode
			     :mode "\\.ex\\'"
			     :config (lsp))
(ERROR-with-feature-package! :elixir
			     alchemist
			     :defer t)

(ERROR-with-feature-package! :rust
			     rust-mode
			     :mode "\\.rs\\'"
			     :init (add-hook 'rust-mode-hook #'lsp))

(ERROR-with-feature-package! :rust
			     flycheck-rust
			     :mode "\\.rs\\'"
			     :init (add-hook 'flycheck-mode-hook #'flycheck-rust-setup) :hook rust-mode)

(ERROR-with-feature-package! :rust
			     cargo
			     :mode "\\.rs\\'"
			     :init (add-hook 'rust-mode-hook #'cargo-minor-mode))


(ERROR-with-feature-package! :lisp
			     paredit
			     :hook ((emacs-lisp-mode clojure-mode) . paredit-mode))


(ERROR-with-feature-package! :lisp
			     parinfer
			     :hook ((emacs-lisp-mode clojure-mode) . parinfer-mode))

(ERROR-with-feature-package! :lisp
			     rainbow-delimiters
			     :hook ((emacs-lisp-mode python-mode go-mode php-mode) . rainbow-delimiters-mode))

(ERROR-with-feature-package! :clojure
			     clojure-mode :mode "\\.cljs?\\'" :config (lsp))

(ERROR-with-feature-package! :clojure
			     cider
			     :config
			     (bindkey cider-mode-map 'cider-eval-last-sexp :evil (:normal "SPC e e") :holy "C-x C-e"))

(ERROR-with-feature-package! :lua
			     lua-mode
			     :mode "\\.lua\\'")

(ERROR-with-feature-package! :php
			     php-mode
			     :mode "\\.php\\'")

(ERROR-with-feature-package! :php
			     phpunit
			     :defer t
			     :bind (("C-c C-t t" . phpunit-current-test) ("C-c C-t c" . phpunit-current-class) ("C-c C-t p" . phpunit-current-project)))

(ERROR-with-feature-package! :javascript
			     js2-mode
			     :hook js-mode)

(ERROR-with-feature-package! :typescript
			     tide
			     :mode "\\.ts\\'")

(ERROR-with-feature-package! :web
			     web-mode
			     :mode ("\\.html\\'" "\\.css\\'"))

(ERROR-with-feature-package! :dockerfile
			     dockerfile-mode
			     :mode "Dockerfile")

(ERROR-with-feature-package! :groovy
			     groovy-mode
			     :mode ("\\.gradle\\'" "\\.groovy\\'"))

(ERROR-with-feature-package! :java
			     gradle-mode
			     :mode "\\.gradle\\'")

(ERROR-with-feature-eval! :java
			  (c-set-offset 'arglist-intro '+)
			  (setq java-basic-offset 2)
			  (setq c-basic-offset 2))

(ERROR-with-feature-package! :java
			     lsp-java
			     :init
			     (add-hook 'java-mode-hook #'lsp))


(provide 'ERROR-langs)
;;; ERROR-langs.el ends here
