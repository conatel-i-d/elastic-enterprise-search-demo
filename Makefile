.PHONY: logs up down

build:
	cd enterprise-search ;\
		docker build -t elastic/enterprise-search . ;\
		cd ..

logs:
	docker-compose logs -f

up:
	docker-compose up -d --force-recreate

down:
	docker-compose down

setup-password:
	docker exec -it elasticsearch bin/elasticsearch-setup-passwords auto

elasticsearch:
	docker exec -it elasticsearch /bin/bash

kibana:
	docker exec -it kibana /bin/bash

restart: down up
