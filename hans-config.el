;;; hans-config.el --- Hans user configuration template  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  amirrezaask

;; Author: amirrezaask <raskarpour@gmail.com>
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
(local-use-package modules/ui)
(local-use-package modules/completion)
(local-use-package modules/editor)
(local-use-package modules/search)
(local-use-package modules/dev)
(local-use-package modules/devops)
(local-use-package modules/langs
		   :config
		   (with asm)
		   (with c)
		   (with clojure)
		   (with common-lisp)
		   (with csharp)
		   (with data)
		   (with elixir)
		   (with emacs-lisp)
		   (with fsharp)
		   (with go)
		   (with haskell)
		   (with java)
		   (with javascript)
		   (with kotlin)
		   (with lua)
		   (with orgmode)
		   (with php)
		   (with python)
		   (with racket)
		   (with rust)
		   (with sh)
		   (with typescript)
		   (with web))

(local-use-package modules/gnus)
(local-use-package modules/emacsI)
(local-use-package modules/window-manager)

(provide 'hans-config)
;;; hans-config.el ends here
      
