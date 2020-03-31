(if-feature-use-package! :c/c++
			 cmake-mode
			 :straight (:type git :host github :repo "emacsmirror/cmake-mode"))

(if-feature-use-package! :c/c++
			 cquery
			 :defer t)

(if-feature-use-package! :assembly
			 mips-mode
			 :defer t)

(if-feature-use-package! :fsharp
			 fsharp-mode
			 :mode "\\.fs\\'")

(if-feature-use-package! :csharp
			 csharp-mode
			 :mode "\\.cs\\'")

(if-feature-use-package! :assembly
			 nasm-mode
			 :defer t)

(if-feature-use-package! :assembly
			 haxor-mode
			 :mode "\\.hax\\'")

(if-feature-use-package! :data
			 json-mode
			 :mode "\\.json\\'"
			 :config
			 (add-hook 'before-save-hook 'json-mode-beautify))

(if-feature-use-package! :data
			 yaml-mode
			 :mode
			 "\\.ya?ml\\'")

(if-feature-use-package! :data
			 toml-mode
			 :mode "\\.toml\\'")

(if-feature-use-package! :data
			 csv-mode
			 :mode "\\.csv\\'")

(if-feature-use-package! :data
			 protobuf-mode
			 :mode "\\.proto\\'")


(if-feature-use-package! :markdown
			 markdown-mode
			 :mode "\\.md\\'")


(if-feature-use-package! :golang
			 go-mode
			 :mode "\\.go\\'"
			 :init
			 (add-hook 'go-mode-hook (lambda () (add-to-list 'exec-path (concat (getenv "HOME") "/go/bin"))))
			 :config
			 (add-hook 'before-save-hook #'lsp-format-buffer t t)
			 (add-hook 'before-save-hook #'lsp-organize-imports t t)
			 (local-set-key (kbd "M-.") 'godef-jump)
			 (local-set-key (kbd "M-*") 'pop-tag-mark))

(if-feature-use-package! :golang
			 go-add-tags
			 :defer t)

(if-feature-use-package! :golang
			 gotest
			 :defer t)


(if-feature-use-package! :haskell
			 haskell-mode
			 :mode "\\.hs\\'")

(if-feature-use-package! :haskell
			 lsp-haskell
			 :hook haskell-mode)

(if-feature-use-package! :scala
			 scala-mode
			 :mode "\\.scala\\'")

(if-feature-use-package! :scala
			 sbt-mode
			 :hook scala-mode)

(if-feature-use-package! :python
			 python-mode
			 :mode "\\.py\\'")


(if-feature-use-package! :python
			 lsp-python-ms
			 :hook (python-mode))


(if-feature-use-package! :python
			 py-autopep8
			 :hook python-mode)

(if-feature-use-package! :elixir
			 elixir-mode
			 :mode "\\.ex\\'")

(if-feature-use-package! :elixir
			 alchemist
			 :defer t)

(if-feature-use-package! :rust
			 rust-mode
			 :mode "\\.rs\\'")

(if-feature-use-package! :rust
			 flycheck-rust
			 :mode "\\.rs\\'"
			 :init (add-hook 'flycheck-mode-hook #'flycheck-rust-setup) :hook rust-mode)

(if-feature-use-package! :rust
			 cargo
			 :mode "\\.rs\\'"
			 :init (add-hook 'rust-mode-hook #'cargo-minor-mode))


(if-feature-use-package! :lisp
			 papredit
			 :hook ((emacs-lisp-mode clojure-mode) . paredit-mode))


(if-feature-use-package! :lisp
			 parinfer
			 :hook ((emacs-lisp-mode clojure-mode) . parinfer-mode))

(if-feature-use-package! :lisp
			 rainbow-delimiters
			 :hook ((emacs-lisp-mode python-mode go-mode php-mode) . rainbow-delimiters-mode))

(if-feature-use-package! :clojure
			 clojure-mode
			 :mode "\\.cljs?\\'"
			 )

(if-feature-use-package! :clojure
			 cider
			 :mode "\\.cljs?\\'"
			 :config
			 (bindkey cider-mode-map 'cider-eval-last-sexp :evil (:normal "SPC e e") :holy "C-x C-e"))

(if-feature-use-package! :lua
			 lua-mode
			 :mode "\\.lua\\'")

(if-feature-use-package! :php
			 php-mode
			 :mode "\\.php\\'"
			 :init (add-hook 'php-mode-hook 'eglot-ensure)
			 )

(if-feature-use-package! :php
			 phpunit
			 :defer t
			 :bind
			 (("C-c C-t t" . phpunit-current-test)
			  ("C-c C-t c" . phpunit-current-class)
			  ("C-c C-t p" . phpunit-current-project)))

(if-feature-use-package! :javascript
			 js2-mode
			 :hook js-mode)

(if-feature-use-package! :typescript
			 tide
			 :mode "\\.ts\\'")

(if-feature-use-package! :web
			 web-mode
			 :mode ("\\.html\\'" "\\.css\\'"))

(if-feature-use-package! :dockerfile
			 dockerfile-mode
			 :mode "Dockerfile")

(if-feature-use-package! :groovy
			 groovy-mode
			 :mode ("\\.gradle\\'" "\\.groovy\\'"))

(if-feature-use-package! :java
			 gradle-mode
			 :mode "\\.gradle\\'")

(if-feature-eval! :java
		  (c-set-offset 'arglist-intro '+)
		  (setq java-basic-offset 2)
		  (setq c-basic-offset 2))

(if-feature-use-package! :java
			 lsp-java
			 :hook (java-mode))

(if-feature-use-package! :racket
			 racket-mode
			 :mode "\\.rkt\\'")
(provide 'init-langs)
;;; init-langs.el ends here
