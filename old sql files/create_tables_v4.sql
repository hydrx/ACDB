CREATE TABLE villagers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    species TEXT NOT NULL,
    subtype CHAR(1),
    birthday DATE NOT NULL,
    catchphrase TEXT NOT NULL,
    hobby TEXT,
    fav_color TEXT,
    fav_song TEXT,
    is_sanrio BOOL,
    personality_id INT,
    coffee_id INT,
    amiibo_id INT,
    CONSTRAINT fk_villagers_personalities
        FOREIGN KEY (personality_id) REFERENCES personalities
        ON DELETE SET NULL,
    CONSTRAINT fk_villagers_coffees
        FOREIGN KEY (coffee_id) REFERENCES coffees
        ON DELETE SET NULL,
    CONSTRAINT fk_villagers_amiibos
        FOREIGN KEY (amiibo_id) REFERENCES amiibos
        ON DELETE SET NULL
);

CREATE TABLE personalities(
    id SERIAL PRIMARY KEY,
    type TEXT NOT NULL UNIQUE,
    gender TEXT NOT NULL
);

CREATE TABLE coffees(
    id SERIAL PRIMARY KEY,
    beans TEXT NOT NULL,
    milk INT NOT NULL,
    sugar INT NOT NULL
);

CREATE TABLE games(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    console TEXT NOT NULL,
    year INT NOT NULL
);

CREATE TABLE games_villagers(
    game_id INT DEFAULT 4,
    villager_id INT,
    PRIMARY KEY (game_id, villager_id),
    CONSTRAINT fk_games_villagers_games
        FOREIGN KEY (game_id) REFERENCES games
        ON DELETE SET DEFAULT,
    CONSTRAINT fk_games_villagers_villagers
        FOREIGN KEY (villager_id) REFERENCES villagers
        ON DELETE CASCADE
);

CREATE TABLE houses(
    id SERIAL PRIMARY KEY,
    wallpaper TEXT NOT NULL,
    floor TEXT NOT NULL,
    music TEXT,
    villager_id INT,
    CONSTRAINT fk_houses_villagers
        FOREIGN KEY (villager_id) REFERENCES villagers
        ON DELETE SET NULL
);

CREATE TABLE games_houses(
    game_id INT DEFAULT 4,
    house_id INT,
    PRIMARY KEY (game_id, house_id),
    CONSTRAINT fk_games_houses_games
        FOREIGN KEY (game_id) REFERENCES games
        ON DELETE SET DEFAULT,
    CONSTRAINT fk_games_houses_houses
        FOREIGN KEY (house_id) REFERENCES houses
        ON DELETE CASCADE
);

CREATE TABLE furnitures(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    style TEXT,
    buy_price MONEY NOT NULL,
    sell_price MONEY NOT NULL,
    on_surface BOOL,
    length INT,
    width INT
);

CREATE TABLE houses_furnitures(
    house_id INT,
    furniture_id INT,
    PRIMARY KEY (house_id, furniture_id),
    CONSTRAINT fk_houses_furnitures_houses
        FOREIGN KEY (house_id) REFERENCES houses
        ON DELETE CASCADE,
    CONSTRAINT fk_houses_furnitures_furnitures
        FOREIGN KEY (furniture_id) REFERENCES furnitures
        ON DELETE CASCADE
);

CREATE TABLE amiibos(
    id SERIAL PRIMARY KEY,
    series TEXT NOT NULL UNIQUE,
    card_id INT NOT NULL,
    villager_id INT,
    CONSTRAINT fk_amiibos_villagers
        FOREIGN KEY (villager_id) REFERENCES villagers
        ON DELETE SET NULL
);

CREATE TABLE nfc_tags(
    id SERIAL PRIMARY KEY,
    written BOOL NOT NULL,
    drawn BOOL NOT NULL,
    amiibo_id INT,
    CONSTRAINT fk_nfc_tags_amiibos
        FOREIGN KEY (amiibo_id) REFERENCES amiibos
        ON DELETE CASCADE
);