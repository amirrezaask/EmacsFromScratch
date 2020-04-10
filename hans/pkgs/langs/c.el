;;; c.el --- C programming language                  -*- lexical-binding: t; -*-

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

(define-auto-insert
  '("\\.\\(CC?\\|cc\\|cxx\\|cpp\\|c++\\)\\'" . "C skeleton")
  '("Short description: "
    "/*" \n
    (file-name-nondirectory (buffer-file-name))
    " -- " str \n
    " */" > \n \n
    "#include <iostream>" \n \n
    "using namespace std;" \n \n
    "main()" \n
    "{" \n
    > _ \n
    "}" > \n))

(use-package cquery :defer t)   

(provide 'hans-langs-c)
;;; c.el ends here
