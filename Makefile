## install dependencies
.PHONY: install
install:
	npm install

## download the theme that this blog uses
.PHONY: download-theme
download-theme:
	git clone https://github.com/probberechts/hexo-theme-cactus.git themes/cactus

.PHONY: generate
generate:
	hexo generate

## locally serve the site
.PHONY: server
server: generate
	hexo server

## create a new blog post
.PHONY: new-post
new-post:
	if [ -z "$(title)" ]; then \
		echo "Usage: make new-post title='Your Title'"; \
		exit 1; \
	fi
	hexo new post "$(title)"

## Display help for all targets
.PHONY: help
help:
	@awk '/^.PHONY: / { \
		msg = match(lastLine, /^## /); \
			if (msg) { \
				cmd = substr($$0, 9, 100); \
				msg = substr(lastLine, 4, 1000); \
				printf "  ${GREEN}%-30s${RESET} %s\n", cmd, msg; \
			} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)

param-%:
	@ if [ "${${*}}" = "" ]; then \
		echo "Param \"$*\" is missing, use: make $(MAKECMDGOALS) $*=<value>"; \
		exit 1; \
	fi
