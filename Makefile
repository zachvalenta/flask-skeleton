.PHONY: test

help:
	@echo
	@echo "======================================================================"
	@echo
	@echo "🛠 UTILS"
	@echo
	@echo "flask:      start built-in Flask dev server"
	@echo "get:        hit index endpoint"
	@echo
	@echo "📊 CODE QUALITY"
	@echo
	@echo "test:    	run unit tests, view basic coverage report in terminal"
	@echo "cov:     	view HTML coverage report in browser"
	@echo "lint:     	lint using flake8"
	@echo "fmt:     	autoformat using black"
	@echo
	@echo "📦 DEPENDENCIES"
	@echo
	@echo "install:     install dependencies from requirements.txt"
	@echo "purge:       remove any installed pkg *not* in requirements.txt"
	@echo "freeze:      freeze dependencies into requirements.txt"
	@echo
	@echo "======================================================================"
	@echo

#
# 🛠 UTILS
#

flask:
	source venv/bin/activate; flask run

get:
	source venv/bin/activate; http http://localhost:5000

#
# 📊 CODE QUALITY
#

test:
	source venv/bin/activate; coverage run --source='app' -m pytest -v && coverage report -m

cov:
	source venv/bin/activate; coverage html; open htmlcov/index.html

lint:
	source venv/bin/activate; flake8 *.py

fmt:
	source venv/bin/activate; black *.py

#
# 📦 DEPENDENCIES
#

install:
	source venv/bin/activate; pip install -r requirements.txt

purge:
	@echo "🔍 - DISCOVERING UNSAVED PACKAGES\n"
	source venv/bin/activate; pip freeze > pkgs-to-rm.txt
	@echo
	@echo "📦 - UNINSTALL ALL PACKAGES\n"
	source venv/bin/activate; pip uninstall -y -r pkgs-to-rm.txt
	@echo
	@echo "♻️  - REINSTALL SAVED PACKAGES\n"
	source venv/bin/activate; pip install -r requirements.txt
	@echo
	@echo "🗑  - UNSAVED PACKAGES REMOVED\n"
	diff pkgs-to-rm.txt requirements.txt | grep '<'
	@echo
	rm pkgs-to-rm.txt
	@echo

freeze:
	source venv/bin/activate; pip freeze > requirements.txt
