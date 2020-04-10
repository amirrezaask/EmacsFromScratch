;;; go.el --- golang                                 -*- lexical-binding: t; -*-

;; Copyright (C) 2020  amirreza

;; Author: amirreza <amirreza@nobody.invalid>
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

(use-package go-mode
	     :mode "\\.go\\'"
	     :init
	     (add-hook 'go-mode-hook (lambda () (add-to-list 'exec-path (concat (getenv "HOME") "/go/bin"))))
	     :config
	     (add-hook 'before-save-hook 'gofmt-before-save)
	     (add-hook 'before-save-hook 'go-import-add)
	     (add-hook 'before-save-hook 'go-remove-unused-import)
	     (add-hook 'before-save-hook #'lsp-format-buffer t t)
	     (add-hook 'before-save-hook #'lsp-organize-imports t t))

(use-package go-add-tags :defer t)

(use-package gotest :defer t)


(provide 'modules/langs/go)
;;; go.el ends here
