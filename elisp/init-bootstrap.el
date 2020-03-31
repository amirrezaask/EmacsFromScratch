(setq start-timestamp (float-time))

(setq gc-cons-threshold most-positive-fixnum ; 2^61 bytes
      gc-cons-percentage 0.6)
(add-hook 'emacs-startup-hook
  (lambda ()
    (setq gc-cons-threshold 100000000 ; 16mb
          gc-cons-percentage 0.1)))

(defun defer-garbage-collection-h ()
  (setq gc-cons-threshold 16777216))


(defun restore-garbage-collection-h ()
  (run-at-time
   1 nil (lambda () (setq gc-cons-threshold most-positive-fixnum))))

(setq package-enable-at-startup nil)

(add-hook 'minibuffer-setup-hook #'defer-garbage-collection-h)
(add-hook 'minibuffer-exit-hook #'restore-garbage-collection-h)

(defvar --file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
(add-hook 'emacs-startup-hook
  (lambda ()
    (setq file-name-handler-alist --file-name-handler-alist)))

(setq initial-major-mode 'fundamental-mode)

(require 'seq)
(defun require-all-elisp-files (path)
  "List of all elisp files in given PATH."
  (mapcar (lambda (name)
	    (require (intern (car (split-string name "\\.")))))
	  (seq-filter (lambda (file) (string= (car (last (split-string file "\\."))) "el")) (directory-files path)) ))


;; Install bootstrap package manager
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
;; always use straight for packages
(setq straight-use-package-by-default t)

;; Install use-package
(straight-use-package 'use-package)
(use-package gnu-elpa-keyring-update)

;; load init Emacs core module
(require 'init-features)
;; load user config
(load-file (expand-file-name ".emacs-config.el" (getenv "HOME")))
;; copy os envs
;; (use-package exec-path-from-shell :config (exec-path-from-shell-initialize))

;; load init Emacs modules
(require 'init-keybindings)
(require 'init-ui)
(require 'init-editor)
(require 'init-ide)
(require 'init-langs)
(require 'init-devops)

(provide 'init-bootstrap)

