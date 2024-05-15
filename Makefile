setup:
	@make build
	@make up
	@make restart
	@make stop
	@make down
build:
	docker-compose build --no-cache --force-rm
up:
	docker-compose up -d
restart:
	docker-compose restart
stop:
	docker-compose stop
down:
	docker-compose down
