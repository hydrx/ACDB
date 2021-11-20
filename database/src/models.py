from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# Reference:
# https://flask-sqlalchemy.palletsprojects.com/en/2.x/models/
# https://docs.sqlalchemy.org/en/14/core/metadata.html#sqlalchemy.schema.Column
# https://flask-sqlalchemy.palletsprojects.com/en/2.x/models/#many-to-many-relationships


class Villager(db.Model):
    __tablename__ = 'villagers'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(12), unique=True, nullable=False)
    species = db.Column(db.String(12), nullable=False)
    birthday_month = db.Column(db.Integer, nullable=False)
    birthday_day = db.Column(db.Integer, nullable=False)
    catchphrase = db.Column(db.String(12))
    hobby = db.Column(db.String(12))
    fav_color = db.Column(db.String(12))
    fav_song = db.Column(db.String(12))
    is_sanrio = db.Column(db.Boolean)
    subtype = db.Column(db.String(1))
    personality_id = db.Column(db.Integer,
                               db.ForeignKey('personalities.id'),
                               nullable=False)
    coffee_id = db.Column(db.Integer,
                          db.ForeignKey('coffees.id'))
    houses = db.relationship('House', backref='villager')
    amiibo = db.relationship('Amiibo', backref='villager', uselist=False)

    def __init__(self, name: str, species: str, birthday_month: int,
                 birthday_day: int, personality_id: int, subtype: str,
                 catchphrase: str, hobby: str, fav_color: str,
                 fav_song: str, is_sanrio: bool, coffee_id: int):
        self.name = name
        self.species = species
        self.birthday_month = birthday_month
        self.birthday_day = birthday_day
        self.personality_id = personality_id
        # self.subtype = subtype
        # self.catchphrase = catchphrase
        # self.hobby = hobby
        # self.fav_color = fav_color
        # self.fav_song = fav_song
        # self.is_sanrio = is_sanrio
        # self.coffee_id = coffee_id

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'species': self.species,
            'birthday_month': self.birthday_month,
            'birthday_day': self.birthday_day,
            'personality_id': self.personality_id,
            'subtype': self.subtype,
            'catchphrase': self.catchphrase,
            'hobby': self.hobby,
            'fav_color': self.fav_color,
            'fav_song': self.fav_song,
            'is_sanrio': self.is_sanrio,
            'coffee_id': self.coffee_id
        }


class Personality(db.Model):
    __tablename__ = 'personalities'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    type = db.Column(db.String(12), unique=True, nullable=False)
    gender = db.Column(db.String(12), nullable=False)
    villagers = db.relationship('Villager', backref='personality')

    def __init__(self, type: str, gender: str):
        self.type = type
        self.gender = gender

    def serialize(self):
        return {
            'id': self.id,
            'type': self.type,
            'gender': self.gender
        }


class Coffee(db.Model):
    __tablename__ = 'coffees'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    beans = db.Column(db.String(20), nullable=False)
    milk = db.Column(db.Integer, nullable=False)
    sugar = db.Column(db.Integer, nullable=False)
    villagers = db.relationship('Villager', backref='coffee')

    def __init__(self, beans: str, milk: int, sugar: int):
        self.beans = beans
        self.milk = milk
        self.sugar = sugar

    def serialize(self):
        return {
            'id': self.id,
            'beans': self.beans,
            'milk': self.milk,
            'sugar': self.sugar
        }


villagers_games = db.Table(
    'villagers_games',
    db.Column(
        'villager_id', db.Integer, db.ForeignKey('villagers.id'),
        primary_key=True
    ),
    db.Column(
        'game_id', db.Integer, db.ForeignKey('games.id'), primary_key=True
    )
)


houses_games = db.Table(
    'houses_games',
    db.Column(
        'house_id', db.Integer, db.ForeignKey('houses.id'),
        primary_key=True
    ),
    db.Column(
        'game_id', db.Integer, db.ForeignKey('games.id'),
        primary_key=True
    )
)


