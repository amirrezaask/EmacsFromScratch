;;; window-manager.el --- window manager setup            -*- lexical-binding: t; -*-

;; Copyright (C) 2020  amirrezaask

;; Author: amirreza <amirrezaask@protonmail.com>


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

(core/if-feature-use-package! :window-manager
			 exwm
			 :config
			 (require 'exwm)
			 (require 'exwm-config)
			 (exwm-config-default)
			 (display-battery-mode 1))

(core/if-feature-eval! :window-manager
		  (defun exwm-current-workspace ()
		    (interactive)
		    (message "Current workspace is %s" exwm-workspace-current-index))
		  (add-hook 'exwm-workspace-switch-hook 'exwm-current-workspace)
		  (core/bindkey global-map 'exwm-current-workspace :holy "C-c C-w n")
		  (core/bindkey global-map 'exwm-input-toggle-keyboard :holy "C-x /"))

(provide 'window-manager)
