.PHONY: all
all: install bootstrap

.PHONY: install
install:
	swift build -c release && cp .build/release/GeneratePR /usr/local/bin/gen-pr

.PHONY: bootstrap
bootstrap:
	brew list gh > /dev/null || brew install gh
	brew outdated gh || brew upgrade gh
