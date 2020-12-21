VERSION=$(shell git rev-parse --short HEAD)
.PHONY: build run push
all: build run

build:
	docker build --no-cache -t pimba/shairport:$(VERSION) .

run:
	docker run -ti --rm \
	  --device /dev/snd \
	  -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
	  -v /etc/asound.conf:/etc/asound.conf:ro \
	  --net host \
	  pimba/shairport:$(VERSION)

push:
	docker push pimba/shairport:$(VERSION)
