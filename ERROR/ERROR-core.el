(require 'cl)
(require 'keybindings/ERROR-keybindings-core)

(defvar ERROR-features '() "All variables of ERROR Emacs.")
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
  "Check if given FEATURE is enabled in ERROR Emacs."
  (member feature ERROR-features))

(defun ERROR-feature-get-argument (feature)
  "Get given argument for given FEATURE."
  (let ((locator (cl-position feature ERROR-features)))
    (nth (- locator 1) ERROR-features)))

(defmacro ERROR-feature! (feature &rest body)
  "When given FEATURE enabled evaluate BODY."
  `(when (ERROR-enable? (intern ,(symbol-name feature)))
     ,@body))

(defmacro ERROR-defkeychord! (args)
  "An adapter to use bindkey macro for all given ARGS."
  `(mapcar (lambda (arg)
	    (let ((evil (plist-get arg :evil ))
		  (god (plist-get arg :god))
		  (fn (plist-get arg :fn))
		  (keymap (plist-get arg :keymap)))
	      (bindkey keymap fn :evil evil :holy god)
	      )) (quote ,args)))

(defun ERROR-debug (&rest args)
  "Print all given ARGS for debugging."
  (mapcar (lambda (arg)
	     (message "ERROR-DEBUG => %s" arg))
	   args))

(defmacro ERROR-feature2 (feature &rest args)
  "All given ARGS will get passed to use-package so take a look at use-package documetation.
(ERROR-feature2 :k8s
		kubel
		:config
		(bindkey global-map 'kubel :evil (:normal \"SPC k k\") :holy \"C-c C-a\"))"
                    
  (setq use-package-list '())
  (setq args (reverse args))
  (mapcar (lambda (elm) (add-to-list 'use-package-list elm)) args)
  (add-to-list 'use-package-list 'use-package)
  `(when (ERROR-enable? (intern ,(symbol-name feature)))
     ,use-package-list)
     )

(provide 'ERROR-core)
