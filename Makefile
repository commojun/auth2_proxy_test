PHOTNY: build

build:
	docker build --no-cache -t commojun/oauth2-proxy-test:latest .

up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -f

shell:
	docker compose exec nginx bash
