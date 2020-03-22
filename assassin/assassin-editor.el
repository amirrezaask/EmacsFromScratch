;;; assassin-editor.el --- assassin editor module    -*- lexical-binding: t; -*-

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
(assassin-feature :ivy
	       (use-package swiper
			    :commands (swiper)
			    :init
			    (bindkey global-map 'swiper :evil (:normal "SPC s s") :holy "C-s"))
	       
	       (use-package counsel
			    :commands (counsel-M-x counsel-find-file ivy-switch-buffer)
			    :init
			    (bindkey global-map 'counsel-M-x :evil (:normal "SPC SPC") :holy "M-x")
			    (bindkey global-map 'counsel-find-file :evil (:normal "SPC f f") :holy "C-x C-f")
			    (bindkey global-map 'ivy-switch-buffer :evil (:normal "SPC b l") :holy "C-x b"))
	       )


(assassin-feature :helm
	       (use-package helm
			    :init (setq helm-buffers-fuzzy-matching t
					helm-recentf-fuzzy-match t)
			    :bind* (:map helm-map
					 ("TAB" . #'helm-execute-persistent-action)
					 ("<tab>" . #'helm-execute-persistent-action)
					 ("C-z". #'helm-select-action))
			    :config
			    (helm-mode 1)
			    (bindkey global-map 'helm-find-files :evil (:normal "SPC f f") :holy "C-x C-f")
			    (bindkey global-map 'helm-M-x :evil (:normal "SPC SPC") :holy "M-x")
			    (bindkey global-map 'helm-recentf :evil (:normal "SPC f r") :holy "C-x C-r")
			    (bindkey global-map 'helm-mini :evil (:normal "SPC b l") :holy "C-x b")
			    (bindkey global-map 'helm-mini :holy "C-x C-b")))

(assassin-feature :ido
	       (use-package ido-vertical-mode
			    :config
			    (ido-mode 1)
			    (ido-everywhere 1)
			    (ido-vertical-mode 1)
			    (setq ido-vertical-define-keys 'C-n-and-C-p-only))
	       (use-package smex
			    :commands
			    (smex)
			    :init
			    (bindkey global-map 'smex :evil (:normal "SPC SPC") :holy "M-x")))

(assassin-feature :whitespace-mode
	       (use-package whitespace :hook ((prog-mode text-mode) . whitespace-mode)
			    :init
			    (setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark )))
			    (setq whitespace-display-mappings
				  '(
				    (space-mark 32 [183] [46])
				    (newline-mark 10 [182 10])
				    (tab-mark 9 [9655 9] [92 9])
				    ))
			    ))

(assassin-feature :insert-headers
	       (use-package autoinsert :ensure t 
			    :init 
			    (setq auto-insert-query nil)
			    (auto-insert-mode 1)))

(assassin-feature :dashboard
		  (use-package dashboard
		    :init
		    (setq dashboard-startup-banner 'logo) 
		    (setq dashboard-center-content t)
		    (setq dashboard-banner-longo-title "Requiescat in pace")
		    (setq dashboard-items '())
		    :config
		    (dashboard-setup-startup-hook)
		    ))
(provide 'assassin-editor)
;;; assassin-editor.el ends here
