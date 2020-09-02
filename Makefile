NG ?= 1.18.0

run: build login push

build:
	docker build --build-arg NG_VERSION=$(NG) -t dkimg/nginx:$(NG) .

login:
	@echo "$(DOCKER_PASSWORD)" | docker login -u "$(DOCKER_USERNAME)" --password-stdin
	@echo "$(QUAY_PASSWORD)" | docker login quay.io -u "$(QUAY_USERNAME)" --password-stdin

push:
	@docker tag dkimg/nginx:$(NG) quay.io/dkimg/nginx:$(NG)
	@docker push dkimg/nginx:$(NG)
	@docker push quay.io/dkimg/nginx:$(NG)