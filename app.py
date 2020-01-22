import os

from dotenv import find_dotenv, load_dotenv
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

"""
CONF
"""

# db - load env, construct path
load_dotenv(find_dotenv())
basedir = os.path.abspath(os.path.dirname(__file__))
db_path = os.path.join(basedir, os.getenv("DATABASE"))
db_uri = "sqlite:///" + db_path

# app - init, config
app = Flask(__name__)
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_DATABASE_URI"] = db_uri

# db - init
db = SQLAlchemy(app)

"""
MODELS
"""


class Thing(db.Model):
    thing_id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(30))
    description = db.Column(db.Text)

    def __repr__(self):
        return f"id {self.thing_id} name {self.name} desc {self.description}"


"""
ROUTES
"""


@app.route("/")
def index():
    return "new flask app"
