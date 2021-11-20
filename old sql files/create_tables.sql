CREATE TABLE villagers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    species TEXT NOT NULL,
    personality_id INT,
    subtype CHAR(1),
    birthday DATE NOT NULL,
    hobby TEXT,
    catchphrase TEXT NOT NULL,
    fav_color TEXT,
    fav_song TEXT,
    is_sanrio BOOL,
    game_id INT,
    amiibo_id INT
);

CREATE TABLE personalities(
    id SERIAL PRIMARY KEY,
    personality TEXT NOT NULL UNIQUE,
    gender TEXT NOT NULL
);

CREATE TABLE coffees(
    id SERIAL PRIMARY KEY,
    beans TEXT NOT NULL,
    milk INT NOT NULL,
    sugar INT NOT NULL
);

CREATE TABLE villagers_coffees(
    villager_id INT,
    coffee_id INT,
    PRIMARY KEY (villager_id, coffee_id)
);

CREATE TABLE games(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    console TEXT NOT NULL,
    year INT NOT NULL
);

CREATE TABLE houses(
    id SERIAL PRIMARY KEY,
    wallpaper TEXT NOT NULL,
    floor TEXT NOT NULL,
    music TEXT,
    furniture_id INT
);

CREATE TABLE villagers_houses (
    villager_id INT,
    house_id INT,
    PRIMARY KEY (villager_id, house_id)
);

CREATE TABLE furniture(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    style TEXT,
    buy_price MONEY NOT NULL,
    sell_price MONEY NOT NULL,
    on_surface BOOL,
    length INT,
    width INT
);

CREATE TABLE amiibos(
    id SERIAL PRIMARY KEY,
    series TEXT NOT NULL UNIQUE,
    card_id INT NOT NULL
);

CREATE TABLE nfc_tags(
    id SERIAL PRIMARY KEY,
    written BOOL NOT NULL,
    drawn BOOL NOT NULL,
    amiibo_id INT
);

CREATE TABLE villagers_nfc_tags(
    villager_id INT,
    nfc_tag_id INT,
    PRIMARY KEY (villager_id, nfc_tag_id)
);

ALTER TABLE villagers
ADD CONSTRAINT fk_villager_personality
FOREIGN KEY (personality_id)
REFERENCES personalities;

ALTER TABLE villagers
ADD CONSTRAINT fk_villager_game
FOREIGN KEY (game_id)
REFERENCES games;

ALTER TABLE villagers
ADD CONSTRAINT fk_villager_amiibo
FOREIGN KEY (amiibo_id)
REFERENCES amiibos;

ALTER TABLE houses
ADD CONSTRAINT fk_houses_furniture
FOREIGN KEY (furniture_id)
REFERENCES furniture;

ALTER TABLE nfc_tags
ADD CONSTRAINT fk_nfc_tag_amiibo
FOREIGN KEY (amiibo_id)
REFERENCES amiibos;

ALTER TABLE villagers_coffees
ADD CONSTRAINT fk_villagers_coffees_villagers
FOREIGN KEY (villager_id)
REFERENCES villagers;

ALTER TABLE villagers_coffees
ADD CONSTRAINT fk_villagers_coffees_coffees
FOREIGN KEY (coffee_id)
REFERENCES coffees;

ALTER TABLE villagers_houses
ADD CONSTRAINT fk_villagers_houses_villagers
FOREIGN KEY (villager_id)
REFERENCES villagers;

ALTER TABLE villagers_houses
ADD CONSTRAINT fk_villagers_houses_houses
FOREIGN KEY (house_id)
REFERENCES houses;

ALTER TABLE villagers_nfc_tags
ADD CONSTRAINT fk_villagers_nfc_tags_villagers
FOREIGN KEY (villager_id)
REFERENCES villagers;

ALTER TABLE villagers_nfc_tags
ADD CONSTRAINT fk_villagers_nfc_tags_nfc_tags
FOREIGN KEY (nfc_tag_id)
REFERENCES nfc_tags;