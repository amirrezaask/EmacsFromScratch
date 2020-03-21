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

(defvar assassin-vars '() "all variables of assassin emacs")
;; main macro of assassin to generate variables based on user input
(defmacro assassin (&rest attrs)
  "Macro to define a new Assassin with given ATTRS."
  (let ((side (plist-get attrs :side))
	(editor (plist-get attrs :editor))
	(dev (plist-get attrs :dev))
	(completion (plist-get attrs :completion))
	(ui (plist-get attrs :ui))
	(devops (plist-get attrs :devops))
	(langs (plist-get attrs :langs))
	(comms (plist-get attrs :comms))
	)
    (setq final-list '())
    (if (not (null side)) (add-to-list 'final-list `(add-to-list 'assassin-vars ,side)))
    (if (not (null editor)) (add-to-list 'final-list `(add-to-list 'assassin-vars ,editor)))
    (if (not (null dev)) (add-to-list 'final-list `(add-to-list 'assassin-vars ,dev)))
    (if (not (null completion)) (add-to-list 'final-list `(add-to-list 'assassin-vars ,completion)))
    (if (not (null ui)) (add-to-list 'final-list `(add-to-list 'assassin-vars ,ui)))
    (if (not (null devops)) (add-to-list 'final-list `(add-to-list 'assassin-vars ,devops)))
    (if (not (null langs)) (add-to-list 'final-list `(add-to-list 'assassin-vars ,langs)))
    (if (not (null comms)) (add-to-list 'final-list `(add-to-list 'assassin-vars ,comms)))
    (add-to-list 'final-list `progn)
    final-list))

(defun assassin-enable? (name)
  "checks if given name is enabled in assassin emacs"
  (member name 'assassin-vars))

(defmacro assassin-when (name body))

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


(provide 'assassin-core)
