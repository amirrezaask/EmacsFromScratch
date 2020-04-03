;;; init-ide.el --- ide setup           -*- lexical-binding: t; -*-

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
			 :config
			 (setq company-lsp-cache-candidates 'auto)
			 :commands (company-lsp)
			 )

(if-feature-use-package! :auto-completion
			 company
			 :config
			 (global-company-mode t)
			 (setq company-tooltip-limit 30)
			 (setq company-idle-delay .1)
			 (setq company-echo-delay 0)
			 (add-to-list 'company-backends '(company-capf company-dabbrev)))


(provide 'init-ide)
;;; init-ide.el ends here
