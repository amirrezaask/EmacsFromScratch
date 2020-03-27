(defconst lisp--prettify-symbols-alist
  '(("lambda"  . ?λ))) ;; shows lambda word as the symbol
(global-prettify-symbols-mode 1)

(defun ERROR-ui-use-font (font-config)
  "use given FONT with given SIZE"
  (interactive)
  (add-to-list 'default-frame-alist (cons 'font (format "%s-%d" (car font-config) (car (last font-config))))))



(ERROR-with-feature-package! :theme
			     doom-themes
			     :defer t)

(ERROR-with-feature-package! :theme
			     badwolf-theme
			     :defer t)

(ERROR-with-feature-package! :icons
			     all-the-icons)

(ERROR-with-feature-package! :dired-icons
			     all-the-icons-dired
			     :straight (all-the-icons-dired :type git :host github :repo "jtbm37/all-the-icons-dired")
			     :init
			     (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(ERROR-with-feature-eval! :theme
			  (setq custom-safe-themes t)
			  (load-theme (ERROR-keyword-to-symbol (ERROR-feature-get-argument :theme)) t))


(ERROR-with-feature-package! :modeline
			     doom-modeline
			     :config (doom-modeline-mode 1))

(ERROR-with-feature-package! :show-emojis
			     emojify
			     :config (emojify-mode 1))

(ERROR-with-feature-eval! :font
			  (ERROR-ui-use-font (ERROR-feature-get-argument :font)))

(setq inhibit-splash-screen 0) ;; turn off emacs annoying startup page.
(tool-bar-mode 0) ;; turn off emacs GUI toolbar
(scroll-bar-mode 0) ;; turn off emacs GUI scrollbar
(menu-bar-mode 0) ;; turn emacs GUI menubar

(global-linum-mode t) ;; enable line numbers
(setq use-dialog-box nil)

(provide 'ERROR-ui)
;;; ERROR-ui.el ends here
