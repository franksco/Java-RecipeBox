--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE categories OWNER TO "Guest";

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO "Guest";

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: category_recipe; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE category_recipe (
    id integer NOT NULL,
    category_id integer,
    recipe_id integer
);


ALTER TABLE category_recipe OWNER TO "Guest";

--
-- Name: category_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE category_recipe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_recipe_id_seq OWNER TO "Guest";

--
-- Name: category_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE category_recipe_id_seq OWNED BY category_recipe.id;


--
-- Name: directions; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE directions (
    id integer NOT NULL,
    direction character varying
);


ALTER TABLE directions OWNER TO "Guest";

--
-- Name: directions_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE directions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE directions_id_seq OWNER TO "Guest";

--
-- Name: directions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE directions_id_seq OWNED BY directions.id;


--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE ingredients (
    id integer NOT NULL,
    ingredient character varying
);


ALTER TABLE ingredients OWNER TO "Guest";

--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ingredients_id_seq OWNER TO "Guest";

--
-- Name: ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE ingredients_id_seq OWNED BY ingredients.id;


--
-- Name: recipe_directions; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE recipe_directions (
    id integer NOT NULL,
    recipe_id integer,
    direction_id integer
);


ALTER TABLE recipe_directions OWNER TO "Guest";

--
-- Name: recipe_directions_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE recipe_directions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recipe_directions_id_seq OWNER TO "Guest";

--
-- Name: recipe_directions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE recipe_directions_id_seq OWNED BY recipe_directions.id;


--
-- Name: recipe_ingredients; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE recipe_ingredients (
    id integer NOT NULL,
    recipe_id integer,
    ingredient_id integer
);


ALTER TABLE recipe_ingredients OWNER TO "Guest";

--
-- Name: recipe_ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE recipe_ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recipe_ingredients_id_seq OWNER TO "Guest";

--
-- Name: recipe_ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE recipe_ingredients_id_seq OWNED BY recipe_ingredients.id;


