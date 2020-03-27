(defconst lisp--prettify-symbols-alist
  '(("lambda"  . ?λ))) ;; shows lambda word as the symbol
(global-prettify-symbols-mode 1)

(defun comrade-ui-use-font (font-config)
  "use given FONT with given SIZE"
  (interactive)
  (add-to-list 'default-frame-alist (cons 'font (format "%s-%d" (car font-config) (car (last font-config))))))



(comrade-with-feature-package! :theme
			     doom-themes
			     :defer t)

(comrade-with-feature-package! :theme
			     badwolf-theme
			     :defer t)

(comrade-with-feature-package! :icons
			     all-the-icons)

(comrade-with-feature-package! :dired-icons
			     all-the-icons-dired
			     :straight (all-the-icons-dired :type git :host github :repo "jtbm37/all-the-icons-dired")
			     :init
			     (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(comrade-with-feature-eval! :theme
			  (setq custom-safe-themes t)
			  (load-theme (comrade-keyword-to-symbol (comrade-feature-get-argument :theme)) t))


(comrade-with-feature-package! :modeline
			     doom-modeline
			     :config (doom-modeline-mode 1))

(comrade-with-feature-package! :show-emojis
			     emojify
			     :config (emojify-mode 1))

(comrade-with-feature-eval! :font
			  (comrade-ui-use-font (comrade-feature-get-argument :font)))

(setq inhibit-splash-screen 0) ;; turn off emacs annoying startup page.
(tool-bar-mode 0) ;; turn off emacs GUI toolbar
(scroll-bar-mode 0) ;; turn off emacs GUI scrollbar
(menu-bar-mode 0) ;; turn emacs GUI menubar

(global-linum-mode t) ;; enable line numbers
(setq use-dialog-box nil)

(provide 'comrade-ui)
;;; comrade-ui.el ends here
