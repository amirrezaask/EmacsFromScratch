(ERROR-feature! :ivy
	       swiper
	       :commands (swiper)
	       :init
	       (bindkey global-map 'swiper :evil (:normal "SPC s s") :holy "C-s"))

(ERROR-feature! :ivy
		counsel
		:commands (counsel-M-x counsel-find-file ivy-switch-buffer)
		:init
		(bindkey global-map 'counsel-M-x :evil (:normal "SPC SPC") :holy "M-x")
		(bindkey global-map 'counsel-find-file :evil (:normal "SPC f f") :holy "C-x C-f")
		(bindkey global-map 'ivy-switch-buffer :evil (:normal "SPC b l") :holy "C-x b"))


(ERROR-feature! :helm
	        helm
		:init (setq helm-buffers-fuzzy-matching t
			    helm-recentf-fuzzy-match t)
		:bind* (:map helm-map
			     ("TAB" . #'helm-execute-persistent-action)
			     ("<tab>" . #'helm-execute-persistent-action)
			     ("C-z". #'helm-select-action))
		:config
		(helm-mode 1)
		(bindkey global-map 'helm-find-files :evil (:normal "SPC f f") :holy "C-x C-f")
		(bindkey global-map 'helm-M-x :evil (:normal "SPC SPC") :holy "M-x")
		(bindkey global-map 'helm-recentf :evil (:normal "SPC f r") :holy "C-x C-r")
		(bindkey global-map 'helm-mini :evil (:normal "SPC b l") :holy "C-x b")
		(bindkey global-map 'helm-mini :holy "C-x C-b"))


(ERROR-feature! :ido
	       ido-vertical-mode
			    :config
			    (ido-mode 1)
			    (ido-everywhere 1)
			    (ido-vertical-mode 1)
			    (setq ido-vertical-define-keys 'C-n-and-C-p-only))
(ERROR-feature! :ido
		smex
		:commands
		(smex)
		:init
		(bindkey global-map 'smex :evil (:normal "SPC SPC") :holy "M-x"))




(ERROR-feature! :whitespace-mode
	        whitespace
		:hook
		((prog-mode text-mode) . whitespace-mode)
		:init
		(setq whitespace-style (quote (face spaces tabs newline space-mark tab-mark newline-mark )))
		(setq whitespace-display-mappings
		      '(
			(space-mark 32 [183] [46])
			(newline-mark 10 [182 10])
			(tab-mark 9 [9655 9] [92 9])
			)))

(ERROR-feature! :insert-headers
	       autoinsert
	       :init
	       (setq auto-insert-query nil)
	       (auto-insert-mode 1))

(ERROR-feature! :dashboard
		dashboard
		:init
		(setq dashboard-startup-banner 'logo)
		(setq dashboard-center-content t)
		(setq dashboard-banner-longo-title "Requiescat in pace")
		(setq dashboard-items '())
		:config
		(dashboard-setup-startup-hook))

(setq custom-file "~/.__custom.el")
(setq make-backup-files nil) ;; turn off emacs annoying ~ files
(setq create-lockfiles nil) ;; turn off emacs annoying # files
(setq ring-bell-function 'ignore)
(defalias 'yes-or-no-p 'y-or-n-p) ;; instead of yes-or-no ask y-or-no, only for convinience
(provide 'ERROR-editor)
;;; ERROR-editor.el ends here
