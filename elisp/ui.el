;;; ui.el --- ui setup            -*- lexical-binding: t; -*-

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

(defconst lisp--prettify-symbols-alist
  '(("lambda"  . ?λ))) ;; shows lambda word as the symbol
(global-prettify-symbols-mode 1)

(defun ui-use-font (font-config)
  "Use given FONT with given SIZE."
  (interactive)
  (add-to-list 'default-frame-alist (cons 'font (format "%s-%d" (car font-config) (car (last font-config))))))

(core/if-feature-use-package! :dashboard
			 dashboard
			 :config
			 (setq dashboard-center-content t)
			 (setq dashboard-startup-banner 'logo)
			 (setq dashboard-banner-logo-title "Hello again :)")
			 (dashboard-setup-startup-hook))

(core/if-feature-use-package! :theme
			 doom-themes
			 :defer t)

(core/if-feature-use-package! :theme
			 spacemacs-theme
			 :defer t)

(core/if-feature-use-package! :theme
			 badwolf-theme
			 :defer t)

(core/if-feature-use-package! :icons
			 all-the-icons)

(core/if-feature-use-package! :dired-icons
			 all-the-icons-dired
			 :straight (all-the-icons-dired :type git :host github :repo "jtbm37/all-the-icons-dired")
			 :init
			 (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(core/if-feature-eval! :theme
		  (setq custom-safe-themes t)
		  (load-theme (core/keyword-to-symbol (core/feature-get-argument :theme)) t))

(core/if-feature-use-package! :doom-modeline
			 doom-modeline
			 :config (doom-modeline-mode 1))

(core/if-feature-use-package! :spacemacs-modeline
			 spaceline
			 :config
			 (require 'spaceline-config)
			 (spaceline-spacemacs-theme))

(core/if-feature-use-package! :show-emojis
			 emojify
			 :config (emojify-mode 1))

(core/if-feature-eval! :font
		  (ui-use-font (core/feature-get-argument :font)))

(setq inhibit-splash-screen 0) ;; turn off emacs annoying startup page.
(tool-bar-mode 0) ;; turn off emacs GUI toolbar
(scroll-bar-mode 0) ;; turn off emacs GUI scrollbar
(menu-bar-mode 0) ;; turn emacs GUI menubar

(global-linum-mode t) ;; core/enable? line numbers
(setq use-dialog-box nil)

(provide 'ui)
;;; ui.el ends here
