#!/usr/bin/env python

# Import flask web service
from flask import Flask
# Set flask app environment
app = Flask(__name__)

# Define what happens when we hit the root page /
@app.route('/')
def hello():
    # Set the content to return
    body="""
<h1>Hello</h1>
<h3>Welcome to Python through Jenkins</h3>
<p><img src='/static/pylogo.png'></p>
    """
    # Return the HTML
    return body

# Start the Flask app in Developer mode
if __name__ == "__main__":
    app.run(host="0.0.0.0",port=80)