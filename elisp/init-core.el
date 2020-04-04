;;; init-core.el --- core macros            -*- lexical-binding: t; -*-

;; Copyright (C) 2020  amirrezaask

;; Author: amirreza <amirrezaask@protonmail.com>


;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(defvar --features '() "All variables of init Emacs.")
;; main macro of init to generate variables based on user input

(defmacro enable! (&rest attrs)
  "Enable given ATTRS."
  `(mapcar (lambda (attr)
	     (when (or (keywordp attr) (listp attr))
	       (add-to-list '--features attr)))
	   (quote ,attrs)))

(defun add-feature (feature)
  "Add given FEATURE to features list."
  (interactive "sFeature Name: ")
  (add-to-list '--features feature))

(defun init-keyword-to-symbol (keyword)
  "Convert KEYWORD to symbol."
  (intern (substring (symbol-name keyword) 1)))

(defun init-enable? (feature)
  "Check if given FEATURE is enabled in init Emacs."
  (member feature --features))

(defun init-feature-get-argument (feature)
  "Get given argument for given FEATURE."
  (let ((locator (cl-position feature --features)))
    (nth (- locator 1) --features)))

(defmacro if-feature-eval! (feature &rest body)
  "When given FEATURE enabled evaluate BODY."
  `(when (init-enable? (intern ,(symbol-name feature)))
     ,@body))

(defmacro if-feature-use-package! (feature &rest args)
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
     ,use-package-list))

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
     ((init-enable? :evil) `(-bindkey-evil ,map ,fn (quote ,evil-keys)))
     ((init-enable? :god) `(-bindkey-holy ,map ,fn ,holy-keys)))))



(provide 'init-core)
