(defconst lisp--prettify-symbols-alist
  '(("lambda"  . ?λ))) ;; shows lambda word as the symbol
(global-prettify-symbols-mode 1)

(defun init-ui-use-font (font-config)
  "use given FONT with given SIZE"
  (interactive)
  (add-to-list 'default-frame-alist (cons 'font (format "%s-%d" (car font-config) (car (last font-config))))))



(if-feature-use-package! :theme
			 doom-themes
			 :defer t)

(if-feature-use-package! :theme
			 badwolf-theme
			 :defer t)

(if-feature-use-package! :icons
			 all-the-icons)

(if-feature-use-package! :dired-icons
			 all-the-icons-dired
			 :straight (all-the-icons-dired :type git :host github :repo "jtbm37/all-the-icons-dired")
			 :init
			 (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(if-feature-eval! :theme
		  (setq custom-safe-themes t)
		  (load-theme (init-keyword-to-symbol (init-feature-get-argument :theme)) t))


(if-feature-use-package! :modeline
			 doom-modeline
			 :config (doom-modeline-mode 1))

(if-feature-use-package! :show-emojis
			 emojify
			 :config (emojify-mode 1))

(if-feature-eval! :font
		  (init-ui-use-font (init-feature-get-argument :font)))

(setq inhibit-splash-screen 0) ;; turn off emacs annoying startup page.
(tool-bar-mode 0) ;; turn off emacs GUI toolbar
(scroll-bar-mode 0) ;; turn off emacs GUI scrollbar
(menu-bar-mode 0) ;; turn emacs GUI menubar

(global-linum-mode t) ;; enable line numbers
(setq use-dialog-box nil)

(provide 'init-ui)
;;; init-ui.el ends here
