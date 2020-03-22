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

(defun ERROR-bindkey-adapter (args)
  "An adapter to use bindkey macro for all given ARGS."
  (mapcar (lambda (arg)
	    (let ((evil (plist-get :evil args))
		  (god (plist-get :god args))
		  (fn (plist-get :fn args))
		  (keymap (plist-get :map args)))
	      (bindkey keymap fn :evil evil :god god)
	      )) args))


(defun ERROR-debug (&rest args)
  "Print all given ARGS for debugging."
  (mapcar (lambda (arg)
	     (message "ERROR-DEBUG => %s" arg))
	   args))

(defmacro ERROR-feature2 (feature &rest body)
  "(ERROR-feature2 go
		     :install go-mode
		     :before-load (setq go-mode-enable 1)
		     :after-load (setq go-mode-disable 1)
		     :binds ((:map global :evil (:normal \"SPC c c\") :god \"C-c C-c c\" :fn 'go-mode-compile))
		     )"
                    
  (let ((pkg-name (plist-get body :install))
	(before (plist-get body :before-load))
	(after (plist-get body :after-load))
	(binds (plist-get body :binds)))


    (add-to-list 'before 'progn)
    (add-to-list 'after 'progn)
    `(progn
 ;;      (when (not (null ,binds)) (ERROR-bindkey-adapter ,binds))
       (use-package ,pkg-name :init ,before :config ,after :bind ("C-c C-k" . kubel))
       )
    ))

;; (ERROR-feature2 k8s
;; 		:install kubel
;; 		:before-load ((message "BEFORE LOADING KUBEL"))
;; 		:after-load ((message "AFTER LOADING KUBEL"))
;; 		:binds ((:evil (:normal "SPC x x") :god "C-x C-k" :fn kubel))
;; 		)


(provide 'ERROR-core)
