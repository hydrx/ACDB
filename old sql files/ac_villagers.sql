--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: amiibos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.amiibos (
    id integer NOT NULL,
    series text NOT NULL,
    card_id integer NOT NULL
);


ALTER TABLE public.amiibos OWNER TO postgres;

--
-- Name: amiibos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.amiibos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amiibos_id_seq OWNER TO postgres;

--
-- Name: amiibos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.amiibos_id_seq OWNED BY public.amiibos.id;


--
-- Name: coffees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coffees (
    id integer NOT NULL,
    beans text NOT NULL,
    milk integer NOT NULL,
    sugar integer NOT NULL
);


ALTER TABLE public.coffees OWNER TO postgres;

--
-- Name: coffees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.coffees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.coffees_id_seq OWNER TO postgres;

--
-- Name: coffees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.coffees_id_seq OWNED BY public.coffees.id;


--
-- Name: furniture; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.furniture (
    id integer NOT NULL,
    name text NOT NULL,
    style text,
    buy_price money NOT NULL,
    sell_price money NOT NULL,
    on_surface boolean,
    length integer,
    width integer
);


ALTER TABLE public.furniture OWNER TO postgres;

--
-- Name: furniture_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.furniture_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.furniture_id_seq OWNER TO postgres;

--
-- Name: furniture_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.furniture_id_seq OWNED BY public.furniture.id;


--
-- Name: games; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.games (
    id integer NOT NULL,
    name text NOT NULL,
    console text NOT NULL,
    year integer NOT NULL
);


ALTER TABLE public.games OWNER TO postgres;

--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_id_seq OWNER TO postgres;

--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- Name: houses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.houses (
    id integer NOT NULL,
    wallpaper text NOT NULL,
    floor text NOT NULL,
    music text,
    furniture_id integer
);


ALTER TABLE public.houses OWNER TO postgres;

--
-- Name: houses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.houses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.houses_id_seq OWNER TO postgres;

--
-- Name: houses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.houses_id_seq OWNED BY public.houses.id;


--
-- Name: nfc_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nfc_tags (
    id integer NOT NULL,
    written boolean NOT NULL,
    drawn boolean NOT NULL,
    amiibo_id integer
);


ALTER TABLE public.nfc_tags OWNER TO postgres;

--
-- Name: nfc_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.nfc_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nfc_tags_id_seq OWNER TO postgres;

--
-- Name: nfc_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.nfc_tags_id_seq OWNED BY public.nfc_tags.id;


--
-- Name: personalities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personalities (
    id integer NOT NULL,
    personality text NOT NULL,
    gender text NOT NULL
);


ALTER TABLE public.personalities OWNER TO postgres;

--
-- Name: personalities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personalities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personalities_id_seq OWNER TO postgres;

--
-- Name: personalities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personalities_id_seq OWNED BY public.personalities.id;


--
-- Name: villagers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.villagers (
    id integer NOT NULL,
    name text NOT NULL,
    species text NOT NULL,
    personality_id integer,
    subtype character(1),
    birthday date NOT NULL,
    hobby text,
    catchphrase text NOT NULL,
    fav_color text,
    fav_song text,
    is_sanrio boolean,
    game_id integer,
    amiibo_id integer
);


ALTER TABLE public.villagers OWNER TO postgres;

--
-- Name: villagers_coffees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.villagers_coffees (
    villager_id integer NOT NULL,
    coffee_id integer NOT NULL
);


ALTER TABLE public.villagers_coffees OWNER TO postgres;

--
-- Name: villagers_houses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.villagers_houses (
    villager_id integer NOT NULL,
    house_id integer NOT NULL
);


ALTER TABLE public.villagers_houses OWNER TO postgres;

--
-- Name: villagers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.villagers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.villagers_id_seq OWNER TO postgres;

--
-- Name: villagers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.villagers_id_seq OWNED BY public.villagers.id;


--
-- Name: villagers_nfc_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.villagers_nfc_tags (
    villager_id integer NOT NULL,
    nfc_tag_id integer NOT NULL
);


ALTER TABLE public.villagers_nfc_tags OWNER TO postgres;

--
-- Name: amiibos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amiibos ALTER COLUMN id SET DEFAULT nextval('public.amiibos_id_seq'::regclass);


--
-- Name: coffees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coffees ALTER COLUMN id SET DEFAULT nextval('public.coffees_id_seq'::regclass);


--
-- Name: furniture id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.furniture ALTER COLUMN id SET DEFAULT nextval('public.furniture_id_seq'::regclass);


--
-- Name: games id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- Name: houses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.houses ALTER COLUMN id SET DEFAULT nextval('public.houses_id_seq'::regclass);


--
-- Name: nfc_tags id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfc_tags ALTER COLUMN id SET DEFAULT nextval('public.nfc_tags_id_seq'::regclass);


--
-- Name: personalities id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personalities ALTER COLUMN id SET DEFAULT nextval('public.personalities_id_seq'::regclass);


--
-- Name: villagers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villagers ALTER COLUMN id SET DEFAULT nextval('public.villagers_id_seq'::regclass);


--
-- Data for Name: amiibos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.amiibos (id, series, card_id) FROM stdin;
\.


--
-- Data for Name: coffees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coffees (id, beans, milk, sugar) FROM stdin;
\.


--
-- Data for Name: furniture; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.furniture (id, name, style, buy_price, sell_price, on_surface, length, width) FROM stdin;
\.


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.games (id, name, console, year) FROM stdin;
\.


--
-- Data for Name: houses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.houses (id, wallpaper, floor, music, furniture_id) FROM stdin;
\.


--
-- Data for Name: nfc_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nfc_tags (id, written, drawn, amiibo_id) FROM stdin;
\.


