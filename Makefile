IMG := pypiserver/pypiserver
TAG := v1.4.2
IMG_TAG := $(IMG):$(TAG)

PYPI ?= $$(pwd)/data
PORT ?= 8080

build:
	docker build --pull --tag $(IMG_TAG) .

run:
	@docker rm pypi 2>/dev/null || echo ''
	docker run --rm -ti \
		--name pypi \
		-p $(PORT):8080 \
		-v $(PYPI):/data/packages \
		-v $$(pwd)/.htpasswd:/data/.htpasswd \
		$(IMG_TAG) \
		--overwrite \
		--passwords .htpasswd \
		packages
