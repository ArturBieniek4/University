check:
	pycodestyle *.py tests

format:
	autopep8 -v --in-place --aggressive --aggressive *.py tests/*.py

docs:
	pdoc *.py tests

test:
	python -m unittest discover

types:
	mypy server.py