#!/usr/bin/env python

from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello():
    body="""
<h1>Hello</h1>
<h3>Welcome to Python through Jenkins</h3>
<p><img src='/static/pylogo.png'></p>
    """
    return body

if __name__ == "__main__":
    app.run(host="0.0.0.0",port=80)