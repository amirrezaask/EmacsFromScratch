(defvar comrade-features '() "All variables of comrade Emacs.")
;; main macro of comrade to generate variables based on user input

(defmacro comrade! (&rest attrs)
  "Define a new Assassin with given ATTRS."
  `(mapcar (lambda (attr)
	     (when (or (keywordp attr) (listp attr))
	       (add-to-list 'comrade-features attr)))
	   (quote ,attrs)))

(defun comrade-keyword-to-symbol (keyword)
  "Convert KEYWORD to symbol."
  (intern (substring (symbol-name keyword) 1)))

(defun comrade-enable? (feature)
  "Check if given FEATURE is enabled in comrade Emacs."
  (member feature comrade-features))

(defun comrade-feature-get-argument (feature)
  "Get given argument for given FEATURE."
  (let ((locator (cl-position feature comrade-features)))
    (nth (- locator 1) comrade-features)))

(defun comrade-debug (&rest args)
  "Print all given ARGS for debugging."
  (mapcar (lambda (arg)
	     (message "comrade-DEBUG => %s" arg))
	   args))

(defmacro comrade-with-feature-eval! (feature &rest body)
  "When given FEATURE enabled evaluate BODY."
  `(when (comrade-enable? (intern ,(symbol-name feature)))
     ,@body))

(defmacro comrade-with-feature-package! (feature &rest args)
  "Check if given FEATURE is enbaled and\
then pass All given ARGS to use-package.
\(comrade-feature2 :k8s
		kubel
		:config
		\(bindkey `global-map` \\<function> :evil (:normal \\<keymap>) :holy \\<keymap>))"
                    
  (setq use-package-list '())
  (setq args (reverse args))
  (mapcar (lambda (elm) (add-to-list 'use-package-list elm)) args)
  (add-to-list 'use-package-list 'use-package)
  `(when (comrade-enable? (intern ,(symbol-name feature)))
     ,use-package-list)
  )


(provide 'comrade-core)
