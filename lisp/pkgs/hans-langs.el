;;; langs.el --- language support                    -*- lexical-binding: t; -*-

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
(defvar hans/langs-root-path (expand-file-name "langs" hans/pkgs-path))
(defvar hans/enabled-langs '())

(add-to-list 'load-path hans/langs-root-path) 
(mapcar (lambda (lang)
	  (require (intern (format "hans-%s" (symbol-name lang))))
	  ) hans/enabled-langs)
(provide 'hans-langs)
;;; langs.el ends here
