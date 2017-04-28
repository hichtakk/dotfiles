DOT_EMACS_PATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

install: ## install emacs packages
	@emacs -batch -l init.el

clean: ## Remove elpa directory
	@echo '==> Remove emacs package directory'
	@echo ''
	rm -rf $(DOT_EMACS_PATH)/.elpa
