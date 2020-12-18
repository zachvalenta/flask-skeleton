# what is this?

Scaffold for Flask demo apps

# how to use?

* __dependencies__: `poetry install`
* __env var__: `ln -sf .env.dev .env`
* __Git hooks__: `make hooks`
* __run__: `make flask`
* __hit healthcheck__: `make hc`
* __everything else__: `make help`

```Makefile
======================================================================

🛠  UTILS

flask:      start built-in Flask dev server
hc:         hit healthcheck
guni:       start gunicorn app server
uwsgi:      start uWSGI app server

📊 CODE QUALITY

test:       run unit tests, view basic coverage report in terminal
cov:        view HTML coverage report in browser
lint:       lint using flake8
fmt:        autoformat using black
hooks:      set Git hooks w/ pre-commit

📦 DEPENDENCIES

venv:       show environment info
deps:       list prod dependencies
export:     export deps to requirements.txt

======================================================================
```
