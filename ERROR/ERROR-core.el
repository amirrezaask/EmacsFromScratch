(require 'cl)
(require 'keybindings/ERROR-keybindings-core)

(defvar ERROR-features '() "all variables of ERROR emacs")
;; main macro of ERROR to generate variables based on user input

(defmacro ERROR! (&rest attrs)
  "Define a new Assassin with given ATTRS."
  `(mapcar (lambda (attr)
	     (when (or (keywordp attr) (listp attr))
	       (add-to-list 'ERROR-features attr)))

	   (quote ,attrs)))

(defun ERROR-keyword-to-symbol (keyword)
  "Convert KEYWORD to symbol."
  (intern (substring (symbol-name keyword) 1)))

(defun ERROR-enable? (feature)
  "checks if given feature is enabled in ERROR emacs"
  (member feature ERROR-features))

(defun ERROR-feature-get-argument (feature)
  "Get given argument for given FEATURE"
  (let ((locator (cl-position feature ERROR-features)))
    (nth (- locator 1) ERROR-features)))

(defmacro ERROR-feature! (feature &rest body)
  "when given feature enabled evaluate body"
  `(when (ERROR-enable? (intern ,(symbol-name feature)))
     ,@body)
  )


(defmacro ERROR-feature2 (feature &rest body)
  "(ERROR-feature2 go
		     :install go-mode
		     :before-load (setq go-mode-enable 1)
		     :after-load (setq go-mode-disable 1)
		     :bind (:evil (:normal \"SPC c c\") :god \"C-c C-c c\" :fn 'go-mode-compile)
		     )"
                    
  (let ((pkg-name (plist-get body :install))
	(before (plist-get body :before-load))
	(after (plist-get body :after-load))
	(bind (plist-get body :bind)))
    (add-to-list 'bind 'bindkey)
    `(progn
       (use-package ,pkg-name
       :init ,before
       :config ,after
       )
       ,bind)
    ))



(provide 'ERROR-core)
