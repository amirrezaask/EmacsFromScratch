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

;; Load UI now 

(defvar init-timestamp (float-time) "Emacs initialize timestamp.")
(defvar misc-path (expand-file-name ".misc" user-emacs-directory) "All misc files of various packages.")
(defvar elisp-dir (expand-file-name "elisp" user-emacs-directory))
(defvar modules-dir (expand-file-name "modules" elisp-dir))
(defvar user-config-path (expand-file-name "~/.user-config.el"))
(defvar amirreza/gc-cons-threshold 16777216)
(defvar amirreza/init-time nil)
(add-to-list 'load-path elisp-dir)

(require 'core)
(core/package-manager-init)
(core/fast-startup)
(core/better-gc)
(idle! (core/sync-path))
(amirreza/compile-dir elisp-dir)


(require 'ui)

;; load modules
(amirreza/require-directory modules-dir)
(setq amirreza/init-time (- (float-time) init-timestamp))

(message "Startup took %s" amirreza/init-time)
(provide 'boostrap)
;;; boostrap.el ends here
