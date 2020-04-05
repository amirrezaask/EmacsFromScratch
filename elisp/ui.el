;;; ui.el --- ui setup            -*- lexical-binding: t; -*-

;; Copyright (C) 2020  amirrezaask

;; Author: amirreza <amirrezaask@protonmail.com>


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

(use-package doom-themes :defer t)

(use-package spacemacs-theme :defer t)

(use-package badwolf-theme :defer t)

(defmacro font! (font size)
  `(add-to-list 'default-frame-alist (cons 'font (format "%s-%d" ,font ,size))))

(use-package all-the-icons)

(use-package all-the-icons-dired
  :straight (all-the-icons-dired :type git :host github :repo "jtbm37/all-the-icons-dired")
  :init
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

;; (use-package doom-modeline :config(doom-modeline-mode 1))

(use-package emojify :config (emojify-mode 1))

(setq inhibit-splash-screen 0) ;; turn off emacs annoying startup page.
(tool-bar-mode 0) ;; turn off emacs GUI toolbar
(scroll-bar-mode 0) ;; turn off emacs GUI scrollbar
(menu-bar-mode 0) ;; turn emacs GUI menubar
(setq fast-but-imprecise-scrolling t)
(setq use-dialog-box nil)

(provide 'ui)
;;; ui.el ends here
