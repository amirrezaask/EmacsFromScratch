;;; ui.el --- UI module of hans                  -*- lexical-binding: t; -*-

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



;;================================================================================
;;                                      VARS                                      
;;================================================================================
(defvar hans/ui/theme 'modus-vivendi "Hans default theme.")
(defvar hans/ui/font '(:family "Jetbrains Mono" :size 10))
(defvar hans/ui/doom-modeline nil "wether to enable doom-modeline or not")

;;================================================================================
;;                               Disable GUI things                               
;;================================================================================
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(setq use-dialog-box nil)
(setq inhibit-splash-screen 0)
(setq ring-bell-function 'ignore)
(defalias 'yes-or-no-p 'y-or-n-p)


;;================================================================================
;;                                     Themes                                     
;;================================================================================

(use-package doom-themes :defer t)
(use-package spacemacs-theme :defer t)
(use-package badwolf-theme :defer t)
(use-package modus-operandi-theme :defer t) ;; light version of modus theme
(use-package modus-vivendi-theme :defer t) ;; dark version of modus theme

(load-theme hans/ui/theme t)


;;================================================================================
;;                                     Icons                                     
;;================================================================================

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



;;================================================================================
;;                                    Modeline                                    
;;================================================================================

(use-package doom-modeline
  :if hans/ui/doom-modeline
  :init (doom-modeline-mode 1)
  :custom
  (doom-modeline-height 35))




;;================================================================================
;;                                   Font setup                                   
;;================================================================================

(defun hans/ui/set-font (font)
  "Set font for Emacs."
  (let ((family (plist-get font :family))
	(size (plist-get font :size)))
    (add-to-list 'default-frame-alist (cons 'font (format "%s-%d" family size)))))

(hans/ui/set-font hans/ui/font)

;;================================================================================
;;                                Better Scrolling                                
;;================================================================================
(use-package emacs
  :custom
  (scroll-step 1)
  (scroll-margin 1)
  (scroll-conservatively 101)
  (scroll-up-aggressively 0.01)
  (scroll-down-aggressively 0.01)
  (uto-window-vscroll nil)
  (fast-but-imprecise-scrolling nil)
  (mouse-wheel-scroll-amount '(1 ((shift) . 1)))
  (mouse-wheel-progressive-speed nil)
  (hscroll-step 1)
  (hscroll-margin 1))

(provide 'modules/ui)
;;; ui.el ends here
