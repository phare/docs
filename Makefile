.PHONY: help
help: ##@ Print this help message
	@printf "\nPhare Docs make, usage: make <command>\n"
	@grep -F -h "##@" $(MAKEFILE_LIST) | grep -F -v grep -F | sed -e 's/\\$$//' | awk 'BEGIN {FS = ":*[[:space:]]*##@[[:space:]]*"}; \
	{ \
		if($$2 == "") \
			pass; \
		else if($$0 ~ /^#/) \
			printf "\n\n%s\n", $$2; \
		else if($$1 == "") \
			printf "     %-20s%s\n", "", $$2; \
		else \
			printf "\n    \033[34m%-20s\033[0m %s", $$1, $$2; \
	}'

##@
##@ Development
##@

.PHONY: dev
dev: ##@ Start Mintlify local development server
	mint dev

.PHONY: broken-links
broken-links: ##@ Check for broken links
	mintlify broken-links
