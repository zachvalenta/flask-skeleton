# what is this?

Skeleton for Flask demo apps

# how to use?

* __dependencies__: `poetry install`
* __env var__: `ln -sf .env.dev .env`
* __Git hooks__: `make hooks`
* __run__: `make flask`
* __everything else__: `make help`

```Makefile
======================================================================

🛠  UTILS

flask:      start built-in Flask dev server
get:        hit index endpoint

📊 CODE QUALITY

test:       run unit tests, view basic coverage report in terminal
cov:        view HTML coverage report in browser
lint:       lint using flake8
fmt:        autoformat using black
hooks:      set Git hooks w/ pre-commit

📦 DEPENDENCIES

env:        show environment info
deps:       list prod dependencies

======================================================================
```
