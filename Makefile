PROJECT=$(shell basename $(shell pwd))
TAG=ghcr.io/johnjones4/${PROJECT}

content:
	./get_release.sh feedpage client
	./get_release.sh jabba ui
	./get_release.sh weather-ship-tango-delta ui

container:
	docker build -t ${TAG} .
	docker push ${TAG}:latest
	docker image rm ${TAG}:latest

ci: content container
