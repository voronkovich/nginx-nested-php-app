USER_ID=$(shell id -u)
GROUP_ID=$(shell id -g)

build: top nested
	docker-compose build \
		--build-arg PHP_FPM_USER=${USER_ID} \
		--build-arg PHP_FPM_GROUP=${GROUP_ID}

top:
	docker run \
		--rm \
		--user ${USER_ID}:${GROUP_ID} \
		--mount "type=bind,src=${PWD},dst=/app" \
		composer create-project symfony/symfony-demo top

nested:
	docker run \
		--rm \
		--user ${USER_ID}:${GROUP_ID} \
		--mount "type=bind,src=${PWD},dst=/app" \
		composer create-project symfony/symfony-demo nested
