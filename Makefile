.PHONY: help build test verify format clean run

help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Available targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

build: ## Build the plugin
	./gradlew buildPlugin

test: ## Run tests
	./gradlew test

verify: ## Verify plugin structure and compatibility
	./gradlew verifyPlugin
	./scripts/verify.sh

format: ## Format markdown files
	./scripts/format.sh

clean: ## Clean build artifacts
	./gradlew clean

run: ## Run IntelliJ with the plugin in sandbox
	./gradlew runIde

publish: ## Publish plugin to marketplace
	./gradlew publishPlugin

all: clean build verify ## Clean, build, and verify
