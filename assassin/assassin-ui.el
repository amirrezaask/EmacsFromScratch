;;; assassin-ui.el --- assassin ui module            -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Amirreza Askarpour

;; Author: Amirreza Askarpour <amirrezaask@protonmail.com>
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
(defvar assassin-ui-light-theme 'doom-one-light "light theme of assassin emacs")
(defvar assassin-ui-dark-theme 'badwolf"dark theme of assassin emacs")
(defvar assassin-ui--current-mode 0)
(setq use-dialog-box nil)

(defconst lisp--prettify-symbols-alist
  '(("lambda"  . ?λ))) ;; shows lambda word as the symbol
(global-prettify-symbols-mode 1)

(defun assassin-ui-use-font (font size)
  "use given FONT with given SIZE"
  (interactive)
  (add-to-list 'default-frame-alist (cons 'font (format "%s-%d" font size))))

(defun toggle-color ()
  "toggle the color mode of assassin emacs"
  (interactive)
  (if (= assassin-ui--current-mode 0) (progn (load-theme assassin-ui-dark-theme) (setq assassin-ui--current-mode 1)) (progn (load-theme assassin-ui-light-theme t) (setq assassin-ui--current-mode 0)))
  )


(assassin-when themes
	       (setq custom-safe-themes t)
	       (use-package doom-themes :defer t)
	       (use-package badwolf-theme :defer t)
	       (load-theme assassin-ui-dark-theme t))

(assassin-when modeline
	       (use-package doom-modeline :config (doom-modeline-mode 1)))

(assassin-when show-emojis
	       (use-package emojify :config (emojify-mode 1)))

(provide 'assassin-ui)
;;; assassin-ui.el ends here
