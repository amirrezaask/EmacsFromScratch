;;; assassin-langs.el --- assassin langs module      -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Amirreza Askarpour

;; Author: Amirreza Askarpour <amirrezaask@protonmail.com>
;; Keywords: 

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

(assassin-when json
	       (use-package json-mode  :mode "\\.json\\'"
			    :config
			    (add-hook 'before-save-hook 'json-mode-beautify)))

(assassin-when yaml
	       (use-package yaml-mode  :mode "\\.ya?ml\\'"))

(assassin-when markdown
	       (use-package markdown-mode  :mode "\\.md\\'"))


(assassin-when golang
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

(assassin-when haskell
	       (use-package haskell-mode :mode "\\.hs\\'"))


(assassin-when python
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

(assassin-when elixir
	       (use-package elixir-mode  :mode "\\.ex\\'" :config (lsp))
	       (use-package alchemist  :defer t))

(assassin-when rust
	       (use-package rust-mode  :mode "\\.rs\\'" :init (add-hook 'rust-mode-hook #'lsp))
	       (use-package flycheck-rust :mode "\\.rs\\'" :init (add-hook 'flycheck-mode-hook #'flycheck-rust-setup) :hook rust-mode)
	       (use-package cargo :mode "\\.rs\\'" :init (add-hook 'rust-mode-hook #'cargo-minor-mode)))


(assassin-when general-lisp
	       (use-package paredit :hook ((emacs-lisp-mode clojure-mode) . paredit-mode))
	       (use-package parinfer
			    :hook ((emacs-lisp-mode clojure-mode) . parinfer-mode))
	       (use-package rainbow-delimiters  :hook ((emacs-lisp-mode python-mode go-mode php-mode) . rainbow-delimiters-mode)))

(assassin-when clojure
	       (use-package clojure-mode :mode "\\.cljs?\\'" :config (lsp))
	       (use-package cider 
			    :init
			    (add-hook 'cider-mode-hook (lambda () (call-interactively 'cider-jack-in)))
			    :config
			    (bindkey cider-mode-map 'cider-eval-last-sexp :evil (:normal "SPC e e") :holy "C-x C-e")))
(assassin-when lua
	       (use-package lua-mode :mode "\\.lua\\'"))
(assassin-when php
	       (use-package php-mode  :defer :init (add-hook 'php-mode-hook #'lsp))
	       (use-package phpunit  :defer t
			    :bind (("C-c C-t t" . phpunit-current-test) ("C-c C-t c" . phpunit-current-class) ("C-c C-t p" . phpunit-current-project))))

(assassin-when javascript
	       (use-package js2-mode  :defer t :hook js-mode))

(assassin-when typescript
	       (use-package tide  :defer t :mode "\\.ts\\'"))

(assassin-when web
	       (use-package web-mode  :defer t :mode ("\\.html\\'" "\\.css\\'")))

	       
(provide 'assassin-langs)
;;; assassin-langs.el ends here
