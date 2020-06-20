# Detect os name for unix system
OS_NAME := $(shell uname -s | tr A-Z a-z)
PROJECT_DIR := $(shell pwd)
HOME := ~
DOT := .
CONFIG := .config

# file-independant targets
.PHONY: vim vifm zsh tmux all test

# Check that path=$(1) is symbolic link
islink = $(shell test -L $(1) && echo true)
# Check that path=$(1) exist and not link
isexits = $(shell test -e $(1) && echo true)
# Remove existing link on path=$(1) if exist
remove_link = $(and $(call islink,$(1)),$(shell echo Remove existing link \"$(1)\"; rm $(1)))
# Backup item if exists on path=$(1)
backup = $(shell echo Backup existing config \"$(1)\"; mv $(1) $(1)-$(shell date +%s))
# Remove existing item on path=$(1)
remove = $(or $(call remove_link,$(1)),$(and $(call isexits,$(1)),$(call backup,$(1))), No removes.)
# Create link from path=$(1) to path=$(2))
create_link = $(shell echo Linking \"$(1)\" to \"$(2)\"; ln -s $(1) $(2))
# Check if command=$(1) in PATH
inpath = $(or $(and $(shell which $(1)),Command in path.),$(error Please, install "$(1)" first (not in path)))

vim:
	$(info $(call inpath,$@))
	$(info $(call remove,$(HOME)/$(DOT)$@))
	$(info $(call create_link,$(PROJECT_DIR)/$@,$(HOME)/$(DOT)$@))
	@echo $@ setup ended!

vifm:
	$(info $(call inpath,$@))
ifeq ($(OS_NAME),darwin)
	$(info $(call remove,$(HOME)/$(CONFIG)/$@))
	$(info $(call create_link,$(PROJECT_DIR)/$@,$(HOME)/$(CONFIG)/$@))
endif
ifeq ($(OS_NAME),linux)
	$(info $(call remove,$(HOME)/$(DOT)$@))
	$(info $(call create_link,$(PROJECT_DIR)/$@,$(HOME)/$(DOT)$@))
endif
	@echo $@ setup ended!

zsh:
	$(info $(call inpath,$@))
	$(info $(call remove,$(HOME)/$(DOT)$@rc))
	$(info $(call create_link,$(PROJECT_DIR)/$@/$@rc,$(HOME)/$(DOT)$@rc))
	@echo $@ setup ended!

tmux:
	$(info $(call inpath,$@))
	$(info $(call remove,$(HOME)/$(DOT)$@))
	$(info $(call remove,$(HOME)/$(DOT)$@.conf))
	$(info $(call create_link,$(PROJECT_DIR)/$@,$(HOME)/$(DOT)$@))
	$(info $(call create_link,$(PROJECT_DIR)/$@/$@.conf,$(HOME)/$(DOT)$@.conf))
	@echo $@ setup ended!

all: vim vifm zsh tmux
	@echo $@ setup ended!
