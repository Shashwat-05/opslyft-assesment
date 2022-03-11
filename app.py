"""will help to read env vars"""
from os import environ
from flask import Flask

#msg = environ("msg")

app = Flask(__name__)

@app.route("/")
def hello_world():
    """basic html msg"""
    return f"{environ['msg']}"
