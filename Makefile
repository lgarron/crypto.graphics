all: build

JEKYLL_ARGS = --source source --destination build
URL = "https://crypto.graphics/"

.PHONY: build
build:
	jekyll build ${JEKYLL_ARGS}

.PHONY: serve
serve:
	jekyll serve ${JEKYLL_ARGS} --watch

.PHONY: deploy
deploy:
	rsync -avz \
		--exclude .DS_Store \
		--exclude .git \
		--exclude .gitignore \
		./build/ \
		crypto.graphics:~/crypto.graphics/
	echo "\nDone deploying. Go to ${URL}\n"

.PHONY: open
open:
	open "${URL}"
