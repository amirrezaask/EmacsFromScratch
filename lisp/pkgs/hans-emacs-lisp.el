;;; emacs-lisp.el --- Emacs lisp module for hans     -*- lexical-binding: t; -*-

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
(defun --hans-emacs-lisp-repeat (str count)
  "Create dashes with given COUNT."
  (let ((dashes ""))
    (dotimes (iterator count dashes)
      (setq dashes (concat dashes str)))))

(defun --hans-emacs-lisp-wrap-text-in-spaces (text)
  (let* ((len (length text))
	 (spaces-length-side (/ (- 80 len) 2))
	 (spaces-side (--hans-emacs-lisp-repeat " " spaces-length-side)))
    (format "%s%s%s" spaces-side text spaces-side)))

(defun hans-emacs-lisp-insert-comment-line (text)
  "Insert a comment line with given TEXT."
  (interactive "sComment: ")
  (let* ((text-wrapped (--hans-emacs-lisp-wrap-text-in-spaces text))
	 (dashes (--hans-emacs-lisp-repeat "=" 80)))
    (insert (format "\n;;%s\n;;%s\n;;%s" dashes text-wrapped dashes))))

(use-package elisp-mode
  :ensure nil
  
  :bind
  (:map emacs-lisp-mode-map
	("C-c C-c C-d" . 'hans-emacs-lisp-insert-comment-line)))


(provide 'hans-emacs-lisp)
;;; emacs-lisp.el ends here
