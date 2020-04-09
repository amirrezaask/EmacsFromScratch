;;; ui.el --- UI module of amirreza-emacs                  -*- lexical-binding: t; -*-

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
;; ------------------------------ Disable GUI shits
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(setq use-dialog-box nil)
(setq inhibit-splash-screen 0)
(setq ring-bell-function 'ignore)
(defalias 'yes-or-no-p 'y-or-n-p)

;;-------------------------------- Themes

(use-package doom-themes :defer t)
(use-package spacemacs-theme :defer t)
(use-package badwolf-theme :defer t)
(use-package modus-operandi-theme :defer t) ;; light version of modus theme
(use-package modus-vivendi-theme :defer t) ;; dark version of modus theme
(load-theme 'doom-one t)

;; ----------------------------------Icons

(use-package all-the-icons
  :commands (all-the-icons-octicon
             all-the-icons-faicon
             all-the-icons-fileicon
             all-the-icons-wicon
             all-the-icons-material
             all-the-icons-alltheicon))

(use-package all-the-icons-dired
  :init
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

;; ------------------------------------ Modeline

(use-package doom-modeline
  :init (doom-modeline-mode 1))
(setq doom-modeline-height 35)
;; ------------------------------------- Font

(defun amirreza-emacs/font (font size)
  (add-to-list 'default-frame-alist (cons 'font (format "%s-%d" font size))))

(amirreza-emacs/font "Fira Code" 10)

;; -------------------------------------- Tabs
(use-package centaur-tabs
	     :disabled t
	     :init
	     (setq centaur-tabs-set-icons t
		   centaur-tabs-gray-out-icons 'buffer
		   centaur-tabs-set-bar 'left
		   centaur-tabs-set-modified-marker t
		   centaur-tabs-close-button "✕"
		   centaur-tabs-modified-marker "⬤")
	     :config
	     (centaur-tabs-mode 1))

;; ----------------------------------------Improve scrolling experience ---------------------------
(setq scroll-step 1)
(setq scroll-margin 1)
(setq scroll-conservatively 101)
(setq scroll-up-aggressively 0.01)
(setq scroll-down-aggressively 0.01)
(setq auto-window-vscroll nil)
(setq fast-but-imprecise-scrolling nil)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
;; Horizontal Scroll
(setq hscroll-step 1)
(setq hscroll-margin 1)




(provide 'ui)
;;; ui.el ends here
