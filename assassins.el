;;; assassins.el --- user config file of assassins Emacs  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Amirreza Askarpour

;; Author: Amirreza Askarpour <amirrezaask@protonmail.com>

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

(defassassin

 :side assassins ;; You are a member of brotherhood and a true Emacs user
 ;; :side templars ;; You are a member of templar order and a VIM user
 
 :modeline modern ;; You are fasion lover like Ezio
 ;; modeline basic ;; You like the simplicity

 :completion helm ; You love heavy weaponary 
 ;; :completion ivy ; You like simple, silent weapons
 ;; :completion ido ; Simplest one out there, probably doesn't work

 :editor ;; every assassin needs best tool for writing
 ;;multiple-cursor ; multiple edits
 ;;whitespace-mode ; highlight indents

 :development ;; I don't really know how to connect this concept to assassins era

 
 :devops ;; when an assassin becomes the operations guy
 ;;k8s
 ;;ansible
 ;;docker


 
 :languages
 ;;assembly          ; closest thing to metal
 ;;cc                ; C/C++/Obj-C madness
 ;;clojure           ; lisp on jvm
 ;;common-lisp       ; common things lisps have
 ;;csharp            ; unity, .NET, and mono shenanigans
 ;;dockerfile        ; new cool vms
 emacs-lisp          ; emacs language 
 ;;json              ; Beside from being js technology, a good data format 
 ;;xml               ; don't forget to take your pills, cause you're old
 ;;yaml              ; hipster data format
 ;;elixir            ; erlang done right
 ;;erlang            ; pass the message
 ;;fsharp            ; Haskell on .NET
 ;;go                ; New edition of C with garbage collector
 ;;haskell           ; a language that's lazier than I am
 ;;java              ; let me guess ? You are in a retirement home
 ;;javascript        ; akh :(
 ;;kotlin            ; bearable java(javascript)
 ;;latex             ; just use the org mode :)
 ;;lua               ; one-based indices? one-based indices
 markdown            ; writing docs for people to ignore
 org                 ; Markdown done correctly
 ;;php               ; so it goes back to your childhood
 ;;python            ; simple's better than complex
 ;;racket            ; a DSL for DSLs
 ;;rust              ; new actuall C replacement
 ;;scala             ; java + functional programming
 sh                ; she sells {ba,z,fi}sh shells on the C xor
 ;;web               ; the tubes

 
 :communication
 email
 ;;irc
 ;;twitter        
           
 )
           
           

(provide 'assassins)
;;; assassins.el ends here
