DOCKERCMD = docker

.PHONY: default

default: build

##############################################################################

.PHONY: build login push test testall test-all

build:
	$(MAKE) -C tex/latex_for_plotting build
	$(MAKE) -C julia/julia1.1 build
	$(MAKE) -C predictmd/predictmd_unstable build

login:
	$(DOCKERCMD) login

push:
	$(MAKE) -C tex/latex_for_plotting push
	$(MAKE) -C julia/julia1.1 push
	$(MAKE) -C predictmd/predictmd_unstable push

test:
	$(MAKE) -C tex/latex_for_plotting test
	$(MAKE) -C julia/julia1.1 test
	$(MAKE) -C predictmd/predictmd_unstable test

testall:
	@echo "I think you meant: make test-all"

test-all:
	$(MAKE) -C tex/latex_for_plotting test-all
	$(MAKE) -C julia/julia1.1 test-all
	$(MAKE) -C predictmd/predictmd_unstable test-all

##############################################################################

.PHONY: docker-purge-all _docker-purge-all

.PHONY: docker-image-purge _docker-image-purge

.PHONY: docker-remove-exited-containers _docker-remove-exited-containers

.PHONY: docker-remove-all-images _docker-remove-all-images

.PHONY: docker-stop-remove-all-containers _docker-stop-remove-all-containers

.PHONY: docker-system-prune _docker-system-prune

.PHONY: docker-volume-prune _docker-volume-prune

docker-purge-all:
	$(MAKE) _docker-purge-all
	$(MAKE) _docker-purge-all
	$(MAKE) _docker-purge-all
	@echo "make docker-purge-all ran successfully"

_docker-purge-all: docker-image-purge docker-remove-exited-containers\
	docker-remove-all-images docker-stop-remove-all-containers\
	docker-system-prune docker-volume-prune

docker-image-purge:
	$(MAKE) _docker-image-purge
	$(MAKE) _docker-image-purge
	$(MAKE) _docker-image-purge

_docker-image-purge:
	$(DOCKERCMD) images purge

docker-remove-exited-containers:
	$(MAKE) _docker-remove-exited-containers
	$(MAKE) _docker-remove-exited-containers
	$(MAKE) _docker-remove-exited-containers

_docker-remove-exited-containers:
	$(DOCKERCMD) rm $(docker ps -a -f status=exited -q) || echo "None found."

docker-remove-all-images:
	$(MAKE) _docker-remove-all-images
	$(MAKE) _docker-remove-all-images
	$(MAKE) _docker-remove-all-images

_docker-remove-all-images:
	$(DOCKERCMD) rmi $(docker images -a -q) || echo "None found."

docker-stop-remove-all-containers:
	$(MAKE) _docker-stop-remove-all-containers
	$(MAKE) _docker-stop-remove-all-containers
	$(MAKE) _docker-stop-remove-all-containers

_docker-stop-remove-all-containers:
	$(DOCKERCMD) stop $(docker ps -a -q) || echo "None found."
	$(DOCKERCMD) rm $(docker ps -a -q) || echo "None found."

docker-system-prune:
	$(MAKE) _docker-system-prune
	$(MAKE) _docker-system-prune
	$(MAKE) _docker-system-prune

_docker-system-prune:
	$(DOCKERCMD) system prune --all --force

docker-volume-prune:
	$(MAKE) _docker-volume-prune
	$(MAKE) _docker-volume-prune
	$(MAKE) _docker-volume-prune

_docker-volume-prune:
	$(DOCKERCMD) volume prune --force

##############################################################################
