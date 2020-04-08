;;; projects.el --- projects module                  -*- lexical-binding: t; -*-

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
;; -------------------------------- projectile -------------------------------------------------------
(use-package projectile
	     :bind
	     (("C-x p" . 'projectile-command-map)
	      ("C-c p" . 'projectile-add-known-project))
	     :custom
	     (projectile-completion-system 'ivy)
	     :config
	     (projectile-mode 1)
	     (add-to-list 'projectile-globally-ignored-directories "node_modules"))
;; ------------------------------- projectile integration for counsel --------------------------------
(use-package counsel-projectile
	     :bind (("<f2>" . counsel-projectile-rg)))



(provide 'projects)
;;; projects.el ends here
