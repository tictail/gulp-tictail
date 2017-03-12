export PATH := $(shell npm bin):$(PATH)
SHELL := /bin/bash

.PHONY : clean build test publish

clean:
	rm -rf lib

build: clean
	gulp build

update-responses:
	curl https://api.tictail.com/v1.23/stores/t -o test/responses/store.json
	curl https://api.tictail.com/v1.23/stores/t/products -o test/responses/products.json
	curl https://api.tictail.com/v1.23/stores/t/categories -o test/responses/categories.json

test: build
	mocha

publish: clean build
	npm publish
	git push origin --tags
