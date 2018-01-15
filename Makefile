NAME = xennis/alpine

# Version and SHA (SHA can be on http://dl-cdn.alpinelinux.org/alpine/)
VERSION = 3.7
VERSION_PATCH = 0
VERSION_SHA512 = fd90fa4d0df8cb0e1cabd5500d4ecef91953877a3af49b4867d77c667010eb4adb400f7dea3e87784bfc673b5ecd1d4bcf8b3c9b92ca3c3ddf5abdeef2758fb7

FILENAME = alpine-minirootfs-$(VERSION).$(VERSION_PATCH)-x86_64.tar.gz

build: download
	docker build \
		-t $(NAME):$(VERSION).$(VERSION_PATCH) \
		-t $(NAME):$(VERSION) \
		-t $(NAME):latest \
		.

download:
	curl --silent --show-error --fail --output $(FILENAME) http://dl-cdn.alpinelinux.org/alpine/v$(VERSION)/releases/x86_64/$(FILENAME) \
		&& echo "$(VERSION_SHA512) $(FILENAME)" | sha512sum -c -
