;;; ide.el --- ide setup           -*- lexical-binding: t; -*-

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
(use-package flycheck :hook (prog-mode . flycheck-mode))

(use-package dap-mode :hook prog-mode)

(use-package magit
  :commands (magit-status)
  :bind
  (("C-x g" . 'magit-status)))
(use-package diff-hl :config (global-diff-hl-mode 1))
(use-package gitconfig-mode :mode "/\\.gitconfig\\'")

(use-package gitignore-mode
  :mode "/\\.gitignore\\'")

(use-package gitattributes-mode
  :mode "/\\.gitattributes\\'")

(use-package lsp-mode
  :hook
  ((go-mode python-mode php-mode clojure-mode elixir-mode haskell-mode csharp-mode fsharp-mode) . #'lsp))

(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list)

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package company-lsp
  :config
  (setq company-lsp-cache-candidates 'auto)
  :commands (company-lsp))

(use-package company
  :config
  (global-company-mode t)
  (setq company-tooltip-limit 30)
  (setq company-idle-delay .1)
  (setq company-echo-delay 0)
  (add-to-list 'company-backends '(company-capf company-dabbrev)))


(provide 'ide)
;;; ide.el ends here
