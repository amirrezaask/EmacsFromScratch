(defun -bindkey-evil (map fn keys)
  "Bind given FN to given KEYS on given MAP."
  (let ((normal-key (plist-get keys :normal))
	(visual-key (plist-get keys :visual))
	(insert-key (plist-get keys :insert))
	(emacs-key (plist-get keys :emacs)))
    (cond
     ((not (null normal-key)) (evil-define-key 'normal map (kbd normal-key) fn))
     ((not (null visual-key)) (evil-define-key 'visual map (kbd visual-key) fn))
     ((not (null insert-key)) (evil-define-key 'insert map (kbd insert-key) fn))
     ((not (null emacs-key)) (evil-define-key 'emacs map (kbd emacs-key) fn)))))

(defun -bindkey-holy (map fn keys)
  "Bind given FN to given KEYS on given MAP."
  (define-key map (kbd keys) fn))

(defmacro bindkey (map fn &rest keys)
  "Binds FN to KEYS on given MAP based on side you are on."
  (let ((evil-keys (plist-get keys :evil)) (holy-keys (plist-get keys :holy)))
    (cond
     ((eq side 'evil) `(-bindkey-evil ,map ,fn (quote ,evil-keys)))
     ((eq side 'holy) `(-bindkey-holy ,map ,fn ,holy-keys))
     )
    ))

(assassin-when which-key
	       (use-package which-key  :init (setq echo-keystrokes 0.3) :config (which-key-mode 1)))




(provide 'keybindings/assassin-keybindings-core)
