--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    origin_of_name text,
    name character varying(30) NOT NULL,
    constellation character varying(30),
    notes text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: manned_space_missions; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.manned_space_missions (
    manned_space_missions_id integer NOT NULL,
    name character varying(30) NOT NULL,
    country character varying(16),
    launch date NOT NULL,
    craft character varying(30),
    single_crew boolean
);


ALTER TABLE public.manned_space_missions OWNER TO freecodecamp;

--
-- Name: manned_space_missions_manned_space_missions_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.manned_space_missions_manned_space_missions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.manned_space_missions_manned_space_missions_id_seq OWNER TO freecodecamp;

--
-- Name: manned_space_missions_manned_space_missions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.manned_space_missions_manned_space_missions_id_seq OWNED BY public.manned_space_missions.manned_space_missions_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius_km numeric(6,1),
    planet_id integer NOT NULL,
    discovered_by character varying(30)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mill_km_from_star integer,
    n_moons integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    constellation character varying(30),
    single_star boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: manned_space_missions manned_space_missions_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.manned_space_missions ALTER COLUMN manned_space_missions_id SET DEFAULT nextval('public.manned_space_missions_manned_space_missions_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Appears in Andromeda constellation.', 'Andromeda Galaxy', 'Andromeda', 'Collision with Milky Way galaxy is imminent for certain values of *imminent*.');
INSERT INTO public.galaxy VALUES (2, 'Appearance similar to insect antennae.', 'Antennae Galaxies', 'Corvus', NULL);
INSERT INTO public.galaxy VALUES (3, 'Appearance similar to a comet.', 'Comet Galaxy', 'Sculptor', 'The comet effect is caused by tidal stripping.');
INSERT INTO public.galaxy VALUES (4, 'Resembles the Eye of Sauron from Lord of the Rings', 'Eye of Sauron', 'Canes Venatici', NULL);
INSERT INTO public.galaxy VALUES (5, 'The appearance from Earth of the galaxy--a band of light', 'Milky Way', 'Sagittarius (center)', 'The galaxy containing the Sun and Earth.');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool appearance.', 'Whirlpool Galaxy', 'Canes Venatici', NULL);


--
-- Data for Name: manned_space_missions; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.manned_space_missions VALUES (1, 'Vostok-1', 'USSR', '1961-04-12', 'Kedr (Cedar)', true);
INSERT INTO public.manned_space_missions VALUES (2, 'Mercury-3', 'USA', '1961-05-05', 'Freedom 7', true);
INSERT INTO public.manned_space_missions VALUES (3, 'Voskhod 1', 'USSR', '1964-10-12', 'Rubin (Ruby)', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1738.0, 3, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 11.3, 4, 'Hall');
INSERT INTO public.moon VALUES (3, 'Deimos', 6.2, 4, 'Hall');
INSERT INTO public.moon VALUES (4, 'Io', 1821.6, 5, 'Galileo');
INSERT INTO public.moon VALUES (5, 'Europa', 1560.8, 5, 'Galileo');
INSERT INTO public.moon VALUES (6, 'Ganymede', 2634.1, 5, 'Galileo');
INSERT INTO public.moon VALUES (7, 'Callisto', 2410.3, 5, 'Galileo');
INSERT INTO public.moon VALUES (8, 'Amalthea', 83.5, 5, 'Barnard');
INSERT INTO public.moon VALUES (9, 'Himalia', 69.8, 5, 'Perrine');
INSERT INTO public.moon VALUES (10, 'Elara', 43.0, 5, 'Perrine');
INSERT INTO public.moon VALUES (11, 'Pasiphae', 30.0, 5, 'Melotte');
INSERT INTO public.moon VALUES (12, 'Sinope', 19.0, 5, 'Nicholson');
INSERT INTO public.moon VALUES (13, 'Lysithea', 18.0, 5, 'Nicholson');
INSERT INTO public.moon VALUES (14, 'Carme', 23.0, 5, 'Nicholson');
INSERT INTO public.moon VALUES (15, 'Ananke', 14.0, 5, 'Nicholson');
INSERT INTO public.moon VALUES (16, 'Leda', 10.0, 5, 'Kowal');
INSERT INTO public.moon VALUES (17, 'Thebe', 49.3, 5, 'Synnott (Voyager 1)');
INSERT INTO public.moon VALUES (18, 'Adrastea', 8.2, 5, 'Jewitt, Danielson (Voyager 1)');
INSERT INTO public.moon VALUES (19, 'Metis', 21.5, 5, 'Synott (Voyager 1)');
INSERT INTO public.moon VALUES (20, 'Mneme', 1.0, 5, 'Gladman, Allen');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 58, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 108, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 150, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 228, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 778, 80, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 1429, 83, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 2871, 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4504, 14, 1);
INSERT INTO public.planet VALUES (9, 'Draugr', NULL, NULL, 2);
INSERT INTO public.planet VALUES (10, 'Poltergeist', NULL, NULL, 2);
INSERT INTO public.planet VALUES (11, 'Phobetor', NULL, NULL, 2);
INSERT INTO public.planet VALUES (12, 'Dimidium', NULL, NULL, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 5, NULL, true);
INSERT INTO public.star VALUES (2, 'Lich', 5, 'Virgo', true);
INSERT INTO public.star VALUES (3, '51 Pegasi', 5, 'Pegasus', true);
INSERT INTO public.star VALUES (4, 'Sirius', 5, 'Canis Major', false);
INSERT INTO public.star VALUES (6, 'Spica', 5, 'Virgo', false);
INSERT INTO public.star VALUES (5, 'Procyon', 5, 'Canis Major', false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: manned_space_missions_manned_space_missions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.manned_space_missions_manned_space_missions_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: manned_space_missions manned_space_missions_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.manned_space_missions
    ADD CONSTRAINT manned_space_missions_name_key UNIQUE (name);


--
-- Name: manned_space_missions manned_space_missions_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.manned_space_missions
    ADD CONSTRAINT manned_space_missions_pkey PRIMARY KEY (manned_space_missions_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

