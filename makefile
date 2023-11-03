include .env

build-image:
	docker build -t skaffaleapp-image .

run-container:
	docker run -d -p 3000:3000 --name skaffaleapp-container skaffaleapp-image

connect-to-container:
	docker exec -it skaffaleapp-container /bin/bash

build:
	docker compose up --build -d --remove-orphans

initialize-database:
	docker exec -d skaffaleapp-container node /skaffaleapp/database/setup/setup.js

dump-database:
	@docker exec -i skaffaledatabase-container \
		/bin/bash -c "PGPASSWORD=${POSTGRES_PASSWORD} pg_dump --username ${POSTGRES_USER} ${POSTGRES_DATABASE}" > ./$$(date -Idate)_${POSTGRES_DATABASE}_dump.sql

restore-dump:
	@read -p "Enter Dump File Path:" dumpFilePath
	@docker exec -i skaffaledatabase-container \
		/bin/bash -c "PGPASSWORD=${POSTGRES_PASSWORD} psql --username ${POSTGRES_USER} ${POSTGRES_DATABASE}" < $$dumpFilePath

clean:
	docker-compose down