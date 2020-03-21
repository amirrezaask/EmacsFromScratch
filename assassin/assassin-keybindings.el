;;; assassin-keybindings.el --- -*- lexical-binding: t; -*-

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
;; .
;; ─────────────────█─────────────────
;; ────────────────███────────────────
;; ───────────────█████───────────────
;; ───────────────█████───────────────
;; ──────────────██─████──────────────
;; ──────────────██──███──────────────
;; ─────────────███──████─────────────
;; ─────────────██────███─────────────
;; ────────────███────████────────────
;; ────────────██──────████───────────
;; ───────────███──────████───────────
;; ───────────██────────████──────────
;; ──────────███────────████──────────
;; ──────────██──────────████─────────
;; ─────────███──────────████─────────
;; ─────────██────────────████────────
;; ────────███─────────────███────────
;; ───────████─────────────████───────
;; ▄───▄▄████───────────────█████────▄
;; ▀█████████───────────────█████████▀
;; ──███████─────────────────███████──
;; ───██████─────────────────██████───
;; ───█████───────────────────█████───
;; ───█████───────────────────█████───
;; ──█████─────────────────────█████──
;; ▄██████─────────────────────██████▄
;; ▀──▀███─────────────────────███▀──▀
;; ────▀███▄─────────────────▄███▀────
;; ▀▄─────▀██▄▄───────────▄▄██▀─────▄▀
;; ──▀▄─────▀▀██▄▄──▄──▄▄██▀▀─────▄▀──
;; ────█▄──────────▄█▄──────────▄█────
;; ─────▀██▄──────▄███▄──────▄▄█▀─────
;; ───────▀███▄▄▄███████▄▄▄███▀───────
;; ──────────▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀──────────

;; 

;;; Code:

(defun -bindkey-evil (map fn keys)
  "Bind given FN to given KEYS on given MAP."
  (let ((normal-key (plist-get keys :normal))
	(visual-key (plist-get keys :visual))
	(insert-key (plist-get keys :insert))
	(emacs-key (plist-get keys :emacs)))
    (cond
     ((not (null normal-key)) (evil-define-key 'normal map (kbd normal-key) fn))
     ((not (null visual-key)) (evil-define-key 'visual map (kbd visual-key) fn))
     ((not (null insert-key)) (evil-define-key 'insert map (kbd insert-key) fn))
     ((not (null emacs-key)) (evil-define-key 'emacs map (kbd emacs-key) fn)))))

(defun -bindkey-holy (map fn keys)
  "Bind given FN to given KEYS on given MAP."
  (define-key map (kbd keys) fn))

(defmacro bindkey (map fn &rest keys)
  "Binds FN to KEYS on given MAP based on side you are on."
  (let ((evil-keys (plist-get keys :evil)) (holy-keys (plist-get keys :holy)))
    (cond
     ((eq side 'evil) `(-bindkey-evil ,map ,fn (quote ,evil-keys)))
     ((eq side 'holy) `(-bindkey-holy ,map ,fn ,holy-keys))
     )
    ))


(provide 'assassin-keybindings)
