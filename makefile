REPO=AppIcons
VER=1.0.0
THEMES:=$(shell find . -type d -not -path "./steps" -not -path "." -maxdepth 1)

intro:
	@echo "$(REPO) v$(VER)"
	@echo "Themes"
	$(foreach theme,$(THEMES),echo "- $(theme)";)

clean:
	find . -name "*.png" -not -path "./steps/*" -exec rm -rf {} \;
	$(foreach theme,$(THEMES),rm ./$(theme)/$(theme).zip;)

build:
	docker-compose run convert sh -c "./convert.sh all"

zip: build
	$(foreach theme,$(THEMES),zip -R ./$(theme)/$(theme).zip ./$(theme)/png/*;)

.PHONY: intro clean build zip