;;; editor.el --- editor setup            -*- lexical-binding: t; -*-

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

(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C-o") 'other-window)
(global-set-key (kbd "C-,") 'previous-buffer)
(global-set-key (kbd "C-.") 'next-buffer)

(use-package which-key
  :init (setq echo-keystrokes 0.3)
  :config (which-key-mode 1))

(use-package rg
  :config
  (rg-enable-default-bindings))

(use-package swiper
  :commands (swiper)
  :init (global-set-key (kbd "C-s") 'swiper))

(use-package counsel
  :commands (counsel-M-x counsel-find-file ivy-switch-buffer)
  :bind
  (("M-x" . 'counsel-M-x)
   ("C-x C-f" . 'counsel-find-file)
   ("C-h b" . 'counsel-descbinds)
   ("C-h f" . 'counsel-describe-function)
   ("C-h v" . 'counsel-describe-variable)
   ("C-h a" . 'counsel-apropos)
   ("C-x b" . 'ivy-switch-buffer)
   ("<f2> " . 'counsel-ag)
   ( "M-y" . 'counsel-yank-pop)))

(use-package highlight-indent-guides
  :hook ((prog-mode text-mode conf-mode) . highlight-indent-guides-mode)
  :init
  (setq highlight-indent-guides-method 'character)
  :config
  (add-hook 'focus-in-hook #'highlight-indent-guides-auto-set-faces)
  (add-hook 'org-indent-mode-hook (lambda () (
					 (when highlight-indent-guides-mode
					   (highlight-indent-guides-mode -1))))))

(use-package ibuffer
  :bind (("C-x C-b" . 'ibuffer)))

(use-package multiple-cursors)

(auto-insert-mode 1)
(setq-default cursor-type 'bar)
(global-hl-line-mode 1)
(blink-cursor-mode 0)
(global-linum-mode 1)

(setq custom-file "~/.__custom.el")
(setq make-backup-files nil) ;; turn off emacs annoying ~ files
(setq create-lockfiles nil) ;; turn off emacs annoying # files
(setq ring-bell-function 'ignore)
(defalias 'yes-or-no-p 'y-or-n-p) ;; instead of yes-or-no ask y-or-no, only for convinience

(provide 'editor)
;;; editor.el ends here
