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
(core/if-feature-use-package! :evil
			     evil
			     :init
			     (setq evil-want-keybinding nil)
			     (add-hook 'simple-mode-hook 'evil-mode)
			     :config
			     (core/bindkey global-map 'find-file :evil (:normal "SPC f f"))
			     (core/bindkey global-map 'kill-buffer :evil (:normal "SPC b k"))
			     (core/bindkey global-map 'save-buferr :evil (:normal "SPC b s"))
			     (core/bindkey global-map 'next-buffer :evil (:normal "SPC b n"))
			     (core/bindkey global-map 'previous-buffer :evil (:normal "SPC b p"))
			     (core/bindkey global-map 'switch-to-buffer :evil (:normal "SPC b l"))
			     (core/bindkey global-map 'other-window :evil (:normal "SPC w o"))
			     (core/bindkey global-map 'delete-window :evil (:normal "SPC w d"))
			     (core/bindkey global-map 'delete-other-windows :evil (:normal "SPC w m"))
			     (core/bindkey global-map 'split-window-vertically :evil (:normal "SPC w s v"))
			     (core/bindkey global-map 'kill-buffer :evil (:normal "SPC b k"))
			     (core/bindkey global-map 'eval-last-sexp :evil (:normal "SPC e e"))
			     (core/bindkey global-map 'eval-buffer :evil (:normal "SPC e b"))
			     (core/bindkey global-map 'comment-line :evil (:normal "SPC l c"))
			     (core/bindkey global-map 'describe-key :evil (:normal "SPC d k"))
			     (core/bindkey global-map 'describe-function :evil (:normal "SPC d f"))
			     (core/bindkey global-map 'describe-variable :evil (:normal "SPC d v"))
			     (core/bindkey global-map 'toggle-color-mode :evil (:normal "SPC t t"))

			     (evil-mode 1))

(core/if-feature-use-package! :evil
			     evil-collection
			     :after evil
			     :config
			     (evil-collection-init))
 
(core/if-feature-use-package! :evil
			 linum-relative
			     :config (linum-relative-mode))

(core/if-feature-eval! :god
		  (global-set-key (kbd "C--") 'text-scale-decrease)
		  (global-set-key (kbd "C-=") 'text-scale-increase)
		  (global-set-key (kbd "C-o") 'other-window)
		  (global-set-key (kbd "C-,") 'previous-buffer)
		  (global-set-key (kbd "C-.") 'next-buffer))

(core/if-feature-use-package! :emacs-guru
			     guru-mode
			     :config
			     (guru-global-mode 1))

(core/if-feature-use-package! :which-key
			     which-key
			     :init
			     (setq echo-keystrokes 0.3)
			     :config (which-key-mode 1))



(core/if-feature-use-package! :ivy
			 swiper
			 :commands (swiper)
			 :init
			 (core/bindkey global-map 'swiper :evil (:normal "SPC s s") :holy "C-s"))

(core/if-feature-use-package! :ivy
			 counsel
			 :commands (counsel-M-x counsel-find-file ivy-switch-buffer)
			 :init
			 (core/bindkey global-map 'counsel-M-x :evil (:normal "SPC SPC") :holy "M-x")
			 (core/bindkey global-map 'counsel-find-file :evil (:normal "SPC f f") :holy "C-x C-f")
			 (core/bindkey global-map 'counsel-descbinds :evil (:normal "SPC h d b") :holy "C-h b")
			 (core/bindkey global-map 'counsel-describe-function :evil (:normal "SPC h d f") :holy "C-h f")
			 (core/bindkey global-map 'counsel-describe-variable :evil (:normal "SPC h d v") :holy "C-h v")
			 (core/bindkey global-map 'counsel-aprops :evil (:normal "SPC h d a") :holy "C-h a")
			 (core/bindkey global-map 'counsel-yank-pop :evil (:normal "SPC y p") :holy "M-y")
			 (core/bindkey global-map 'ivy-switch-buffer :evil (:normal "SPC b l") :holy "C-x b")
			 (core/bindkey global-map 'ivy-switch-buffer :holy "C-x C-b")
			 (core/bindkey global-map 'counsel-ag :evil (:normal "SPC s g") :holy "C-x C-a"))

(core/if-feature-use-package! :helm
			 helm
			 :init (setq helm-buffers-fuzzy-matching t
				     helm-recentf-fuzzy-match t)
			 :bind* (:map helm-map
				      ("TAB" . #'helm-execute-persistent-action)
				      ("<tab>" . #'helm-execute-persistent-action)
				      ("C-z". #'helm-select-action))
			 :config
			 (helm-mode 1)
			 (core/bindkey global-map 'helm-find-files :evil (:normal "SPC f f") :holy "C-x C-f")
			 (core/bindkey global-map 'helm-M-x :evil (:normal "SPC SPC") :holy "M-x")
			 (core/bindkey global-map 'helm-recentf :evil (:normal "SPC f r") :holy "C-x C-r")
			 (core/bindkey global-map 'helm-mini :evil (:normal "SPC b l") :holy "C-x b")
			 (core/bindkey global-map 'helm-mini :holy "C-x C-b"))

(core/if-feature-eval! :ido
		  (ido-mode 1)
		  (ido-everywhere 1)
		  (setq ido-core/enable?-flex-matching t))

(core/if-feature-use-package! :ido
			 ido-completing-read+
			 :config
			 (ido-ubiquitous-mode 1)
			 (local-unset-key (kbd "C-x C-f"))
			 (local-set-key (kbd "C-x C-t") 'ido-fallback-command))

(core/if-feature-use-package! :ido
			 ido-vertical-mode
			 :config
			 ;; (ido-vertical-mode 1) 
			 (setq ido-vertical-define-keys 'C-n-and-C-p-only))

(core/if-feature-use-package! :hl-indent
			 highlight-indent-guides
			 :hook ((prog-mode text-mode conf-mode) . highlight-indent-guides-mode)
			 :init
			 (setq highlight-indent-guides-method 'character)
			 :config
			 (add-hook 'focus-in-hook #'highlight-indent-guides-auto-set-faces)
			 (add-hook 'org-indent-mode-hook (lambda () (
								(when highlight-indent-guides-mode
								  (highlight-indent-guides-mode -1))))))


(core/if-feature-use-package! :ido
			 smex
			 :commands
			 (smex)
			 :init
			 (core/bindkey global-map 'smex :evil (:normal "SPC SPC") :holy "M-x"))

(core/if-feature-use-package! :ibuffer
			 ibuffer
			 :config
			 (core/bindkey global-map 'ibuffer :holy "C-x C-b" :evil (:normal "SPC b i")))

(core/if-feature-use-package! :neotree
			 neotree
			 :init
			 (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
			 (core/bindkey global-map 'neotree-toggle :holy "<f8>")
			 :commands (neotree neotree-toggle))

(core/if-feature-use-package! :multiple-cursors
			 multiple-cursors)



(setq custom-file "~/.__custom.el")
(setq make-backup-files nil) ;; turn off emacs annoying ~ files
(setq create-lockfiles nil) ;; turn off emacs annoying # files
(setq ring-bell-function 'ignore)
(defalias 'yes-or-no-p 'y-or-n-p) ;; instead of yes-or-no ask y-or-no, only for convinience
(global-hl-line-mode 1)
(provide 'editor)
;;; editor.el ends here
