# from sqlalchemy import insert, delete as sqldelete
from flask import Blueprint, jsonify, abort, request
from ..models import Coffee, db

bp = Blueprint('coffees', __name__, url_prefix='/coffees')

@bp.route('', methods=['GET'])
def index():
    coffees = Coffee.query.all()
    result = []
    for c in coffees:
        result.append(c.serialize())
    return jsonify(result)