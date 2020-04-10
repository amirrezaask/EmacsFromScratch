;;; devops.el --- DevOps module                      -*- lexical-binding: t; -*-

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

;;================================================================================
;;                                   Kubernetes                                   
;;================================================================================
(use-package kubel
	      :commands
	      (kubel))

;;================================================================================
;;                                     Docker                                     
;;================================================================================
(use-package docker
	      :bind
	      ("C-c d" . docker))

(use-package dockerfile-mode
	      :mode "Dockerfile")

;;================================================================================
;;                                    Ansible                                    
;;================================================================================
(use-package ansible
  :disabled t
  :commands ansible-auto-decrypt-encrypt
  :init
  (put 'ansible-vault-password-file 'safe-local-variable #'stringp)
  :config
  (setq ansible-section-face 'font-lock-variable-name-face
	ansible-task-label-face 'font-lock-doc-face))

(use-package jinja2-mode
  :mode "\\.j2$")


(provide 'modules/devops)
;;; devops.el ends here
