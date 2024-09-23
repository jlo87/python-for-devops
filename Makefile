install:
	pip install --upgrade pip && \
	pip install -r requirements.txt

lint:
	pylint --disable=R,C *.py devopslib

test:
	python -m pytest -vvv --cov=devopslib test_*.py

format:
	black *.py devopslib/*.py

deploy:
	echo "deploy goes here"

all: install lint test format