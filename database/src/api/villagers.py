# from sqlalchemy import insert, delete as sqldelete
from flask import Blueprint, jsonify, abort, request
from ..models import Villager, db

bp = Blueprint('villagers', __name__, url_prefix='/villagers')


@bp.route('', methods=['GET'])
def index():
    villagers = Villager.query.all()
    result = []
    for v in villagers:
        result.append(v.serialize())
    return jsonify(result)


@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    v = Villager.query.get_or_404(id)
    return jsonify(v.serialize())


@bp.route('', methods=['POST'])
def create():
    if 'name' not in request.json or 'species' not in request.json or \
            'birthday_month' not in request.json or 'birthday_day' not in \
            request.json or 'personality_id' not in request.json:
        return abort(400)
    v = Villager(
        name=request.json['name'],
        species=request.json['species'],
        birthday_month=request.json['birthday_month'],
        birthday_day=request.json['birthday_day'],
        personality_id=request.json['personality_id'],
        subtype=request.json['subtype'],
        catchphrase=request.json['catchphrase'],
        hobby=request.json['hobby'],
        fav_color=request.json['fav_color'],
        fav_song=request.json['fav_song'],
        is_sanrio=request.json['is_sanrio'],
        coffee_id=request.json['coffee_id']
    )
    db.session.add(v)
    db.session.commit()
    return jsonify(v.serialize())


@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    v = Villager.query.get_or_404(id)
    try:
        db.session.delete(v)
        db.session.commit()
        return jsonify(True)
    except:
        return jsonify(False)
