DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard *)
EXCLUSIONS := .DS_Store .git .gitmodules Makefile README.md
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

.DEFAULT_GOAL := help

list: ## Show dot files in this repo
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

update: ## Fetch changes for this repo
	git pull origin master

deploy: ## Create symlink to home directory
	@echo '==> Start to deploy dotfiles to home directory.'
	@echo ''
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/.$(val);)

install: update deploy ## Run make update and deploy

clean: ## Remove symlink from home directory
	@echo '==> Remove dot files in your home directory...'
	@echo ''
	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/.$(val);)

help: ## Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort
