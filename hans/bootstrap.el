;; -*- no-byte-compile: t; -*-
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

;;================================================================================
;;                                Hans basic Vars
;;================================================================================

(defvar init-timestamp (float-time) "Emacs initialize timestamp.")
(defvar misc-path (expand-file-name ".misc" user-emacs-directory) "All misc files of various packages.")
(defvar core-dir (expand-file-name "hans" user-emacs-directory))
(defvar modules-dir (expand-file-name "modules" core-dir))
(defvar user-config-path (expand-file-name "~/.emacs.d/hans-config.el"))
(defvar hans/gc-cons-threshold 16777216)
(defvar hans/init-time nil)

(add-to-list 'load-path core-dir)
;;================================================================================
;;                                 Load Hans Core
;;================================================================================
(require 'core)
(hans/core-package-manager-init)
(hans/core-fast-startup)
(hans/core-better-gc)
(idle! (hans/core-sync-path))

;;================================================================================
;;                            Load user configuration
;;================================================================================
(hans/core-load-user-config user-config-path)

;;================================================================================
;;                                  Load Modules
;;================================================================================
(hans/core-require-directory 'modules modules-dir)
(setq hans/init-time (- (float-time) init-timestamp))

(message "Startup took %s" hans/init-time)
(provide 'boostrap)
;;; boostrap.el ends here
