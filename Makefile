compile:
	@rm -rf **/*.elc
	@echo '(byte-recompile-directory "~/.emacs.d/hans/" 0)' > compiler.el
	@emacs -q --script compiler.el && rm -rf compiler.el

install-wm:
	@echo 'Installing ExWM'
	@sudo cp ./hans.desktop /usr/share/xsessions/hans.desktop
