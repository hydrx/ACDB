import itertools
from src.models import Personality, Coffee, Game, db
from src import create_app


app = create_app()
app.app_context().push()
# Personality.query.delete()
# Coffee.query.delete()
# Game.query.delete()
# db.session.commit()

# Add personality values

normal = Personality(type='normal', gender='female')
peppy = Personality(type='peppy', gender='female')
snooty = Personality(type='snooty', gender='female')
uchi = Personality(type='uchi', gender='female')
lazy = Personality(type='lazy', gender='male')
jock = Personality(type='jock', gender='male')
smug = Personality(type='smug', gender='male')
cranky = Personality(type='cranky', gender='male')

personalities = [normal, peppy, snooty, uchi, lazy, jock, smug, cranky]
for p in personalities:
    db.session.add(p)
db.session.commit()

# Add coffee values

combo = [['Blue Mtn', 'Kilimanjaro', 'Mocha', 'Blend'],
         [0, 1, 2, 3],
         [0, 1, 2, 3]]
blends = list(itertools.product(*combo))
coffees = []
for b in blends:
    c = Coffee(beans=b[0], milk=b[1], sugar=b[2])
    coffees.append(c)

for c in coffees:
    db.session.add(c)
db.session.commit()

# Add game values

ac = Game(name='Animal Crossing', console='Gamecube', year_released=2002)
ww = Game(name='Wild World', console='DS', year_released=2005)
cf = Game(name='City Folk', console='Wii', year_released=2008)
nl = Game(name='New Leaf', console='3DS', year_released=2012)
nh = Game(name='New Horizons', console='Switch', year_released=2020)

games = [ac, ww, cf, nl, nh]
for g in games:
    db.session.add(g)
db.session.commit()
