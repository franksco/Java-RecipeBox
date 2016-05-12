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
1	Breakfast
2	Lunch
3	Dinner
4	Eggs
5	Bacon
6	Salad
7	Pie
8	Cake
9	Dessert
10	Cookies
11	Thanksgiving
12	Steak
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('categories_id_seq', 12, true);


--
-- Data for Name: category_recipe; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY category_recipe (id, category_id, recipe_id) FROM stdin;
1	2	1
2	3	1
3	1	2
4	2	2
5	3	2
6	7	2
7	11	2
\.


--
-- Name: category_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('category_recipe_id_seq', 7, true);


--
-- Data for Name: directions; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY directions (id, direction) FROM stdin;
1	Using a rolling pin, crush Pretzel Crisps(R) until fine, but with some texture. Transfer to a clean plate. In a bowl, beat together the egg and one cup of the buffalo wing sauce, and set aside. Dip each chicken tender first in the egg mixture and roll to coat in the crushed pretzels.\r
2	In a large skillet, heat oil over medium high heat until shimmering. Add chicken tenders and cook, turning often, until golden brown on all sides (about six minutes total). Transfer to paper towels to drain. In a small bowl, combine mayonnaise, sour cream, blue cheese, and Worcestershire sauce. Serve blue cheese sauce with chicken and remaining 1/2 cup or reserved wing sauce.
3	Preheat oven to 425 degrees F (220 degrees C.)\r
4	In a saucepan, combine chicken, carrots, peas, and celery. Add water to cover and boil for 15 minutes. Remove from heat, drain and set aside.\r
5	In the saucepan over medium heat, cook onions in butter until soft and translucent. Stir in flour, salt, pepper, and celery seed. Slowly stir in chicken broth and milk. Simmer over medium-low heat until thick. Remove from heat and set aside.\r
6	Place the chicken mixture in bottom pie crust. Pour hot liquid mixture over. Cover with top crust, seal edges, and cut away excess dough. Make several small slits in the top to allow steam to escape.\r
7	Bake in the preheated oven for 30 to 35 minutes, or until pastry is golden brown and filling is bubbly. Cool for 10 minutes before serving.
\.


--
-- Name: directions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('directions_id_seq', 7, true);


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY ingredients (id, ingredient) FROM stdin;
1	2 cups Buffalo Wing Snack Factory® Pretzel Crisps®\r
2	1 pound chicken tenders\r
3	1 egg\r
4	1 1/2 cups buffalo wing sauce, divided\r
5	1/4 cup peanut oil\r
6	2 tablespoons mayonnaise\r
7	1 tablespoon sour cream\r
8	1/4 cup blue cheese crumbles, or to taste\r
9	1 dash Worcestershire sauce
10	1 pound skinless, boneless chicken breast halves - cubed\r
11	1 cup sliced carrots\r
12	1 cup frozen green peas\r
13	1/3 cup butter\r
14	1/3 cup chopped onion\r
15	1/3 cup all-purpose flour\r
16	1/2 teaspoon salt\r
17	1/4 teaspoon black pepper\r
18	1/4 teaspoon celery seed\r
19	1 3/4 cups chicken broth\r
20	2/3 cup milk\r
21	2 (9 inch) unbaked pie crusts
\.


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('ingredients_id_seq', 21, true);


--
-- Data for Name: recipe_directions; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY recipe_directions (id, recipe_id, direction_id) FROM stdin;
1	1	1
2	1	2
3	2	3
4	2	4
5	2	5
6	2	6
7	2	7
\.


--
-- Name: recipe_directions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('recipe_directions_id_seq', 7, true);


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
8	1	8
9	1	9
10	2	10
11	2	11
12	2	12
13	2	13
14	2	14
15	2	15
16	2	16
17	2	17
18	2	18
19	2	19
20	2	20
21	2	21
\.


--
-- Name: recipe_ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('recipe_ingredients_id_seq', 21, true);


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY recipes (id, name) FROM stdin;
1	Buffalo Chicken Fingers from Pretzel Crisps
2	Chicken Pot Pie IX
\.


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('recipes_id_seq', 2, true);


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

