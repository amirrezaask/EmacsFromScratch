;;; langs.el --- language setup            -*- lexical-binding: t; -*-

;; Copyright (C) 2020  amirrezaask

;; Author: amirreza <amirrezaask@protonmail.com>


;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(core/if-feature-use-package! :c/c++
			 cmake-mode
			 :straight (:type git :host github :repo "emacsmirror/cmake-mode"))

(core/if-feature-use-package! :c/c++
			 cquery
			 :defer t)

(core/if-feature-use-package! :assembly
			 mips-mode
			 :defer t)

(core/if-feature-use-package! :fsharp
			 fsharp-mode
			 :mode "\\.fs\\'")

(core/if-feature-use-package! :csharp
			 csharp-mode
			 :mode "\\.cs\\'")

(core/if-feature-use-package! :assembly
			 nasm-mode
			 :defer t)

(core/if-feature-use-package! :assembly
			 haxor-mode
			 :mode "\\.hax\\'")

(core/if-feature-use-package! :data
			 json-mode
			 :mode "\\.json\\'"
			 :config
			 (add-hook 'before-save-hook 'json-mode-beautify))

(core/if-feature-use-package! :data
			 yaml-mode
			 :mode
			 "\\.ya?ml\\'")

(core/if-feature-use-package! :data
			 toml-mode
			 :mode "\\.toml\\'")

(core/if-feature-use-package! :data
			 csv-mode
			 :mode "\\.csv\\'")

(core/if-feature-use-package! :data
			 protobuf-mode
			 :mode "\\.proto\\'")


(core/if-feature-use-package! :markdown
			 markdown-mode
			 :mode "\\.md\\'")


(core/if-feature-use-package! :golang
			 go-mode
			 :mode "\\.go\\'"
			 :init
			 (add-hook 'go-mode-hook (lambda () (add-to-list 'exec-path (concat (getenv "HOME") "/go/bin"))))
			 :config
			 (add-hook 'before-save-hook 'gofmt-before-save)
			 (add-hook 'before-save-hook 'go-import-add)
			 (add-hook 'before-save-hook 'go-remove-unused-import)
			 (add-hook 'before-save-hook #'lsp-format-buffer t t)
			 (add-hook 'before-save-hook #'lsp-organize-imports t t)
			 (local-set-key (kbd "M-.") 'godef-jump)
			 (local-set-key (kbd "M-*") 'pop-tag-mark))

(core/if-feature-use-package! :golang
			 go-add-tags
			 :defer t)

(core/if-feature-use-package! :golang
			 gotest
			 :defer t)


(core/if-feature-use-package! :haskell
			 haskell-mode
			 :mode "\\.hs\\'")

(core/if-feature-use-package! :haskell
			 lsp-haskell
			 :hook haskell-mode)

(core/if-feature-use-package! :scala
			 scala-mode
			 :mode "\\.scala\\'")

(core/if-feature-use-package! :scala
			 sbt-mode
			 :hook scala-mode)

(core/if-feature-use-package! :python
			 python-mode
			 :mode "\\.py\\'")


(core/if-feature-use-package! :python
			 lsp-python-ms
			 :hook (python-mode))


(core/if-feature-use-package! :python
			 py-autopep8
			 :hook python-mode)

(core/if-feature-use-package! :python
			 jinja2-mode
			 :mode "\\.j2$")

(core/if-feature-use-package! :elixir
			 elixir-mode
			 :mode "\\.ex\\'")

(core/if-feature-use-package! :elixir
			 alchemist
			 :defer t)

(core/if-feature-use-package! :rust
			 rust-mode
			 :mode "\\.rs\\'")

(core/if-feature-use-package! :rust
			 flycheck-rust
			 :mode "\\.rs\\'"
			 :init (add-hook 'flycheck-mode-hook #'flycheck-rust-setup) :hook rust-mode)

(core/if-feature-use-package! :rust
			 cargo
			 :mode "\\.rs\\'"
			 :init (add-hook 'rust-mode-hook #'cargo-minor-mode))


(core/if-feature-use-package! :lisp
			 paredit
			 :hook ((emacs-lisp-mode clojure-mode) . paredit-mode))


(core/if-feature-use-package! :lisp
			 parinfer
			 :hook ((emacs-lisp-mode clojure-mode) . parinfer-mode))

(core/if-feature-use-package! :lisp
			 rainbow-delimiters
			 :hook ((emacs-lisp-mode python-mode go-mode php-mode) . rainbow-delimiters-mode))

(core/if-feature-use-package! :clojure
			 clojure-mode
			 :mode "\\.cljs?\\'"
			 )

(core/if-feature-use-package! :clojure
			 cider
			 :mode "\\.cljs?\\'"
			 :config
			 (core/bindkey cider-mode-map 'cider-eval-last-sexp :evil (:normal "SPC e e") :holy "C-x C-e"))

(core/if-feature-use-package! :lua
			 lua-mode
			 :mode "\\.lua\\'")

(core/if-feature-use-package! :php
			 php-mode
			 :mode "\\.php\\'"
			 :init (add-hook 'php-mode-hook 'eglot-ensure)
			 )

(core/if-feature-use-package! :php
			 phpunit
			 :defer t
			 :bind
			 (("C-c C-t t" . phpunit-current-test)
			  ("C-c C-t c" . phpunit-current-class)
			  ("C-c C-t p" . phpunit-current-project)))

(core/if-feature-use-package! :javascript
			 js2-mode
			 :hook js-mode)

(core/if-feature-use-package! :typescript
			 tide
			 :mode "\\.ts\\'")

(core/if-feature-use-package! :web
			 web-mode
			 :mode ("\\.html\\'" "\\.css\\'"))

(core/if-feature-use-package! :dockerfile
			 dockerfile-mode
			 :mode "Dockerfile")

(core/if-feature-use-package! :groovy
			 groovy-mode
			 :mode ("\\.gradle\\'" "\\.groovy\\'"))

(core/if-feature-use-package! :java
			 gradle-mode
			 :mode "\\.gradle\\'")

(core/if-feature-eval! :java
		  (c-set-offset 'arglist-intro '+)
		  (setq java-basic-offset 2)
		  (setq c-basic-offset 2))

(core/if-feature-use-package! :java
			 lsp-java
			 :hook (java-mode))

(core/if-feature-use-package! :racket
			 racket-mode
			 :mode "\\.rkt\\'")

(core/if-feature-use-package! :org ob-go
			 :defer t)

(core/if-feature-use-package! :org ob-rust
			 :defer t)



(provide 'langs)
;;; langs.el ends here
