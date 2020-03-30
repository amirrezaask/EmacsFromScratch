(init-with-feature-package! :ivy
			     swiper
			     :commands (swiper)
			     :init
			     (bindkey global-map 'swiper :evil (:normal "SPC s s") :holy "C-s"))

(init-with-feature-package! :ivy
			     counsel
			     :commands (counsel-M-x counsel-find-file ivy-switch-buffer)
			     :init
			     (bindkey global-map 'counsel-M-x :evil (:normal "SPC SPC") :holy "M-x")
			     (bindkey global-map 'counsel-find-file :evil (:normal "SPC f f") :holy "C-x C-f")
			     (bindkey global-map 'counsel-descbinds :evil (:normal "SPC h d b") :holy "C-h b")
			     (bindkey global-map 'counsel-describe-function :evil (:normal "SPC h d f") :holy "C-h f")
			     (bindkey global-map 'counsel-describe-variable :evil (:normal "SPC h d v") :holy "C-h v")
			     (bindkey global-map 'counsel-aprops :evil (:normal "SPC h d a") :holy "C-h a")
			     (bindkey global-map 'counsel-yank-pop :evil (:normal "SPC y p") :holy "M-y")
			     (bindkey global-map 'counsel-ag :evil (:normal "SPC s g") :holy "C-x C-a")
			     (bindkey global-map 'ivy-switch-buffer :evil (:normal "SPC b l") :holy "C-x b")
			     (bindkey global-map 'ivy-switch-buffer :holy "C-x C-b"))


(init-with-feature-package! :helm
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

(init-with-feature-eval! :ido
			 (ido-mode 1)
			 (ido-everywhere 1)
			 (setq ido-enable-flex-matching t))

(init-with-feature-package! :ido
			    ido-completing-read+
			    :config
			    (ido-ubiquitous-mode 1)
			    (local-unset-key (kbd "C-x C-f"))
			    (local-set-key (kbd "C-x C-t") 'ido-fallback-command))

(init-with-feature-package! :ido
			     ido-vertical-mode
			     :config
			     ;; (ido-vertical-mode 1) 
			     (setq ido-vertical-define-keys 'C-n-and-C-p-only))

;; (init-with-feature-package! :ido
;; 			     smex
;; 			     :commands
;; 			     (smex)
;; 			     :init
;; 			     (bindkey global-map 'smex :evil (:normal "SPC SPC") :holy "M-x"))


(init-with-feature-package! :neotree
			     neotree
			     :init
			     (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
			     (bindkey global-map 'neotree-toggle :holy "<f8>")
			     :commands (neotree neotree-toggle)
			     )

(init-with-feature-package! :whitespace-mode
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

(init-with-feature-package! :insert-headers
			     autoinsert
			     :init
			     (setq auto-insert-query nil)
			     (auto-insert-mode 1))

(setq custom-file "~/.__custom.el")
(setq make-backup-files nil) ;; turn off emacs annoying ~ files
(setq create-lockfiles nil) ;; turn off emacs annoying # files
(setq ring-bell-function 'ignore)
(defalias 'yes-or-no-p 'y-or-n-p) ;; instead of yes-or-no ask y-or-no, only for convinience
(provide 'init-editor)
;;; init-editor.el ends here
