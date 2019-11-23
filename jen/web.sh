#!/bin/bash
nginx
python3 -m venv venv
. venv/bin/activate
pip3 install -e .
pip3 install --upgrade pip
export FLASK_APP=js_example
LC_ALL=en_US.utf8
export LC_ALL
flask run

