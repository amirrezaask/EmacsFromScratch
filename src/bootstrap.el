;;; boostrap.el --- boostrap Emacs         -*- lexical-binding: t; -*-

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

(defvar init-timestamp (float-time) "Emacs initialize timestamp.")
(defvar misc-path (expand-file-name ".misc" user-emacs-directory) "All misc files of various packages.")
(defvar src-dir (expand-file-name "src" user-emacs-directory))
(defvar modules-dir (expand-file-name "modules" src-dir))
(defvar user-config-path (expand-file-name "~/.user-config.el"))
(defvar amirreza/gc-cons-threshold 16777216)

(add-to-list 'load-path src-dir)

;; --- -----------------------------
;; disable gui shits
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(setq use-dialog-box nil)
(setq inhibit-splash-screen 0)
(setq ring-bell-function 'ignore)
(defalias 'yes-or-no-p 'y-or-n-p)
;; ------------------------------------

;; custom file
(setq custom-file (expand-file-name "custom.el" misc-path))

;; GC settings
;; ---------------------------------------------------------
;; Defer GC in startup
(setq gc-cons-threshold most-positive-fixnum)
gc-cons-percentage 0.6

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

;; Bootstrap package manager
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

(require 'use-package)

;; GC when emacs is idle
(use-package gcmh
  :config
  (setq gcmh-idle-delay 10)
  gcmh-high-cons-threshold amirreza/gc-cons-threshold
  gc-cons-percentage 0.1)

;; -----------------------------------------------------
;; Disable file-name-handler-alist
(defvar --file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)
(add-hook 'emacs-startup-hook
    (lambda ()
      (setq file-name-handler-alist --file-name-handler-alist)))

;; Start Emacs in fundamental
(setq initial-major-mode 'fundamental-mode)

;; Sync exec-path with Shell PATH var
(use-package exec-path-from-shell :config (exec-path-from-shell-initialize))

(defun amirreza/all-el-files (path)
  (directory-files path nil "\\.el$"))

;; modules loader
(defun amirreza/require-directory (path)
  (add-to-list 'load-path path)
  (let ((files (amirreza/all-el-files path)))
    (mapcar (lambda (file)
	    (let ((module-name (intern(car (split-string file "\\.")))))
	      (message "%s OK" module-name)
	      (require module-name))) files)))

(byte-recompile-directory modules-dir 0)


(defun amirreza/load-user-config (path))
  ;;(load-file path))

;; load user configuration
(amirreza/load-user-config user-config-path)

;; load modules
(amirreza/require-directory modules-dir)

(message "Startup took %s" (- (float-time) init-timestamp))
(provide 'boostrap)
;;; boostrap.el ends here
