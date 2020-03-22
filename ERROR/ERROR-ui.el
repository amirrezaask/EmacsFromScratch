(defconst lisp--prettify-symbols-alist
  '(("lambda"  . ?λ))) ;; shows lambda word as the symbol
(global-prettify-symbols-mode 1)

(defun ERROR-ui-use-font (font-config)
  "use given FONT with given SIZE"
  (interactive)
  (add-to-list 'default-frame-alist (cons 'font (format "%s-%d" (car font-config) (car (last font-config))))))

(ERROR-feature! :theme
	       (setq custom-safe-themes t)
	       (use-package doom-themes :defer t)
	       (use-package badwolf-theme :defer t)
	       (load-theme (ERROR-keyword-to-symbol (ERROR-feature-get-argument :theme)) t))


(ERROR-feature! :modeline
		  (use-package doom-modeline :config (doom-modeline-mode 1)))

(ERROR-feature! :show-emojis
		  (use-package emojify :config (emojify-mode 1)))

(ERROR-feature! :font
		  (ERROR-ui-use-font (ERROR-feature-get-argument :font)))

(setq inhibit-splash-screen 0) ;; turn off emacs annoying startup page.
(tool-bar-mode 0) ;; turn off emacs GUI toolbar
(scroll-bar-mode 0) ;; turn off emacs GUI scrollbar
(menu-bar-mode 0) ;; turn emacs GUI menubar

(global-linum-mode t) ;; enable line numbers
(setq use-dialog-box nil)

(provide 'ERROR-ui)
;;; ERROR-ui.el ends here
