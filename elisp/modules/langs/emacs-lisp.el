;;; emacs-lisp.el --- Emacs lisp module for amirreza-emacs     -*- lexical-binding: t; -*-

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

;-----------------------------------Emacs Lisp-----------------------------------
(defun --amirreza-emacs/modules/langs/emacs-lisp-dashes (count)
  "Create dashes with given COUNT."
  (let ((dashes ""))
  (dotimes (iterator count dashes)
    (setq dashes (concat dashes "-")))))

(defun amirreza-emacs/modules/emacs-lisp-insert-comment-line (text)
  "Insert a comment line with given TEXT."
  (interactive "sComment: ")
  (let* ((len (length text))
	(len-dashes (- 80 len))
	(dashes (--amirreza-emacs/modules/langs/emacs-lisp-dashes (/ len-dashes 2))))
    (insert (format "\n;%s%s%s" dashes text dashes))))

(use-package elisp-mode
  :ensure nil
  :straight nil
  :bind
  (:map emacs-lisp-mode-map
	("C-c C-c C-d" . 'amirreza-emacs/modules/emacs-lisp-insert-comment-line)))


(provide 'emacs-lisp)
;;; emacs-lisp.el ends here
