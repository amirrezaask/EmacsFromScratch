;;; assassin-dev.el --- assassin dev module          -*- lexical-binding: t; -*-

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

;; 

;;; Code:

(assassin-feature :syntax-checker
	       (use-package flycheck :hook (prog-mode . flycheck-mode)))

(assassin-feature :debugger
	       (use-package dap-mode  :defer t :hook ((go-mode python-mode php-mode) . dap-mode)))

(assassin-feature :git
	        (use-package magit
			     :commands (magit-status)
			     :init
			     (bindkey global-map 'magit-status :holy "C-x g" :evil (:normal "SPC g s")))

		(use-package diff-hl  :config (global-diff-hl-mode))

		(assassin-feature :assassins
			       (use-package evil-magit :defer t :init (add-hook 'magit-mode-hook (lambda () (require 'evil-magit))))))


(assassin-feature :lsp
	       (use-package lsp-mode :defer t)
	       (use-package lsp-ui  :defer t))

(assassin-feature :auto-complete
	       (use-package company-lsp  :defer t)
	       (use-package company
			    :config
			    (global-company-mode t)
			    (setq company-tooltip-limit 30)
			    (setq company-idle-delay .1)
			    (setq company-echo-delay 0)
			    (setq company-dabbrev-downcase nil)
			    (add-to-list 'company-backends 'company-dabbrev)
			    (add-to-list 'company-backends 'company-dabbrev-code)))

(provide 'assassin-dev)
;;; assassin-dev.el ends here
