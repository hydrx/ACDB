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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: amiibos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.amiibos (
    id integer NOT NULL,
    series character varying(20) NOT NULL,
    card_id integer NOT NULL,
    villager_id integer NOT NULL
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
    beans character varying(12) NOT NULL,
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
    name character varying(20) NOT NULL,
    buy_price integer NOT NULL,
    sell_price integer NOT NULL,
    style character varying(20),
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
    name character varying(20) NOT NULL,
    console character varying(12) NOT NULL,
    year_released integer NOT NULL
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
    wallpaper character varying(12) NOT NULL,
    floor character varying(12) NOT NULL,
    music character varying(12),
    villager_id integer NOT NULL
);


ALTER TABLE public.houses OWNER TO postgres;

--
-- Name: houses_furniture; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.houses_furniture (
    house_id integer NOT NULL,
    furniture_id integer NOT NULL
);


ALTER TABLE public.houses_furniture OWNER TO postgres;

--
-- Name: houses_games; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.houses_games (
    house_id integer NOT NULL,
    game_id integer NOT NULL
);


ALTER TABLE public.houses_games OWNER TO postgres;

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
    amiibo_id integer NOT NULL
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
    type character varying(12) NOT NULL,
    gender character varying(12) NOT NULL
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
    name character varying(12) NOT NULL,
    species character varying(12) NOT NULL,
    birthday_month integer NOT NULL,
    birthday_day integer NOT NULL,
    catchphrase character varying(12),
    hobby character varying(12),
    fav_color character varying(12),
    fav_song character varying(12),
    is_sanrio boolean,
    subtype character varying(1),
    personality_id integer NOT NULL,
    coffee_id integer
);


ALTER TABLE public.villagers OWNER TO postgres;

--
-- Name: villagers_games; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.villagers_games (
    villager_id integer NOT NULL,
    game_id integer NOT NULL
);


ALTER TABLE public.villagers_games OWNER TO postgres;

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
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
60480e1b6d62
\.


--
-- Data for Name: amiibos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.amiibos (id, series, card_id, villager_id) FROM stdin;
\.


--
-- Data for Name: coffees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coffees (id, beans, milk, sugar) FROM stdin;
1	Blue Mtn	0	0
2	Blue Mtn	0	1
3	Blue Mtn	0	2
4	Blue Mtn	0	3
5	Blue Mtn	1	0
6	Blue Mtn	1	1
7	Blue Mtn	1	2
8	Blue Mtn	1	3
9	Blue Mtn	2	0
10	Blue Mtn	2	1
11	Blue Mtn	2	2
12	Blue Mtn	2	3
13	Blue Mtn	3	0
14	Blue Mtn	3	1
15	Blue Mtn	3	2
16	Blue Mtn	3	3
17	Kilimanjaro	0	0
18	Kilimanjaro	0	1
19	Kilimanjaro	0	2
20	Kilimanjaro	0	3
21	Kilimanjaro	1	0
22	Kilimanjaro	1	1
23	Kilimanjaro	1	2
24	Kilimanjaro	1	3
25	Kilimanjaro	2	0
26	Kilimanjaro	2	1
27	Kilimanjaro	2	2
28	Kilimanjaro	2	3
29	Kilimanjaro	3	0
30	Kilimanjaro	3	1
31	Kilimanjaro	3	2
32	Kilimanjaro	3	3
33	Mocha	0	0
34	Mocha	0	1
35	Mocha	0	2
36	Mocha	0	3
37	Mocha	1	0
38	Mocha	1	1
39	Mocha	1	2
40	Mocha	1	3
41	Mocha	2	0
42	Mocha	2	1
43	Mocha	2	2
44	Mocha	2	3
45	Mocha	3	0
46	Mocha	3	1
47	Mocha	3	2
48	Mocha	3	3
49	Blend	0	0
50	Blend	0	1
51	Blend	0	2
52	Blend	0	3
53	Blend	1	0
54	Blend	1	1
55	Blend	1	2
56	Blend	1	3
57	Blend	2	0
58	Blend	2	1
59	Blend	2	2
60	Blend	2	3
61	Blend	3	0
62	Blend	3	1
63	Blend	3	2
64	Blend	3	3
\.


--
-- Data for Name: furniture; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.furniture (id, name, buy_price, sell_price, style, on_surface, length, width) FROM stdin;
\.


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.games (id, name, console, year_released) FROM stdin;
1	Animal Crossing	Gamecube	2002
2	Wild World	DS	2005
3	City Folk	Wii	2008
4	New Leaf	3DS	2012
5	New Horizons	Switch	2020
\.


