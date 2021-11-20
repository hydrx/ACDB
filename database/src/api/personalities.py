# from sqlalchemy import insert, delete as sqldelete
from flask import Blueprint, jsonify, abort, request
from ..models import Personality, db

bp = Blueprint('personalities', __name__, url_prefix='/personalities')

@bp.route('', methods=['GET'])
def index():
    personalities = Personality.query.all()
    result = []
    for p in personalities:
        result.append(p.serialize())
    return jsonify(result)