--
-- Data for Name: personalities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personalities (id, personality, gender) FROM stdin;
\.


--
-- Data for Name: villagers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.villagers (id, name, species, personality_id, subtype, birthday, hobby, catchphrase, fav_color, fav_song, is_sanrio, game_id, amiibo_id) FROM stdin;
\.


--
-- Data for Name: villagers_coffees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.villagers_coffees (villager_id, coffee_id) FROM stdin;
\.


--
-- Data for Name: villagers_houses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.villagers_houses (villager_id, house_id) FROM stdin;
\.


--
-- Data for Name: villagers_nfc_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.villagers_nfc_tags (villager_id, nfc_tag_id) FROM stdin;
\.


--
-- Name: amiibos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.amiibos_id_seq', 1, false);


--
-- Name: coffees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coffees_id_seq', 1, false);


--
-- Name: furniture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.furniture_id_seq', 1, false);


--
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.games_id_seq', 1, false);


--
-- Name: houses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.houses_id_seq', 1, false);


--
-- Name: nfc_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.nfc_tags_id_seq', 1, false);


--
-- Name: personalities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personalities_id_seq', 1, false);


--
-- Name: villagers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.villagers_id_seq', 1, false);


--
-- Name: amiibos amiibos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amiibos
    ADD CONSTRAINT amiibos_pkey PRIMARY KEY (id);


--
-- Name: amiibos amiibos_series_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amiibos
    ADD CONSTRAINT amiibos_series_key UNIQUE (series);


--
-- Name: coffees coffees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coffees
    ADD CONSTRAINT coffees_pkey PRIMARY KEY (id);


--
-- Name: furniture furniture_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.furniture
    ADD CONSTRAINT furniture_name_key UNIQUE (name);


--
-- Name: furniture furniture_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.furniture
    ADD CONSTRAINT furniture_pkey PRIMARY KEY (id);


--
-- Name: games games_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_name_key UNIQUE (name);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: houses houses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.houses
    ADD CONSTRAINT houses_pkey PRIMARY KEY (id);


--
-- Name: nfc_tags nfc_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfc_tags
    ADD CONSTRAINT nfc_tags_pkey PRIMARY KEY (id);


--
-- Name: personalities personalities_personality_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personalities
    ADD CONSTRAINT personalities_personality_key UNIQUE (personality);


--
-- Name: personalities personalities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personalities
    ADD CONSTRAINT personalities_pkey PRIMARY KEY (id);


--
-- Name: villagers_coffees villagers_coffees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villagers_coffees
    ADD CONSTRAINT villagers_coffees_pkey PRIMARY KEY (villager_id, coffee_id);


--
-- Name: villagers_houses villagers_houses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villagers_houses
    ADD CONSTRAINT villagers_houses_pkey PRIMARY KEY (villager_id, house_id);


--
-- Name: villagers villagers_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villagers
    ADD CONSTRAINT villagers_name_key UNIQUE (name);


--
-- Name: villagers_nfc_tags villagers_nfc_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villagers_nfc_tags
    ADD CONSTRAINT villagers_nfc_tags_pkey PRIMARY KEY (villager_id, nfc_tag_id);


--
-- Name: villagers villagers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villagers
    ADD CONSTRAINT villagers_pkey PRIMARY KEY (id);


--
-- Name: houses fk_houses_furniture; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.houses
    ADD CONSTRAINT fk_houses_furniture FOREIGN KEY (furniture_id) REFERENCES public.furniture(id);


--
-- Name: nfc_tags fk_nfc_tag_amiibo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfc_tags
    ADD CONSTRAINT fk_nfc_tag_amiibo FOREIGN KEY (amiibo_id) REFERENCES public.amiibos(id);


--
-- Name: villagers fk_villager_amiibo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villagers
    ADD CONSTRAINT fk_villager_amiibo FOREIGN KEY (amiibo_id) REFERENCES public.amiibos(id);


--
-- Name: villagers fk_villager_game; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villagers
    ADD CONSTRAINT fk_villager_game FOREIGN KEY (game_id) REFERENCES public.games(id);


--
-- Name: villagers fk_villager_personality; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villagers
    ADD CONSTRAINT fk_villager_personality FOREIGN KEY (personality_id) REFERENCES public.personalities(id);


--
-- Name: villagers_coffees fk_villagers_coffees_coffees; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villagers_coffees
    ADD CONSTRAINT fk_villagers_coffees_coffees FOREIGN KEY (coffee_id) REFERENCES public.coffees(id);


--
-- Name: villagers_coffees fk_villagers_coffees_villagers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villagers_coffees
    ADD CONSTRAINT fk_villagers_coffees_villagers FOREIGN KEY (villager_id) REFERENCES public.villagers(id);


--
-- Name: villagers_houses fk_villagers_houses_houses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villagers_houses
    ADD CONSTRAINT fk_villagers_houses_houses FOREIGN KEY (house_id) REFERENCES public.houses(id);


--
-- Name: villagers_houses fk_villagers_houses_villagers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villagers_houses
    ADD CONSTRAINT fk_villagers_houses_villagers FOREIGN KEY (villager_id) REFERENCES public.villagers(id);


--
-- Name: villagers_nfc_tags fk_villagers_nfc_tags_nfc_tags; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villagers_nfc_tags
    ADD CONSTRAINT fk_villagers_nfc_tags_nfc_tags FOREIGN KEY (nfc_tag_id) REFERENCES public.nfc_tags(id);


--
-- Name: villagers_nfc_tags fk_villagers_nfc_tags_villagers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villagers_nfc_tags
    ADD CONSTRAINT fk_villagers_nfc_tags_villagers FOREIGN KEY (villager_id) REFERENCES public.villagers(id);


--
-- PostgreSQL database dump complete
--

