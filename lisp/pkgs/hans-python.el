;;; python.el --- Python support                     -*- lexical-binding: t; -*-

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
(defun hans-python-insert-docstring ()
  (interactive)
  (insert "'''\n'''")
  (backward-char 3))

(use-package python-mode
  :mode "\\.py\\'"
  :bind
  (:map python-mode-map
   ("C-c l p d" . hans-python-insert-docstring)))

(use-package pipenv
	     :defer t)

(use-package lsp-python-ms
	     :defer t)

(use-package py-autopep8
	     :hook python-mode)

(provide 'hans-python)
;;; python.el ends here