class Game(db.Model):
    __tablename__ = 'games'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(20), unique=True, nullable=False)
    console = db.Column(db.String(12), nullable=False)
    year_released = db.Column(db.Integer, nullable=False)
    villagers = db.relationship(
        'Villager',
        secondary=villagers_games,
        lazy='subquery',
        backref=db.backref('in_game', lazy=True)
    )
    houses = db.relationship(
        'House',
        secondary=houses_games,
        lazy='subquery',
        backref=db.backref('in_game', lazy=True)
    )

    def __init__(self, name: str, console: str, year_released: int):
        self.name = name
        self.console = console
        self.year_released = year_released

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'console': self.console,
            'year_released': self.year_released
        }


class House(db.Model):
    __tablename__ = 'houses'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    wallpaper = db.Column(db.String(12), nullable=False)
    floor = db.Column(db.String(12), nullable=False)
    music = db.Column(db.String(12))
    villager_id = db.Column(db.Integer, db.ForeignKey('villagers.id'),
                            nullable=False)

    def __init__(self, wallpaper: str, floor: str, music: int, villager_id:
                 int):
        self.wallpaper = wallpaper
        self.floor = floor
        self.music = music
        self.villager_id = villager_id

    def serialize(self):
        return {
            'id': self.id,
            'wallpaper': self.wallpaper,
            'floor': self.floor,
            'music': self.music,
            'villager_id': self.villager_id
        }

houses_furniture = db.Table(
    'houses_furniture',
    db.Column(
        'house_id', db.Integer, db.ForeignKey('houses.id'),
        primary_key=True
    ),
    db.Column(
        'furniture_id', db.Integer, db.ForeignKey('furniture.id'),
        primary_key=True
    )
)


class Furniture(db.Model):
    __tablename__ = 'furniture'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(20), unique=True, nullable=False)
    buy_price = db.Column(db.Integer, nullable=False)
    sell_price = db.Column(db.Integer, nullable=False)
    style = db.Column(db.String(20))
    on_surface = db.Column(db.Boolean)
    length = db.Column(db.Integer)
    width = db.Column(db.Integer)
    houses = db.relationship(
        'House',
        secondary=houses_furniture,
        lazy='subquery',
        backref=db.backref('furniture', lazy=True)
    )

    def __init__(self, name: str, buy_price: int, sell_price: int,
                 style: str, on_surface: bool, length: int, width: int):
        self.name = name
        self.buy_price = buy_price
        self.sell_price = sell_price
        self.style = style
        self.on_surface = on_surface
        self.length = length
        self.width = width

    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'buy_price': self.buy_price,
            'sell_price': self.sell_price,
            'style': self.style,
            'on_surface': self.on_surface,
            'length': self.length,
            'width': self.width
        }


class Amiibo(db.Model):
    __tablename__ = 'amiibos'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    series = db.Column(db.String(20), unique=True, nullable=False)
    card_id = db.Column(db.Integer, nullable=False)
    villager_id = db.Column(db.Integer, db.ForeignKey('villagers.id'),
                            nullable=False)
    nfc_tag = db.relationship('NfcTag', backref='amiibo')

    def __init__(self, series: str, card_id: int, villager_id: int):
        self.series = series
        self.card_id = card_id
        self.villager_id = villager_id

    def serialize(self):
        return {
            'id': self.id,
            'series': self.series,
            'card_id': self.card_id,
            'villager_id': self.villager_id
        }

class NfcTag(db.Model):
    __tablename__ = 'nfc_tags'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    written = db.Column(db.Boolean, nullable=False)
    drawn = db.Column(db.Boolean, nullable=False)
    amiibo_id = db.Column(db.Integer, db.ForeignKey('amiibos.id'),
                          nullable=False)

    def __init__(self, amiibo_id: int, written: bool, drawn: bool):
        self.amiibo_id = amiibo_id
        self.written = written
        self.drawn = drawn

    def serialize(self):
        return {
            'id': self.id,
            'amiibo_id': self.amiibo_id,
            'written': self.written,
            'drawn': self.drawn
        }