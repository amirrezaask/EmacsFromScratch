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

;;================================================================================
;;                                    IBuffer                                    
;;================================================================================
(use-package ibuffer
  :bind (("C-x C-b" . 'ibuffer)))

(use-package ibuffer-projectile 
  :hook (ibuffer . ibuffer-projectile-set-filter-groups))

;;================================================================================
;;                                     Dired                                     
;;================================================================================
(use-package dired
       :ensure nil
       :straight nil
       :bind
       (("C-x C-j" . dired-jump)
        ("C-x j" . dired-jump-other-window))
       :custom
       ;; Always delete and copy recursively
       (dired-recursive-deletes 'always)
       (dired-recursive-copies 'always))

(use-package which-key
  	     :config
	     (which-key-mode 1))
(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "M-z") nil)
(global-set-key (kbd "C-x C-z") nil)
(use-package files :straight nil :ensure nil
  :config
  (setq make-backup-files nil))
(setq custom-file (expand-file-name "custom.el" hans/misc-path))
;; sane zoom-in and zoom-out 
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C-_") 'text-scale-decrease)

;; buffer switching
(global-set-key (kbd "C-.") 'next-buffer)
(global-set-key (kbd "C-,") 'previous-buffer)

;; custom motions
(global-set-key (kbd "M-n") (lambda () (interactive) (next-line 5)))
(global-set-key (kbd "M-p") (lambda () (interactive) (previous-line 5)))

;;================================================================================
;;                                      Crux                                      
;;================================================================================
(use-package crux
  :config
  (require 'crux)
  :bind (("C-S-k" . 'crux-kill-whole-line))
  ("C-x K" . 'crux-kill-other-buffers))


;;================================================================================
;;                                     Swiper                                     
;;================================================================================
(use-package swiper
	     :commands (swiper)
	     :init (global-set-key (kbd "C-s") 'swiper))

;;================================================================================
;;                                     IEdit                                     
;;================================================================================

(use-package iedit
  :bind (("C-;" . 'iedit-mode)))



;;================================================================================
;;                                    Treemacs                                    
;;================================================================================
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


;;================================================================================
;;                                Multiple Cursors                                
;;================================================================================
(use-package multiple-cursors
  :defer t
  :bind (("C->" . 'mc/mark-next-like-this)
	 ("C-<" . 'mc/mark-previous-like-this)
	 ("C-c C-<" . 'mc/mark-all-like-this)
	 ("C-M-," . 'mc/edit-lines)))



;;================================================================================
;;                                 Expand Region                                 
;;================================================================================
(use-package expand-region
	     :bind (("C-=" . 'er/expand-region)
		    ("C--" . 'er/contract-region)))


;;================================================================================
;;                               Highlight Indents                               
;;================================================================================
(use-package highlight-indent-guides
  :hook ((yaml-mode) . highlight-indent-guides-mode)
  :init
  (setq highlight-indent-guides-method 'character)
  :config
  (add-hook 'focus-in-hook #'highlight-indent-guides-auto-set-faces))



;;================================================================================
;;                                   Ace Window                                   
;;================================================================================
(use-package ace-window
  :bind (("C-x o" . 'ace-window) 
	 ("C-x C-o" . 'ace-window)))



;;================================================================================
;;                                    Winner                                     
;;================================================================================
(use-package winner 
  :ensure nil
  :straight nil)



;;================================================================================
;;                                  Auto Insert                                  
;;================================================================================
(use-package autoinsert
  :config
  (auto-insert-mode +1))


;;================================================================================
;;                                     ctags                                     
;;================================================================================
(defun hans/modules/editor-update-ctags ()
  "Update Ctags file in current directory."
  (interactive)
  (cd default-directory)
  (start-process "ctags" "*CTAGS*" "ctags" "-eR" "."))



;;================================================================================
;;                                   Dumb Jump                                   
;;================================================================================
(use-package dumb-jump
  :bind
  (("C-M-j" . 'dumb-jump-go)
   ("C-M-p" . 'dumb-jump-back))
  :config
  (dumb-jump-mode 1))



;;================================================================================
;;                                   Sudo Edit                                   
;;================================================================================
(use-package sudo-edit
  :commands (sudo-edit))



;;================================================================================
;;                                Highlight TODO                                 
;;================================================================================
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



;;================================================================================
;;                            Global display numbers                             
;;================================================================================
(use-package display-line-numbers
  :config 
  (global-display-line-numbers-mode 1))



;;================================================================================
;;                              Column Numbers Mode                              
;;================================================================================				
(use-package simple
  :ensure nil
  :straight nil
  :config
  (column-number-mode 1))



;;================================================================================
;;                                  Cursor Type                                  
;;================================================================================
(use-package emacs
  :custom
  (cursor-type 'bar))

;;================================================================================
;;                             Highlight Current line                             
;;================================================================================
(use-package hl-line
  :config
  (global-hl-line-mode 1))



;;================================================================================
;;                               Blink cursor mode                               
;;================================================================================
(use-package frame
  :ensure nil
  :straight nil
  :config
  (blink-cursor-mode 0))


(provide 'hans-editor)

;;; editor.el ends here
