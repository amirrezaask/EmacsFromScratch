;;; init.el --- entry point for assassins Emacs distribution  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Amirreza Askarpour

;; Author: Amirreza Askarpour <amirrezaask@protonmail.com>

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
;; .
;; ─────────────────█─────────────────
;; ────────────────███────────────────
;; ───────────────█████───────────────
;; ───────────────█████───────────────
;; ──────────────██─████──────────────
;; ──────────────██──███──────────────
;; ─────────────███──████─────────────
;; ─────────────██────███─────────────
;; ────────────███────████────────────
;; ────────────██──────████───────────
;; ───────────███──────████───────────
;; ───────────██────────████──────────
;; ──────────███────────████──────────
;; ──────────██──────────████─────────
;; ─────────███──────────████─────────
;; ─────────██────────────████────────
;; ────────███─────────────███────────
;; ───────████─────────────████───────
;; ▄───▄▄████───────────────█████────▄
;; ▀█████████───────────────█████████▀
;; ──███████─────────────────███████──
;; ───██████─────────────────██████───
;; ───█████───────────────────█████───
;; ───█████───────────────────█████───
;; ──█████─────────────────────█████──
;; ▄██████─────────────────────██████▄
;; ▀──▀███─────────────────────███▀──▀
;; ────▀███▄─────────────────▄███▀────
;; ▀▄─────▀██▄▄───────────▄▄██▀─────▄▀
;; ──▀▄─────▀▀██▄▄──▄──▄▄██▀▀─────▄▀──
;; ────█▄──────────▄█▄──────────▄█────
;; ─────▀██▄──────▄███▄──────▄▄█▀─────
;; ───────▀███▄▄▄███████▄▄▄███▀───────
;; ──────────▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀──────────

;; 

;;; Code:
(setq debug-on-error t)

;; some initial emacs internals setup
(setq gc-cons-threshold most-positive-fixnum ; 2^61 bytes
      gc-cons-percentage 0.6)
(add-hook 'emacs-startup-hook
  (lambda ()
    (setq gc-cons-threshold 16777216 ; 16mb
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

(setq custom-file "~/.__custom.el")
(setq inhibit-splash-screen 0) ;; turn off emacs annoying startup page.
(setq make-backup-files nil) ;; turn off emacs annoying ~ files
(setq create-lockfiles nil) ;; turn off emacs annoying # files
(setq ring-bell-function 'ignore)
(tool-bar-mode 0) ;; turn off emacs GUI toolbar
(scroll-bar-mode 0) ;; turn off emacs GUI scrollbar
(menu-bar-mode 0) ;; turn emacs GUI menubar
(defalias 'yes-or-no-p 'y-or-n-p) ;; instead of yes-or-no ask y-or-no, only for convinience
(global-linum-mode t) ;; enable line numbers
(setq use-dialog-box nil)

;; Loading assassin files
(add-to-list 'load-path (expand-file-name "assassin" user-emacs-directory))
(require 'seq)
(defun require-all-elisp-files (path)
  "List of all elisp files in given PATH."
  (mapcar (lambda (name)
	    (require (intern (car (split-string name "\\.")))))
	  (seq-filter (lambda (file) (string= (car (last (split-string file "\\."))) "el")) (directory-files path)) ))

(require 'assassin-core)

;; load user configuration
(load-file (expand-file-name ".assassin.el" (getenv "HOME")))
;; initialize Assassin Emacs based on user config
(require-all-elisp-files (concat user-emacs-directory "assassin"))

(provide 'init)
;;; init.el ends here
 
