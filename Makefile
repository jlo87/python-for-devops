install:
	# install commands
	pip install --upgrade pip && \
	pip install -r requirements.txt

post-install:
	python -m textblob.download_corpora

format:
	# format code
	black *.py devopslib/*.py

lint:
	# flake8 or pylint
	pylint --disable=R,C *.py devopslib

test:
	# test
	python -m pytest -vvv --cov=devopslib test_*.py

build:
	# build container
	# docker build -t deploy-fastapi .

run:
	# run docker
	# docker run -p 127.0.0.1:8080:8080 deploy-fastapi

deploy:
	# deploy
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 561744971673.dkr.ecr.us-east-1.amazonaws.com/deploy-fastapi:latest
	docker build -t deploy-fastapi .
	docker tag deploy-fastapi:latest 561744971673.dkr.ecr.us-east-1.amazonaws.com/deploy-fastapi:latest
	docker push 561744971673.dkr.ecr.us-east-1.amazonaws.com/deploy-fastapi:latest

all: install post-install format lint test deploy