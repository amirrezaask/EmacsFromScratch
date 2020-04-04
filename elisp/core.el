;;; core.el --- core macros            -*- lexical-binding: t; -*-

;; Copyright (C) 2020  amirrezaask

;; Author: amirreza <amirrezaask@protonmail.com>


;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This programp is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:
(setq start-timestamp (float-time))
(defvar core/features '() "All variables of init Emacs.")
;; main macro of init to generate variables based on user input

(defmacro core/enable! (&rest attrs)
  "Enable given ATTRS."
  `(mapcar (lambda (attr)
	     (when (or (keywordp attr) (listp attr))
	       (add-to-list 'core/features attr)))
	   (quote ,attrs)))

(defun core/add-feature (feature)
  "Add given FEATURE to features list."
  (interactive "sFeature Name: ")
  (add-to-list 'core/features feature))

(defun core/keyword-to-symbol (keyword)
  "Convert KEYWORD to symbol."
  (intern (substring (symbol-name keyword) 1)))

(defun core/enable? (feature)
  "Check if given FEATURE is core/enable?d in init Emacs."
  (member feature core/features))

(defun core/feature-get-argument (feature)
  "Get given argument for given FEATURE."
  (let ((locator (cl-position feature core/features)))
    (nth (- locator 1) core/features)))

(defmacro core/if-feature-eval! (feature &rest body)
  "When given FEATURE core/enable?d evaluate BODY."
  `(when (core/enable? (intern ,(symbol-name feature)))
     ,@body))

(defmacro core/if-feature-use-package! (feature &rest args)
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
  `(when (core/enable? (intern ,(symbol-name feature)))
     ,use-package-list))

(defun core/bindkey-evil (map fn keys)
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

(defun core/bindkey-emacs (map fn keys)
  "Bind given FN to given KEYS on given MAP."
  (define-key map (kbd keys) fn))

(defmacro core/bindkey (map fn &rest keys)
  "Binds FN to KEYS on given MAP based on side you are on."
  (let ((evil-keys (plist-get keys :evil)) (holy-keys (plist-get keys :holy)))
    (cond
     ((core/enable? :evil) `(core/bindkey-evil ,map ,fn (quote ,evil-keys)))
     ((core/enable? :god) `(core/bindkey-emacs ,map ,fn ,holy-keys)))))

(defun core/require-all-elisp-files (path)
  "List of all elisp files in given PATH."
  (require 'seq)
  (mapcar (lambda (name)
	    (require (intern (car (split-string name "\\.")))))
	  (seq-filter (lambda (file) (string= (car (last (split-string file "\\."))) "el")) (directory-files path)) ))

(defun core/pkgmgr-configure ()
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
  (setq straight-use-package-by-default t)

  (straight-use-package 'use-package)

  (use-package gnu-elpa-keyring-update))

(defun core/optimize ()
  
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

  (setq package-core/enable?-at-startup nil)

  (setq read-process-output-max (* 1024 1024))

  (add-hook 'minibuffer-setup-hook #'defer-garbage-collection-h)
  (add-hook 'minibuffer-exit-hook #'restore-garbage-collection-h)

  (defvar --file-name-handler-alist file-name-handler-alist)
  (setq file-name-handler-alist nil)
  (add-hook 'emacs-startup-hook
	    (lambda ()
	      (setq file-name-handler-alist --file-name-handler-alist)))

  (setq initial-major-mode 'fundamental-mode))

(defun core/sync-PATH-with-os ()
  (use-package exec-path-from-shell :config (exec-path-from-shell-initialize)))

(defun core/load-user-config ()
  (load-file (expand-file-name ".emacs-features.el" (getenv "HOME"))))

(defun core/initialize ()
  (core/optimize)

  (core/pkgmgr-configure)

  (core/sync-PATH-with-os)

  (core/require-all-elisp-files (expand-file-name ".")))



(provide 'core)
