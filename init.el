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
(package-refresh-contents)
(package-install 'use-package)

(use-package doom-themes :defer t)

(load-theme 'doom-dracula)

(use-package rainbow-delimiters
  :hook emacs-lisp-mode)

(use-package ivy
  :config
  (ivy-mode +1))

(use-package counsel
  :bind (("C-c C-c f" . counsel-fzf)
	 ("C-c C-c s" . counsel-rg)))

;; C-x => emacs built-in 
;; C-c C-* *** => major mode
;; C-c * => minor mode / user pref
;; fn => user pref
(use-package swiper
  :bind (("C-s" . swiper) ("C-r". swiper)))

