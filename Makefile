VERSION=$(shell git rev-parse --short HEAD)

all: build run

build:
	docker build -t pimba/shairport:$(VERSION) .

run:
	docker run -ti --rm \
	  --device /dev/snd \
	  -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
	  -v /etc/asound.conf:/etc/asound.conf:ro \
	  --net host \
	  pimba/shairport:$(VERSION)

push:
    docker push docker.io/pimba/shairport:$(VERSION)
