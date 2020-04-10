;;; php.el --- Php                                   -*- lexical-binding: t; -*-

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

(use-package php-mode
	     :mode "\\.php\\'")

(use-package phpunit
	     :bind
	     (("C-c C-t t" . phpunit-current-test)
	      ("C-c C-t c" . phpunit-current-class)
	      ("C-c C-t p" . phpunit-current-project)))


(provide 'modules/langs/php)
;;; php.el ends here
