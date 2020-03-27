(defvar init-features '() "All variables of init Emacs.")
;; main macro of init to generate variables based on user input

(defmacro init! (&rest attrs)
  "Define a new Assassin with given ATTRS."
  `(mapcar (lambda (attr)
	     (when (or (keywordp attr) (listp attr))
	       (add-to-list 'init-features attr)))
	   (quote ,attrs)))

(defun init-keyword-to-symbol (keyword)
  "Convert KEYWORD to symbol."
  (intern (substring (symbol-name keyword) 1)))

(defun init-enable? (feature)
  "Check if given FEATURE is enabled in init Emacs."
  (member feature init-features))

(defun init-feature-get-argument (feature)
  "Get given argument for given FEATURE."
  (let ((locator (cl-position feature init-features)))
    (nth (- locator 1) init-features)))

(defun init-debug (&rest args)
  "Print all given ARGS for debugging."
  (mapcar (lambda (arg)
	     (message "init-DEBUG => %s" arg))
	   args))

(defmacro init-with-feature-eval! (feature &rest body)
  "When given FEATURE enabled evaluate BODY."
  `(when (init-enable? (intern ,(symbol-name feature)))
     ,@body))

(defmacro init-with-feature-package! (feature &rest args)
  "Check if given FEATURE is enbaled and\
then pass All given ARGS to use-package.
\(init-feature2 :k8s
		kubel
		:config
		\(bindkey `global-map` \\<function> :evil (:normal \\<keymap>) :holy \\<keymap>))"
                    
  (setq use-package-list '())
  (setq args (reverse args))
  (mapcar (lambda (elm) (add-to-list 'use-package-list elm)) args)
  (add-to-list 'use-package-list 'use-package)
  `(when (init-enable? (intern ,(symbol-name feature)))
     ,use-package-list)
  )


(provide 'init-core)
