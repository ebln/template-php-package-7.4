DOCKER_COMPOSE_DIR=./.provision
DOCKER_COMPOSE_YML=$(DOCKER_COMPOSE_DIR)/docker-compose.yml
DEFAULT_CONTAINER=php
DOCKER_COMPOSE=docker-compose -f $(DOCKER_COMPOSE_YML)
MAKE=make -s
.DEFAULT_GOAL := help

.PHONY: help build rm enter test

help: ## Show this help.
	@grep -E '^[a-zA-Z_-]+:.*?##\s*.*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?##\\s*"}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build:##Build containers
	$(MAKE) rm
	$(DOCKER_COMPOSE) build --force-rm

rm:##Remove containers
	$(DOCKER_COMPOSE) rm --force --stop -v

down:####Alias of «rm»
	$(MAKE) rm
stop:##Alias of «rm»
	$(MAKE) rm

enter:##Log into the main container
	$(DOCKER_COMPOSE) run ${DEFAULT_CONTAINER} /bin/bash

test:##Log into the main container
	$(DOCKER_COMPOSE) run ${DEFAULT_CONTAINER} composer test
