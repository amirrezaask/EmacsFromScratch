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
(defvar hans/init-timestamp (float-time) "Emacs initialize timestamp.")
(defvar hans/misc-path (expand-file-name ".misc" user-emacs-directory) "All misc files of various packages.")
(defvar hans/root-path (expand-file-name "hans" user-emacs-directory))
(defvar hans/pkgs-path (expand-file-name "pkgs" hans/root-path))
(defvar hans/config-path (expand-file-name "~/.config/hans/config.el"))
(defvar hans/gc-cons-threshold 16777216)
(defvar hans/init-time-elapsed nil)

;;================================================================================
;;                                 Add hans to load path
;;================================================================================

(add-to-list 'load-path hans/root-path)
(add-to-list 'load-path hans/pkgs-path)
;;================================================================================
;;                                 Load Hans Core
;;================================================================================
(require 'pkgmgr)
(local-use-package hans-core
		   :config
		   (require 'hans-core);; we need to figure out a way to get ride of this
		   (hans/core-fast-startup)
		   (hans/core-better-gc)
		   (idle! (hans/core-sync-path)))

;;================================================================================
;;                            Load user configuration
;;================================================================================
(hans/core-load-user-config hans/config-path)

(setq hans/init-time-elapsed (- (float-time) hans/init-timestamp))

(message "Startup took %s" hans/init-time-elapsed)
(provide 'boostrap)
;;; boostrap.el ends here
