include /code/containers/s2ipythonlibrary/Makefile

clean:
	# Remove the build
	rm -rf build dist
	# And all of our pyc files
	find . -name '*.pyc' -delete
	# And lastly, .coverage files
	find . -name .coverage -delete

.PHONY: test
test:
	rm -f .coverage
	nosetests --exe --cover-package=nsq --with-coverage --cover-branches -v --logging-clear-handlers

requirements:
	pip freeze | grep -v -e nsq-py > requirements.txt
