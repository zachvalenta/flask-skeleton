.PHONY: test export

help:
	@echo
	@echo "======================================================================"
	@echo
	@echo "🛠  UTILS"
	@echo
	@echo "flask:      start built-in Flask dev server"
	@echo "hc:         hit healthcheck"
	@echo "guni:       start gunicorn app server"
	@echo "uwsgi:      start uWSGI app server"
	@echo
	@echo "📊 CODE QUALITY"
	@echo
	@echo "test:       run unit tests, view basic coverage report in terminal"
	@echo "cov:        view HTML coverage report in browser"
	@echo "lint:       lint using flake8"
	@echo "fmt:        autoformat using black"
	@echo "hooks:      set Git hooks w/ pre-commit"
	@echo
	@echo "📦 DEPENDENCIES"
	@echo
	@echo "venv:       show environment info"
	@echo "deps:       list prod dependencies"
	@echo "export:     export deps to requirements.txt"
	@echo
	@echo "======================================================================"
	@echo

#
# 🛠 UTILS
#

flask:
	poetry run flask run

hc:
	curl -w "\n" "http://127.0.0.1:5000/"

guni:
	poetry run gunicorn -b 127.0.0.1:5001 app:app

uwsgi:
	poetry run uwsgi --http :5002 --wsgi-file app.py --callable app

#
# 📊 CODE QUALITY
#

test:
	poetry run coverage run --source='app' -m pytest -v && poetry run coverage report -m

cov:
	poetry run coverage html; open htmlcov/index.html

lint:
	poetry run flake8 *.py

fmt:
	poetry run isort *.py; poetry run black *.py

hooks:
	poetry run pre-commit install -t pre-commit; poetry run pre-commit install -t pre-push

#
# 📦 DEPENDENCIES
#

venv:
	poetry env info

deps:
	poetry show --tree --no-dev

export:
	poetry export -f requirements.txt > requirements.txt

