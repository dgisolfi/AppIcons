REPO=AppIcons
VER=1.0.0

intro:
	@echo "$(REPO) v$(VER)"

clean:
	@find . -name "*.png" -not -path "./steps/*" -exec rm -rf {} \;
	-rm icons.zip

color:
	docker-compose run convert sh -c "./icons.sh color FFFFFF 000000"

build:
	docker-compose run convert sh -c "./icons.sh convert ./icons ./pngs"

zip: clean build
	zip -R icons.zip ./pngs/*

.PHONY: intro clean build zip