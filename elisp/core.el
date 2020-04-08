;;; core.el --- core element                         -*- lexical-binding: t; -*-

;; Copyright (C) 2020  amirrezaask

;; Author: amirrezaask <raskarpour@gmail.com>

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
;; ----------------------- VARS --------------------------------------------------

;; custom file
(setq custom-file (expand-file-name "custom.el" misc-path))

(defun core/package-manager-init ()
  (setq package-enable-at-startup nil)
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
  (require 'use-package))

(defmacro idle! (&rest body)
  `(run-with-idle-timer 1 nil (lambda ()
				,@body)))

(defun core/fast-startup ()
  (setq frame-inhibit-implied-resize t)
  (setq gc-cons-threshold most-positive-fixnum)
  (setq gc-cons-percentage 0.6)

  (add-hook 'emacs-startup-hook
	    (lambda ()
	      (setq gc-cons-threshold amirreza/gc-cons-threshold)
	      gc-cons-percentage 0.1))

  (defun defer-garbage-collection-h ()
    (setq gc-cons-threshold most-positive-fixnum))

  (defun restore-garbage-collection-h ()
    (run-at-time
     1 nil (lambda () (setq gc-cons-threshold amirreza/gc-cons-threshold))))

  (add-hook 'minibuffer-setup-hook #'defer-garbage-collection-h)
  (add-hook 'minibuffer-exit-hook #'restore-garbage-collection-h)
  (defvar --file-name-handler-alist file-name-handler-alist)
  (setq file-name-handler-alist nil)
  (add-hook 'emacs-startup-hook
	    (lambda ()
	      (setq file-name-handler-alist --file-name-handler-alist)))
  (setq initial-major-mode 'fundamental-mode))

(defun core/sync-path ()
  (use-package exec-path-from-shell :config (exec-path-from-shell-initialize)))

(defun amirreza/all-el-files (path)
  (directory-files path nil "\\.el$"))



;; modules loader
(defun amirreza/require-directory (path)
  (add-to-list 'load-path path)
  (let ((files (amirreza/all-el-files path)))
    (mapcar (lambda (file)
	      (let ((module-name (intern(car (split-string file "\\.")))) (module-timestamp (float-time)))
		(require module-name)
		(message "Loading %s" module-name))) files)))

(defun core/better-gc ()
  (idle! (use-package gcmh
   :config
   (setq gcmh-idle-delay 10
	 gcmh-high-cons-threshold amirreza/gc-cons-threshold
	 gc-cons-percentage 0.1))))


(defun amirreza/compile-dir (dir)
  (interactive)
  (byte-recompile-directory dir 0))

(defun amirreza/load-user-config (path))



(provide 'core)
;;; core.el ends here
