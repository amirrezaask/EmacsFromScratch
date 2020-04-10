;;; org.el --- Org mode support                      -*- lexical-binding: t; -*-

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


;------------------------------------Org mode------------------------------------
(with-eval-after-load 'org
  (setq org-support-shift-select t))

;----------------------------------Org bullets----------------------------------
(use-package org-bullets
       :hook ((org-mode) . 'org-bullets-mode))


(provide 'hans-orgmode)
;;; org.el ends here
