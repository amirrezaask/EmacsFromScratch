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
    (if (not (null side)) (add-to-list 'final-list `(setq assassin--side ,side)))
    (if (not (null editor)) (add-to-list 'final-list `(setq assassin--editor (quote ,editor))))
    (if (not (null dev)) (add-to-list 'final-list `(setq assassin--dev (quote ,dev))))
    (if (not (null completion)) (add-to-list 'final-list `(setq assassin--completion (quote ,completion))))
    (if (not (null ui)) (add-to-list 'final-list `(setq assassin--ui (quote ,ui))))
    (if (not (null devops)) (add-to-list 'final-list `(setq assassin--devops (quote ,devops))))
    (if (not (null langs)) (add-to-list 'final-list `(setq assassin--langs (quote ,langs))))
    (if (not (null comms)) (add-to-list 'final-list `(setq assassin--comms (quote ,comms))))
    (add-to-list 'final-list `progn)
    final-list))

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
