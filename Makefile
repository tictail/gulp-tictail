export PATH := $(shell npm bin):$(PATH)
SHELL := /bin/bash

.PHONY : clean build test publish

clean:
	rm -rf lib

build: clean
	coffee -o lib -c src

test: build
	mocha

publish: clean build
	npm publish
