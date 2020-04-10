;;; keybindings.el --- keybinding module             -*- lexical-binding: t; -*-

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

;;; --------------------------General Keybindings--------------------
;; disabling some useless annoying keys
(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "M-z") nil)
(global-set-key (kbd "C-x C-z") nil)

;; sane zoom-in and zoom-out 
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C-_") 'text-scale-decrease)

;; buffer switching
(global-set-key (kbd "C-.") 'next-buffer)
(global-set-key (kbd "C-,") 'previous-buffer)

;; custom motions
(global-set-key (kbd "M-n") (lambda () (interactive) (next-line 5)))
(global-set-key (kbd "M-p") (lambda () (interactive) (previous-line 5)))

;;; ---------------------------- Which-key ---------------------------

(use-package which-key
  	     :config
	     (which-key-mode 1))

;;; 
(provide 'modules/keybindings)
;;; keybindings.el ends here
