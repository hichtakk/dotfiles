DOTPATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

install:
	@cask --verbose install

update:
	@cask --verbose update

clean: ## Remove elpa directory
	@echo '==> Remove emacs package directory'
	@echo ''
	rm -rf $(DOTPATH)/elpa
