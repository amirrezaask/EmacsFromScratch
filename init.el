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
(package-refresh-contents)

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

;; C-x => emacs built-in 
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
         (python-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package py-autopep8
  :ensure t
  :hook python-mode
  :config
  (py-autopep8-enable-on-save))

(use-package magit :ensure t
  :bind (("C-x g" . magit))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1526aeed166165811eefd9a6f9176061ec3d121ba39500af2048073bea80911e" default)))
 '(package-selected-packages
   (quote
    (which-key use-package sudo-edit spacemacs-theme smex rainbow-delimiters python-mode py-autopep8 pipenv phpunit php-mode modus-vivendi-theme modus-operandi-theme magit lsp-ui lsp-python-ms lsp-ivy kubel jinja2-mode iedit ido-vertical-mode ido-completing-read+ ibuffer-projectile hl-todo highlight-indent-guides gotest go-add-tags gitignore-mode gitconfig-mode gitattributes-mode git-messenger gcmh flycheck-rust expand-region exec-path-from-shell dumb-jump doom-themes doom-modeline dockerfile-mode docker diff-hl crux counsel-projectile company-prescient clj-refactor cargo badwolf-theme all-the-icons-dired ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