--
-- Data for Name: houses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.houses (id, wallpaper, floor, music, villager_id) FROM stdin;
\.


--
-- Data for Name: houses_furniture; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.houses_furniture (house_id, furniture_id) FROM stdin;
\.


--
-- Data for Name: houses_games; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.houses_games (house_id, game_id) FROM stdin;
\.


--
-- Data for Name: nfc_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nfc_tags (id, written, drawn, amiibo_id) FROM stdin;
\.


--
-- Data for Name: personalities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personalities (id, type, gender) FROM stdin;
1	normal	female
2	peppy	female
3	snooty	female
4	uchi	female
5	lazy	male
6	jock	male
7	smug	male
8	cranky	male
\.


--
-- Data for Name: villagers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.villagers (id, name, species, birthday_month, birthday_day, catchphrase, hobby, fav_color, fav_song, is_sanrio, subtype, personality_id, coffee_id) FROM stdin;
1	maddie	dog	1	11	yippee	play	pink	K.K. Stroll	f	A	2	16
\.


--
-- Data for Name: villagers_games; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.villagers_games (villager_id, game_id) FROM stdin;
\.


--
-- Name: amiibos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.amiibos_id_seq', 1, false);


--
-- Name: coffees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coffees_id_seq', 64, true);


--
-- Name: furniture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.furniture_id_seq', 1, false);


--
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.games_id_seq', 5, true);


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

SELECT pg_catalog.setval('public.personalities_id_seq', 8, true);


--
-- Name: villagers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.villagers_id_seq', 1, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


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
-- Name: houses_furniture houses_furniture_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.houses_furniture
    ADD CONSTRAINT houses_furniture_pkey PRIMARY KEY (house_id, furniture_id);


--
-- Name: houses_games houses_games_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.houses_games
    ADD CONSTRAINT houses_games_pkey PRIMARY KEY (house_id, game_id);


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
-- Name: personalities personalities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personalities
    ADD CONSTRAINT personalities_pkey PRIMARY KEY (id);


--
-- Name: personalities personalities_type_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personalities
    ADD CONSTRAINT personalities_type_key UNIQUE (type);


--
-- Name: villagers_games villagers_games_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villagers_games
    ADD CONSTRAINT villagers_games_pkey PRIMARY KEY (villager_id, game_id);


--
-- Name: villagers villagers_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villagers
    ADD CONSTRAINT villagers_name_key UNIQUE (name);


--
-- Name: villagers villagers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villagers
    ADD CONSTRAINT villagers_pkey PRIMARY KEY (id);


--
-- Name: amiibos amiibos_villager_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.amiibos
    ADD CONSTRAINT amiibos_villager_id_fkey FOREIGN KEY (villager_id) REFERENCES public.villagers(id);


--
-- Name: houses_furniture houses_furniture_furniture_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.houses_furniture
    ADD CONSTRAINT houses_furniture_furniture_id_fkey FOREIGN KEY (furniture_id) REFERENCES public.furniture(id);


--
-- Name: houses_furniture houses_furniture_house_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.houses_furniture
    ADD CONSTRAINT houses_furniture_house_id_fkey FOREIGN KEY (house_id) REFERENCES public.houses(id);


--
-- Name: houses_games houses_games_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.houses_games
    ADD CONSTRAINT houses_games_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id);


--
-- Name: houses_games houses_games_house_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.houses_games
    ADD CONSTRAINT houses_games_house_id_fkey FOREIGN KEY (house_id) REFERENCES public.houses(id);


--
-- Name: houses houses_villager_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.houses
    ADD CONSTRAINT houses_villager_id_fkey FOREIGN KEY (villager_id) REFERENCES public.villagers(id);


--
-- Name: nfc_tags nfc_tags_amiibo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nfc_tags
    ADD CONSTRAINT nfc_tags_amiibo_id_fkey FOREIGN KEY (amiibo_id) REFERENCES public.amiibos(id);


--
-- Name: villagers villagers_coffee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villagers
    ADD CONSTRAINT villagers_coffee_id_fkey FOREIGN KEY (coffee_id) REFERENCES public.coffees(id);


--
-- Name: villagers_games villagers_games_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villagers_games
    ADD CONSTRAINT villagers_games_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id);


--
-- Name: villagers_games villagers_games_villager_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villagers_games
    ADD CONSTRAINT villagers_games_villager_id_fkey FOREIGN KEY (villager_id) REFERENCES public.villagers(id);


--
-- Name: villagers villagers_personality_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.villagers
    ADD CONSTRAINT villagers_personality_id_fkey FOREIGN KEY (personality_id) REFERENCES public.personalities(id);


--
-- PostgreSQL database dump complete
--

