;;; emacsI.el --- Emacs Improved module              -*- lexical-binding: t; -*-

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

(defvar emacs-backup-directory (expand-file-name ".backups" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" misc-path))

;;================================================================================
;;                               Turn off backups                                
;;================================================================================
(use-package files :straight nil :ensure nil
  :config
  (setq make-backup-files nil))

(provide 'modules/emacsI)
;;; emacsI.el ends here
