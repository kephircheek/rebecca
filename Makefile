# Detect os name for unix system
OS_NAME := $(shell uname -s | tr A-Z a-z)
PROJECT_DIR := $(shell pwd)
HOME := ~
CONFIG := .config
SHELL:=/bin/bash

VIM_MAJOR_VERSION = 8
VIM_MINOR_VERSION = 0

VIFM_MAJOR_VERSION = 0
VIFM_MINOR_VERSION = 10

TMUX_MAJOR_VERSION = 2
TMUX_MINOR_VERSION = 4

ZSH_MAJOR_VERSION = 5
ZSH_MINOR_VERSION = 0

# file-independant targets
.PHONY: vim vifm zsh tmux all test clean
# main target
.DEFAULT_GOAL := all

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
# Get instruction to install package=$(2) on platform=$(1)
get_install_instruction = $(or $(and $(findstring darwin,$(1)),$\
                                     $(or $(and $(shell cat deps/macos/requirements.brew | grep $(2)),$\
                                                brew install $(shell cat deps/macos/requirements.brew | grep $(2))),$\
                                          $(and $(shell cat deps/macos/requirements.pip | grep $(2)),$\
                                                pip install $(shell cat deps/macos/requirements.pip | grep $(2))),$\
                                          $(and $(shell ls deps/macos | grep $(2)),$\
                                               ./deps/macos/$(shell ls deps/macos | grep $(2))/install.sh))),$\
                               $(and $(findstring linux,$(1)),$\
                                     $(or $(and $(shell cat deps/ubuntu/requirements.apt | grep $(2)),$\
                                                sudo apt install $(shell cat deps/ubuntu/requirements.apt | grep $(2))),$\
                                          $(and $(shell ls deps/ubuntu | grep $(2)),$\
                                                ./deps/ubuntu/$(shell ls deps/ubuntu | grep $(2))/install.sh))),$\
                               sorry... no instructions)

# Check if command=$(1) in PATH
inpath = $(or $(and $(shell which $(1)),Command in path.),$\
              $(error Please, install "$(1)" first (not in path).\
              Try command: "$(call get_install_instruction,$(OS_NAME),$(1))"))
# Upper case
upper = $(shell echo $(1) | tr '[:lower:]' '[:upper:]')
# Get version of executable=$(1) with flag=$(2)
version = $(shell $(1) $(or $(2),--version) | grep -o -E "[0-9]+(\.[0-9]+)+" | head -1)
# Get major version of executable=$(1) with flag=$(2)
major_version = $(firstword $(subst ., ,$(call version,$(1),$(2))))
# Get minor version of executable=$(1) with flag=$(2)
minor_version = $(word 2,$(subst ., ,$(call version,$(1),$(2))))
# Compare version of executable=$(1) with flag=$(2)
# with *_MAJOR_VERSION and *_MINOR_VERSION where * is uppercase $(1)
check_version = $(shell [ $(call major_version,$(1),$(2)) -gt $($(call upper,$(1))_MAJOR_VERSION) -o \
							  \( $(call major_version,$(1),$(2)) -eq $($(call upper,$(1))_MAJOR_VERSION) \
							  -a $(call minor_version,$(1),$(2)) -ge $($(call upper,$(1))_MINOR_VERSION) \) ] && echo true)
is_supported_version = $(or $(and $(call check_version,$(1),$(2)),$\
					   Version $(call version,$(1),$(2)) is ok),$\
					   $(error $(call upper,$(1)) should be upgraded up to $\
					   $($(call upper,$(1))_MAJOR_VERSION).$($(call upper,$(1))_MINOR_VERSION) $\
					   try command: "$(call get_install_instruction,$(OS_NAME),$(1))"))

# Check vim feature=$(1)
check_vim_features = $(or $(and $(shell vim --version | grep -o +$(1)),$\
                                Python available),$\
                          $(error Rrequires Vim compiled with Python (3.5.1+) support.\
						          Install requirements and recompile vim with:\
                                  "$(call get_install_instruction,$(OS_NAME),vim)"))
clean_vim:
	$(info vim: $(call remove,$(HOME)/.vim))

vim: clean_vim
	$(info $@: $(call inpath,$@))
	$(info $@: $(call is_supported_version,$@))
	$(info $@: $(call check_vim_features,python3))
	$(info $@: $(call create_link,$(PROJECT_DIR)/$@,$(HOME)/.$@))
	@echo ----- $@ is done -----

clean_vifm:
ifeq ($(OS_NAME),darwin)
	$(info vifm: $(call remove,$(HOME)/$(CONFIG)/vifm))
endif
ifeq ($(OS_NAME),linux)
	$(info vifm: $(call remove,$(HOME)/.vifm))
endif

vifm: clean_vifm
	$(info $@: $(call inpath,$@))
	$(info $@: $(call is_supported_version,$@))
ifeq ($(OS_NAME),darwin)
	$(info $@: $(call create_link,$(PROJECT_DIR)/$@,$(HOME)/$(CONFIG)/$@))
endif
ifeq ($(OS_NAME),linux)
	$(info $@: $(call create_link,$(PROJECT_DIR)/$@,$(HOME)/.$@))
endif
	@echo ----- $@ is done -----

clean_zsh:
	$(info zsh: $(call remove,$(HOME)/.zshrc))

zsh: clean_zsh
	$(info $@: $(call inpath,$@))
	$(info $@: $(call is_supported_version,$@))
	$(info $@: $(call create_link,$(PROJECT_DIR)/$@/$@rc,$(HOME)/.$@rc))
	@echo ----- $@ is done -----

clean_tmux:
	$(info tmux: $(call remove,$(HOME)/.tmux))
	$(info tmux: $(call remove,$(HOME)/.tmux.conf))

tmux: clean_tmux
	$(info $@: $(call inpath,$@))
	$(info $@: $(call is_supported_version,$@,-V))
	$(info $@: $(call create_link,$(PROJECT_DIR)/$@,$(HOME)/.$@))
	$(info $@: $(call create_link,$(PROJECT_DIR)/$@/$@.conf,$(HOME)/.$@.conf))
	@echo ----- $@ is done -----

all: vim vifm zsh tmux
	@echo ----- $@ is done -----

clean: clean_vim clean_vifm clean_zsh clean_tmux
	@echo ----- $@ is done -----
