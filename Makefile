# Detect os name for unix system
OS_NAME := $(shell uname -s | tr A-Z a-z)
HOME := ~/
DOT := .
CONFIG := .config/

# file-independant targets 
.PHONY: vim vifm all test

islink = $(shell if [[ -L $(1) ]]; then echo true; fi)
isexits = $(shell test -e $(1) && echo true)
remove_link = $(and $(call islink,$(1)),$(shell echo Remove existing link \"$(1)\"; rm $(1)))
backup = $(shell echo Backup existing config \"$(1)\"; mv $(1) $(1)-$(shell date +%s))
remove = $(and $(call isexits,$(1)),$(or $(call remove_link,$(1)),$(call backup,$(1))))
create_link = $(shell echo Linking \"$(1)\" to \"$(2)$(1)\"; ln -s $(shell pwd)/$(1)/ $(2)$(1)) 

vim:  
	@echo Vim 8 should be installed.
	$(info $(call remove,$(HOME)$(DOT)$@))
	$(info $(call create_link,$@,$(HOME)$(DOT)))
	@echo $@ setup ended!

vifm:
	@echo Vifm should be installed
	$(info $(call remove,$(HOME)$(CONFIG)$@))
	$(info $(call create_link,$@,$(HOME)$(CONFIG)))
	@echo $@ setup ended!


all: vim vifm
	@echo $@ setup ended!
