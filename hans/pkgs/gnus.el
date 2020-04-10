;;; gnus.el --- Emacs gnus setup                     -*- lexical-binding: t; -*-

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

(use-package gnus
	     :straight nil
	     :ensure nil
	     :defer t
	     :commands (gnus)
	     :config
	     (setq user-mail-address "raskarpour@gmail.com"
		   user-full-name "amirrezaask")
	     
	     (setq gnus-select-method
		   '(nnimap "gmail"
			    (nnimap-address "imap.gmail.com")
			    (nnimap-server-port "imaps")
			    (nnimap-stream ssl)))
	     (setq smtpmail-smtp-server "smtp.gmail.com"
		   smtpmail-smtp-service 587
		   gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]"))


(provide 'hans-gnus)
;;; gnus.el ends here
