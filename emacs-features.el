(enable!
    :side :god ; Emacs keybindings
    ;; :side :evil ; Vi style modal editing (not really that much configured since i'm not an evil person any more :) )
    ;;
    ;; :x-window-manager
    ; UI features
    :theme :doom-dracula
    :font ("mononoki" 11)
    ;; :doom-modeline
    ;; :spacemacs-modeline
    :icons
    :dired-icons
    :dashboard
    
    ; completion framework
    :ivy
    ;; :helm
    ;; :ido
    :ibuffer
    
    ; Editor
    :multiple-cursors ; multiple edits
    :hl-indent
    :which-key ; helps us when we only remember part of a keybinding
    ;; :neotree ; a side tree file browser like NERDtree for vim
    
    ; IDE features
    :flycheck ; on the fly syntax checking and linting
    :auto-completion  ; Code completion framework (does not do all the work by itself still need backends) mainly used by LSP
    :language-server-protocol
    :git
    ;; :snippets ; yasnippet support
    ;;:debugger-adapter-protocol
     
    
    ; DevOps features
    :k8s ; k8s management in Emacs
    :docker ; docker containers,images,etc management
 
    
    ; Supported languages
    :assembly           ; closest thing to metal
    :c/c++              ; C/C++/Obj-C madness
    :clojure            ; lisp on jvm
    :csharp             ; unity, .NET, and mono shenanigans
    :dockerfile         ; VMs of new era
    :data               ; support all data formats that I know
    :emacs-lisp         ; emacs language
    :elixir             ; erlang done right
    :fsharp             ; Haskell on .NET
    :golang             ; New edition of C with garbage collector
    :haskell            ; a language thats lazier than I am
    :java               ; let me guess ? You are in a retirement home
    :javascript         ; akh :(
    :lua                ; one-based indices? one-based indices
    :markdown           ; writing docs for people to ignore
    :org                ; Markdown done correctly
    :php                ; so it goes back to your childhood
    :python             ; simples better than complex
    :racket             ; a DSL for DSLs
    :rust               ; new actuall C replacement
    :scala              ; java + functional programming
    :sh                 ; she sells {ba,z,fi}sh shells on the C xor
    :web                ; the tubes
    )
