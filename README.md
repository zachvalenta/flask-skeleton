# overview

The Flask app from which all my other Flask apps derive.

# run locally

* `cp -r <this-repo> <new-project>`
* `rm .env; rm .git; rm venv`
* dependencies - [make virtual environment and activate](https://github.com/zachvalenta/dotfiles/blob/master/.bash_profile#L80)
* dependencies - `make install`
* env var - `ln -sf .env.dev .env`
* run - `make flask`
* commit
* everything else - `make help`

```sh
======================================================================

🛠 UTILS

flask:      start built-in Flask dev server
get:        hit index endpoint

📊 CODE QUALITY

test:       run unit tests, view basic coverage report in terminal
cov:        view HTML coverage report in browser
lint:       lint using flake8
fmt:        autoformat using black

📦 DEPENDENCIES

deps:       display dependency graph
install:    install dependencies from requirements.txt
purge:      remove any installed pkg *not* in requirements.txt
freeze:     freeze dependencies into requirements.txt

======================================================================
```
