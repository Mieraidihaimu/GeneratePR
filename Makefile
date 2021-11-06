.PHONY: all
all: install bootstrap

.PHONY: install
install:
	swift build -c release && cp .build/release/GeneratePR /usr/local/bin/gen-pr

.PHONY: bootstrap
bootstrap:
	./scripts/bootstrap.sh
