;;; dev.el --- provides syntax checking capanalities  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  amirreza

;; Author: amirreza <amirreza@nobody.invalid>


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
;;                                    Flycheck
;;================================================================================

(use-package flycheck :hook ((prog-mode) . flycheck-mode))


;;================================================================================
;;                                     Magit
;;================================================================================
(use-package magit
       :commands (magit-status)
       :bind
       (("C-x g" . 'magit-status)))

(use-package diff-hl
  :config (global-diff-hl-mode 1))

(use-package gitconfig-mode :mode "/\\.gitconfig\\'")

(use-package gitignore-mode
       :mode "/\\.gitignore\\'")

(use-package gitattributes-mode)
       :mode "/\\.gitattributes\\'"

(use-package git-messenger
       :bind
       (("C-M-c" . 'git-messenger:popup-message))
       :config
       (setq git-messenger:show-detail t)
       (setq git-messenger:use-magit-popup t))


;;================================================================================
;;                                   Projectile
;;================================================================================
(use-package projectile
       :bind
       (("C-x p" . 'projectile-command-map)
        ("C-c p" . 'projectile-add-known-project))
       :custom
       (projectile-completion-system 'ivy)
       :config
       (projectile-mode 1)
       (add-to-list 'projectile-globally-ignored-directories "node_modules"))

(use-package counsel-projectile
  :bind (("C-c C-p r" . counsel-projectile-rg)))


(provide 'modules/dev)
;;; dev.el ends here
