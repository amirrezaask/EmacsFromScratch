;;; completion.el --- Completion setup               -*- lexical-binding: t; -*-

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

;;  ----------------------------Code completion (company)-----------------------------

(use-package company
    :custom
    (company-idle-delay 0.25)
    (company-minimum-prefix-length 2)
    (company-tooltip-limit 14)
    (company-tooltip-align-annotations t)
    (company-require-match 'never)
    (company-global-modes '(not erc-mode message-mode help-mode gud-mode eshell-mode))
    (company-backends  '(company-capf))
    (company-frontends '(company-pseudo-tooltip-frontend
			 company-echo-metadata-frontend))
    :config
    (global-company-mode 1)
    (add-to-list 'company-backends '(company-capf company-dabbrev)))

;; ------------------------------------General completion----------------------------
(use-package ivy
	      :bind
	      (("C-x b" . 'ivy-switch-buffer))
	      :custom
	      (ivy-height 17)
	      (ivy-wrap t)
	      (ivy-fixed-height-minibuffer t)
	      (projectile-completion-system 'ivy)
	      ;; disable magic slash on non-match
	      (ivy-magic-slash-non-match-action nil)
	      ;; don't show recent files in switch-buffer
	      (ivy-use-virtual-buffers nil)
	      ;; ...but if that ever changes, show their full path
	      (ivy-virtual-abbreviate 'full)
	      ;; don't quit minibuffer on delete-error
	      (ivy-on-del-error-function #'ignore)
	      ;; enable ability to select prompt (alternative to `ivy-immediate-done')
	      (ivy-use-selectable-prompt t)
	      :config
	      (setf (alist-get 't ivy-format-functions-alist)
		    #'ivy-format-function-line)
	      (ivy-mode +1))

(use-package counsel
	      :commands (counsel-M-x counsel-find-file ivy-switch-buffer)
	      :bind
	      (("M-x" . 'counsel-M-x)
	       ("C-x C-f" . 'counsel-find-file)
	       ("C-h b" . 'counsel-descbinds)
	       ("C-h f" . 'counsel-describe-function)
	       ("C-h v" . 'counsel-describe-variable)
	       ("C-h a" . 'counsel-apropos)
	       ("<f4>"  . 'counsel-fzf)
	       ("<f2>" . 'counsel-rg)
	       ("M-y" . 'counsel-yank-pop)))


(provide 'completion)
;;; completion.el ends here
