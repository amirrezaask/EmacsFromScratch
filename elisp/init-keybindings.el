;;; init-keybinding.el --- keybinding setup            -*- lexical-binding: t; -*-

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

(if-feature-use-package! :evil
			     evil
			     :init
			     (setq evil-want-keybinding nil)
			     (add-hook 'simple-mode-hook 'evil-mode)
			     :config
			     (bindkey global-map 'find-file :evil (:normal "SPC f f"))
			     (bindkey global-map 'kill-buffer :evil (:normal "SPC b k"))
			     (bindkey global-map 'save-buferr :evil (:normal "SPC b s"))
			     (bindkey global-map 'next-buffer :evil (:normal "SPC b n"))
			     (bindkey global-map 'previous-buffer :evil (:normal "SPC b p"))
			     (bindkey global-map 'switch-to-buffer :evil (:normal "SPC b l"))
			     (bindkey global-map 'other-window :evil (:normal "SPC w o"))
			     (bindkey global-map 'delete-window :evil (:normal "SPC w d"))
			     (bindkey global-map 'delete-other-windows :evil (:normal "SPC w m"))
			     (bindkey global-map 'split-window-vertically :evil (:normal "SPC w s v"))
			     (bindkey global-map 'kill-buffer :evil (:normal "SPC b k"))
			     (bindkey global-map 'eval-last-sexp :evil (:normal "SPC e e"))
			     (bindkey global-map 'eval-buffer :evil (:normal "SPC e b"))
			     (bindkey global-map 'comment-line :evil (:normal "SPC l c"))
			     (bindkey global-map 'describe-key :evil (:normal "SPC d k"))
			     (bindkey global-map 'describe-function :evil (:normal "SPC d f"))
			     (bindkey global-map 'describe-variable :evil (:normal "SPC d v"))
			     (bindkey global-map 'toggle-color-mode :evil (:normal "SPC t t"))

			     (evil-mode 1))

(if-feature-use-package! :evil
			     evil-collection
			     :after evil
			     :config
			     (evil-collection-init))
 
(if-feature-use-package! :evil
			 linum-relative
			     :config (linum-relative-mode))

(if-feature-eval! :god
		  (global-set-key (kbd "C--") 'text-scale-decrease)
		  (global-set-key (kbd "C-=") 'text-scale-increase)
		  (global-set-key (kbd "C-o") 'other-window)
		  (global-set-key (kbd "C-,") 'previous-buffer)
		  (global-set-key (kbd "C-.") 'next-buffer))

(if-feature-use-package! :emacs-guru
			     guru-mode
			     :config
			     (guru-global-mode 1))

(if-feature-use-package! :which-key
			     which-key
			     :init
			     (setq echo-keystrokes 0.3)
			     :config (which-key-mode 1))


(provide 'init-keybindings)
