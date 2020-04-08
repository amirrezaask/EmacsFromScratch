;;; window-manager.el --- Emacs as a X window manager  -*- lexical-binding: t; -*-

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

(use-package exwm
	     :disabled t
	     :config
	     (require 'exwm)
	     (require 'exwm-config)
	     (exwm-config-default)
	     (display-battery-mode 1)
	     (defun exwm-current-workspace ()
	       (interactive)
	       (message "Current workspace is %s" exwm-workspace-current-index))
	     (add-hook 'exwm-workspace-switch-hook 'exwm-current-workspace)
	     :bind
	     (("C-c C-w n" . 'exwm-current-workspace)
	      ("C-x /" . 'exwm-input-toggle-keyboard)))



(provide 'window-manager)
;;; window-manager.el ends here
