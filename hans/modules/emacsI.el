;;; emacsI.el --- Emacs Improved module              -*- lexical-binding: t; -*-

;; Copyright (C) 2020  amirreza

;; Author: amirreza <amirreza@nobody.invalid>
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


;; 

;;; Code:

(defvar emacs-backup-directory (expand-file-name ".backups" user-emacs-directory))

(use-package ibuffer
  :bind (("C-x C-b" . 'ibuffer)))

(use-package ibuffer-projectile 
  :hook (ibuffer . ibuffer-projectile-set-filter-groups))

(use-package dired
	     :ensure nil
	     :straight nil
	     :bind
	     (("C-x C-j" . dired-jump)
	      ("C-x j" . dired-jump-other-window))
	     :custom
	     ;; Always delete and copy recursively
	     (dired-recursive-deletes 'always)
	     (dired-recursive-copies 'always))


(use-package crux
  :config
  (require 'crux)
  :bind (("C-S-k" . 'crux-kill-whole-line)
	 ("C-x K" . 'crux-kill-other-buffers)))

(setq make-backup-files nil)

(provide 'emacsI)
;;; emacsI.el ends here
