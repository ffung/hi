import os

from flask import Blueprint, render_template

bp = Blueprint("main", __name__)
@bp.route('/')
def hello():
    name = os.environ.get('NAME', 'stranger')
    return render_template("hi.html", name=name)
