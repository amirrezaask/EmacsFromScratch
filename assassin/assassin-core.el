;;; assassin-core.el --- -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Amirreza Askarpour

;; Author: Amirreza Askarpour <amirrezaask@protonmail.com>
;; Keywords: 

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
(require 'cl)
(require 'keybindings/assassin-keybindings-core)

(defvar assassin-features '() "all variables of assassin emacs")
;; main macro of assassin to generate variables based on user input

(defmacro assassin (&rest attrs)
  "Define a new Assassin with given ATTRS."
  `(mapcar (lambda (attr)
	     (when (or (keywordp attr) (listp attr))
	       (add-to-list 'assassin-features attr)))

	   (quote ,attrs)))

(defun assassin-keyword-to-symbol (keyword)
  "Convert KEYWORD to symbol."
  (intern (substring (symbol-name keyword) 1)))

(defun assassin-enable? (feature)
  "checks if given feature is enabled in assassin emacs"
  (member feature assassin-features))

(defun assassin-feature-get-argument (feature)
  "Get given argument for given FEATURE"
  (let ((locator (cl-position feature assassin-features)))
    (nth (- locator 1) assassin-features)))

(defmacro assassin-feature (feature &rest body)
  "when given feature enabled evaluate body"
  `(when (assassin-enable? (intern ,(symbol-name feature)))
     ,@body)
  )


(defmacro assassin-feature2 (feature &rest body)
  "(assassin-feature2 go
		     :install go-mode
		     :before-load (setq go-mode-enable 1)
		     :after-load (setq go-mode-disable 1)
		     :bind (:evil (:normal "SPC c c") :god "C-c C-c c" :fn 'go-mode-compile)
		     )"
                    
  (let ((pkg-name (plist-get body :install))
	(before (plist-get body :before-load))
	(after (plist-get body :after-load))
	(bind (plist-get body :bind)))

    ))
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

(provide 'assassin-core)