--
-- Name: recipes; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE recipes (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE recipes OWNER TO "Guest";

--
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE recipes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recipes_id_seq OWNER TO "Guest";

--
-- Name: recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE recipes_id_seq OWNED BY recipes.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY category_recipe ALTER COLUMN id SET DEFAULT nextval('category_recipe_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY directions ALTER COLUMN id SET DEFAULT nextval('directions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY ingredients ALTER COLUMN id SET DEFAULT nextval('ingredients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY recipe_directions ALTER COLUMN id SET DEFAULT nextval('recipe_directions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY recipe_ingredients ALTER COLUMN id SET DEFAULT nextval('recipe_ingredients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY recipes ALTER COLUMN id SET DEFAULT nextval('recipes_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY categories (id, name) FROM stdin;
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('categories_id_seq', 1, false);


--
-- Data for Name: category_recipe; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY category_recipe (id, category_id, recipe_id) FROM stdin;
\.


--
-- Name: category_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('category_recipe_id_seq', 1, false);


--
-- Data for Name: directions; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY directions (id, direction) FROM stdin;
1	Whisk barbeque sauce, apple butter, brown sugar, black pepper, and garlic together in a microwave-safe bowl; heat in microwave until sugar dissolves, about 30 seconds. Stir until sauce is smooth.\r
2	Place pork chops on a plate and pour sauce over chops. Refrigerate for flavors to soak into pork chops, 1 to 2 hours.\r
3	Preheat an outdoor grill for medium-high heat and lightly oil the grate.\r
4	Cook pork chops on grill until cooked through, about 15 minutes. An instant-read thermometer inserted into the center should read 145 degrees F (63 degrees C).
5	Whisk barbeque sauce, apple butter, brown sugar, black pepper, and garlic together in a microwave-safe bowl; heat in microwave until sugar dissolves, about 30 seconds. Stir until sauce is smooth.\r
6	Place pork chops on a plate and pour sauce over chops. Refrigerate for flavors to soak into pork chops, 1 to 2 hours.\r
7	Preheat an outdoor grill for medium-high heat and lightly oil the grate.\r
8	Cook pork chops on grill until cooked through, about 15 minutes. An instant-read thermometer inserted into the center should read 145 degrees F (63 degrees C).
9	skjdhskjhgjsdhgksjhdgksjhdgorug[piuet[wsd;kfgjs;erkgj;d,gjsl;rlkgjsl;dkdrlkgjhselfkhslkjghsrljxnc,vmshrglsjkdfhv,smrkghsl
10	Place cumin seeds into a small skillet over medium heat; stir constantly until seeds turn dark brown and smell toasted, about 1 minute. Immediately pour seeds into a bowl to stop the cooking. Mix cumin seeds with orange juice, vegetable oil, steak seasoning, lime juice, and oregano in a bowl.\r
11	Place steaks into a large resealable plastic bag, pour orange juice marinade over the meat, and squeeze out air. Seal bag and turn it over several times to coat meat with marinade. Refrigerate at least 30 minutes, or longer for extra flavor.\r
12	Preheat an outdoor grill for medium-high heat and lightly oil the grate.\r
13	Remove steaks from marinade, shaking off any excess. Discard used marinade. Grill steaks on the preheated grill until seared on the outsides and still slightly pink in the centers, 6 to 8 minutes per side. An instant-read meat thermometer inserted sideways into the center of the thickest steak should read 145 degrees F (65 degrees C). Let steaks rest for 3 minutes before slicing.
14	Preheat oven to 375 degrees F (190 degrees C). Lightly grease a 10 inch quiche dish.\r
15	In a large bowl, beat together milk, eggs, baking mix, butter and parmesan cheese. Batter will be lumpy. Stir in broccoli, ham and Cheddar cheese. Pour into prepared quiche dish.\r
16	Bake in preheated oven for 50 minutes, until eggs are set and top is golden brown.
\.


--
-- Name: directions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('directions_id_seq', 16, true);


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY ingredients (id, ingredient) FROM stdin;
1	1/2 cup barbeque sauce\r
2	1/4 cup apple butter\r
3	2 tablespoons brown sugar\r
4	1 tablespoon ground black pepper\r
5	2 cloves garlic, minced\r
6	3 (4 ounce) pork chops\r
7	\r
8	1/2 cup barbeque sauce\r
9	1/4 cup apple butter\r
10	2 tablespoons brown sugar\r
11	1 tablespoon ground black pepper\r
12	2 cloves garlic, minced\r
13	3 (4 ounce) pork chops\r
14	\r
15	dgfgsdfgsdfsdfsdgdfgsdfsdgsfd.g,sndg.msndsndgmnsdgmnsd,mgnsdkjhnsdgnlsdhgsjhdlgkhsdlkghsdlkhgsldkhglksdhglkhsdlkghskldhglsdkhglksdhglskdhglksdhglksdhglksdhglkshdglkshdkghsdlgkhsdlkghsdlghsdlkghsdlkghsdlghsdlkghsldkghsdlkghslkdhgslkdhglskdhglksdhgklsdhgshdlgkhsdlkshdglsdlgkhsdlkghsdlkghsdlkghdgklhsdlkghsdglksdhglkshdglkhsdikh\r
16	sdljhdsjhsdgjhsdgjhdgjsdhgklsdjhskdjghskdjghs
17	1/2 teaspoon cumin seeds\r
18	1/4 cup orange juice\r
19	2 tablespoons vegetable oil\r
20	2 tablespoons Montreal-style steak seasoning\r
21	2 1/4 teaspoons lime juice\r
22	1 1/2 teaspoons dried oregano\r
23	1 1/2 pounds beef rib-eye steaks
24	2 cups milk\r
25	4 eggs\r
26	3/4 cup biscuit baking mix\r
27	1/4 cup butter, softened\r
28	1 cup grated Parmesan cheese\r
29	1 (10 ounce) package chopped frozen broccoli, thawed and drained\r
30	1 cup cubed cooked ham\r
31	8 ounces shredded Cheddar cheese
\.


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('ingredients_id_seq', 31, true);


--
-- Data for Name: recipe_directions; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY recipe_directions (id, recipe_id, direction_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	2	5
6	2	6
7	2	7
8	2	8
9	3	9
10	4	10
11	4	11
12	4	12
13	4	13
14	5	14
15	5	15
16	5	16
\.


--
-- Name: recipe_directions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('recipe_directions_id_seq', 16, true);


--
-- Data for Name: recipe_ingredients; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY recipe_ingredients (id, recipe_id, ingredient_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	2	8
9	2	9
10	2	10
11	2	11
12	2	12
13	2	13
14	2	14
15	3	15
16	3	16
17	4	17
18	4	18
19	4	19
20	4	20
21	4	21
22	4	22
23	4	23
24	5	24
25	5	25
26	5	26
27	5	27
28	5	28
29	5	29
30	5	30
31	5	31
\.


--
-- Name: recipe_ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('recipe_ingredients_id_seq', 31, true);


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY recipes (id, name) FROM stdin;
1	Southern Sweet Grilled Pork Chops
2	Southern Sweet Grilled Pork Chops
3	dfsd
4	Cuban Marinated Steak
5	Easy Quiche
\.


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('recipes_id_seq', 5, true);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: category_recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY category_recipe
    ADD CONSTRAINT category_recipe_pkey PRIMARY KEY (id);


--
-- Name: directions_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY directions
    ADD CONSTRAINT directions_pkey PRIMARY KEY (id);


--
-- Name: ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: recipe_directions_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY recipe_directions
    ADD CONSTRAINT recipe_directions_pkey PRIMARY KEY (id);


--
-- Name: recipe_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY recipe_ingredients
    ADD CONSTRAINT recipe_ingredients_pkey PRIMARY KEY (id);


--
-- Name: recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: epicodus
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM epicodus;
GRANT ALL ON SCHEMA public TO epicodus;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

