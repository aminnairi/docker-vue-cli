# Commands that should not be treated as files/folders
.PHONY: build

# Builds the image locally
build:
	docker build --force-rm --pull --no-cache --file ./Dockerfile --tag aminnairi/vue-cli .
