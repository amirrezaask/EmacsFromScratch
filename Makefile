compile:

	@echo '(byte-recompile-directory "~/.emacs.d/hans/" 0)' > compiler.el
	@emacs -q --script compiler.el && rm -rf compiler.el
