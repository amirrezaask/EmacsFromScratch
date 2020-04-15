;; disable GUI 
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;; line numbers
(display-line-numbers-mode +1)
(column-number-mode +1)
;; elpa (emacs lisp package archive)
;;; gnu elpa
;;; melpa
;; C-h f function
;; C-h v variable
;; C-n next line
;; C-p previous line
;; C-f forwad char M-f
;; C-b backward char

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(load-file "~/dev/emacs-from-scratch/command-log-mode.el")

(if (null package-archive-contents)
    (package-refresh-contents))

(package-install 'use-package)
(use-package doom-themes :defer t)

(load-theme 'doom-dracula)

(use-package rainbow-delimiters
  :ensure t
  :hook (emacs-lisp-mode . rainbow-delimiters-mode))
(use-package ivy
  :ensure t
  :config
  (ivy-mode +1))

(use-package counsel
  :ensure t
  :bind (("C-c C-c f" . counsel-fzf)
	 ("C-c C-c s" . counsel-rg)))

;; C-x * => emacs built-in 
;; C-c C-* *** => major mode
;; C-c * => minor mode / user pref
;; fn => user pref
(use-package swiper
  :ensure t
  :bind (("C-s" . swiper) ("C-r". swiper)))

(use-package company
  :ensure t
  :config
  (global-company-mode 1))
  
(use-package lsp-mode
  :ensure t
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         ((python-mode go-mode) . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package py-autopep8
  :ensure t
  :hook python-mode
  :config
  (py-autopep8-enable-on-save))

(use-package magit :ensure t
  :bind (("C-x g" . magit)))

(defun go-save-hooks ()
  (interactive)
  (add-hook 'before-save-hook 'lsp-organize-imports t t)
  (add-hook 'before-save-hook 'lsp-format-buffer t t))


(use-package go-mode
  :ensure t
  :mode "\\.go\\'"
  :config
  (add-hook 'go-mode-hook 'go-save-hooks)
  )

(use-package go-add-tags
  :ensure t
  :config
  (define-key go-mode-map (kbd "C-c C-g s t") 'go-add-tags))

(use-package gotest
  :ensure t
  :general
  (:keymaps go-mode-map :prefix "SPC"
	    "t c t" 'go-test-current-test
	    "t c f" 'go-test-current-file)
  :config
  (define-key go-mode-map (kbd "C-c C-g t t") 'go-test-current-test)
  (define-key go-mode-map (kbd "C-c C-g t f") 'go-test-current-file))
;; <leader , SPC> 
(use-package evil :ensure t
  :config
  (evil-mode +1))

(use-package evil-collection :ensure t
  :config
  (evil-collection-init))

(use-package evil-magit :ensure t)
(define-key evil-normal-state-map (kbd "SPC f f") 'find-file)
(define-key evil-normal-state-map (kbd "SPC s b") 'switch-to-buffer)
(define-key evil-normal-state-map (kbd "SPC k b") 'kill-buffer)
(use-package general
  :ensure t
  :config
  (general-define-key :states 'normal
		      :prefix "SPC"
		      "ff" 'find-file
		      "sb" 'switch-to-buffer
		      "kb" 'kill-buffer)
  )


;; global-map
;; go-mode-map
;; python-mode-map

