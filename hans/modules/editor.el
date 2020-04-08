;;; editor.el --- Editor module                      -*- lexical-binding: t; -*-

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

;; --------------------------- Interactive Edit (IEdit) ----------------------

(use-package iedit
	     :bind (("C-;" . 'iedit-mode)))

;; ----------------------------- Treemacs ----------------------------------

(use-package treemacs
	     :disabled t
	     :bind (("M-0" . treemacs-select-window))
	     :init
	     (setq treemacs-follow-after-init t
		   treemacs-is-never-other-window nil
		   treemacs-sorting 'alphabetic-case-insensitive-asc)
	     :config 
	     (treemacs-follow-mode -1))
(use-package treemacs-projectile :disabled t)
(use-package treemacs-magit :disabled t)
;; ------------------------------- Multiple cursors----------------------------
(use-package multiple-cursors
	     :defer t
	     :bind (("C->" . 'mc/mark-next-like-this)
		    ("C-<" . 'mc/mark-previous-like-this)
		    ("C-c C-<" . 'mc/mark-all-like-this)
		    ("C-M-," . 'mc/edit-lines)))

;; --------------------------------Expand region ----------------------------
(use-package expand-region
	     :bind (("C-=" . 'er/expand-region)
		    ("C--" . 'er/contract-region)))

;; ----------------------------------Highlight Indents----------------------------
(use-package highlight-indent-guides
  :hook ((yaml-mode) . highlight-indent-guides-mode)
  :init
  (setq highlight-indent-guides-method 'character)
  :config
  (add-hook 'focus-in-hook #'highlight-indent-guides-auto-set-faces))

;; ----------------------------------- Better window management ----------------------
(use-package ace-window
	     :bind (("C-x o" . 'ace-window) 
		    ("C-x C-o" . 'ace-window)))

(use-package winner 
	     :ensure nil
	     :straight nil)
;; ------------------------------------ Automatic insertion of file headers --------------------
(auto-insert-mode 1)
;; ------------------------------------- ctags ----------------------------------------
(defun update-ctags ()
  "Update Ctags file in current directory."
  (interactive)
  (cd default-directory)
  (start-process "ctags" "*CTAGS*" "ctags" "-eR" "."))

;; -------------------------------------------- Dumb Jump ---------------------------------------
;; Jump to defenition using grep
(use-package dumb-jump
	     :bind
	     (("C-M-j" . 'dumb-jump-go)
	      ("C-M-p" . 'dumb-jump-back))
	     :config
	     (dumb-jump-mode 1))
;; ---------------------------------------------- sudo edit -------------------------------------
(use-package sudo-edit
  :commands (sudo-edit))
;; ---------------------------------------------- highlight todos ---------------------------------
(use-package hl-todo
	     :defer t
	     :init (add-hook 'prog-mode-hook #'hl-todo-mode)
	     :config
	     (setq hl-todo-highlight-punctuation ":"
		   hl-todo-keyword-faces
		   `(("TODO"       warning bold)
		     ("FIXME"      error bold)
		     ("HACK"       font-lock-constant-face bold)
		     ("REVIEW"     font-lock-keyword-face bold)
		     ("NOTE"       success bold)
		     ("DEPRECATED" font-lock-doc-face bold))))
;; ----------------------------------------------- Org Mode ----------------------------------------

(use-package org
  :defer t
  :mode ("\\.org\\'" . org-mode)
  :ensure nil
  :straight nil
  :custom
  (org-support-shift-select t))

(use-package org-bullets
	     :hook ((org-mode) . 'org-bullets-mode))

(global-display-line-numbers-mode 1)

(column-number-mode 1)

(setq-default cursor-type 'bar)

(global-hl-line-mode 1)

(blink-cursor-mode 0)

(provide 'editor)

;;; editor.el ends here
