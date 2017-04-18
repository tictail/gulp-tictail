export PATH := $(shell npm bin):$(PATH)
SHELL := /bin/bash

.PHONY : clean build update-responses test release

API_BASE=https://api.tictail.com/v1.23/stores/t

clean:
	rm -rf lib

build: clean
	coffee -o lib -c src
	gulp mustache

update-responses:
	curl ${API_BASE} -o test/responses/store.json
	curl ${API_BASE}/products -o test/responses/products.json
	curl ${API_BASE}/categories -o test/responses/categories.json

test: build
	mocha

release: clean build
	@./release.sh
