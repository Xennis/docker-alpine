NAME = xennis/alpine

build:
	docker build \
		-t $(NAME):3.6.2 \
		-t $(NAME):3.6 \
		-t $(NAME):latest \
		.
