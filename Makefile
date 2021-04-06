SHELL 	   := $(shell which bash)

NO_COLOR   :=\033[0m
OK_COLOR   :=\033[32;01m
ERR_COLOR  :=\033[31;01m
WARN_COLOR :=\033[36;01m
ATTN_COLOR :=\033[33;01m

GITHUB_SHA    ?= $(shell git rev-parse HEAD 2>/dev/null)

# build action input parameters
INPUT_SOURCE_PATH   := "./src"
INPUT_TARGET_PATH   := "./build"
INPUT_TARGET_FILE   := "bundle.tar.gz"
INPUT_BUILD_OPTIONS := "--revision $(GITHUB_SHA)"

.PHONY: build
build:
	@echo -e "$(ATTN_COLOR)==> $@ $(NO_COLOR)"
	@echo "SOURCE_PATH   $(INPUT_SOURCE_PATH)"
	@echo "TARGET_PATH   $(INPUT_TARGET_PATH)"
	@echo "TARGET_FILE   $(INPUT_TARGET_FILE)"
	@echo "BUILD_OPTIONS $(INPUT_BUILD_OPTIONS)"

	@docker run -ti \
	--rm --name aserto-build \
	-e TARGET_FILE=$(INPUT_TARGET_FILE) \
	-e BUILD_OPTIONS=$(INPUT_BUILD_OPTIONS) \
	-v $(PWD)/$(INPUT_SOURCE):/src:ro \
	-v $(PWD)/$(INPUT_TARGET_PATH):/dst:rw \
	ghcr.io/aserto-dev/aserto-build:latest