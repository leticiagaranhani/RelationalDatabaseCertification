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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30),
    is_spherical boolean NOT NULL,
    description text,
    has_life boolean NOT NULL,
    first_sighting_in integer,
    color character varying(30),
    diameter_in_km numeric(6,2),
    star_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    is_spherical boolean NOT NULL,
    first_sighting_in integer NOT NULL,
    description text,
    has_life boolean NOT NULL,
    galaxy_types character varying(30)
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    is_spherical boolean NOT NULL,
    first_sighting_in integer NOT NULL,
    description text,
    has_life boolean NOT NULL,
    distance_from_earth numeric,
    planet_id integer
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
    name character varying(30),
    is_spherical boolean NOT NULL,
    first_sighting_in integer NOT NULL,
    description text,
    has_life boolean NOT NULL,
    distance_from_earth numeric,
    star_id integer
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
    name character varying(30),
    is_spherical boolean NOT NULL,
    first_sighting_in integer NOT NULL,
    description text,
    has_life boolean NOT NULL,
    distance_from_earth numeric,
    age_in_millions_of_years numeric(5,1),
    galaxy_id integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', true, 'A dwarf planet between Mars and Jupiter', false, 1801, 'gray', 939.00, 1);
INSERT INTO public.asteroid VALUES (2, '4 Vesta', true, 'A dwarf planet between Mars and Jupiter', false, 1807, 'gray', 525.00, 1);
INSERT INTO public.asteroid VALUES (3, 'Bennu', true, '', false, 1999, 'gray', 0.49, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, 1931, 'The closest big galaxy to the Milky Way and gets it name from the area of the sky in which it appears, the constallation of Andromeda', false, 'barred spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', false, 1937, 'Named after its location within the Triangulum constellation', false, 'spiral');
INSERT INTO public.galaxy VALUES (4, 'Sunflower', false, 1799, 'Named just its appearance like a sunflower', false, 'SAbc');
INSERT INTO public.galaxy VALUES (6, 'Mice galaxies', false, 1961, 'Named just its appearance like a mouse', false, 'Irr/SB');
INSERT INTO public.galaxy VALUES (7, 'Malin 1', false, 2015, 'Discovered and named by David Malin ', false, 'SB0a');
INSERT INTO public.galaxy VALUES (1, 'Milky Way', false, 1610, 'The galaxy containing the Sun and the Solar Sistem, and therefore Earth', true, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, -5000, 'Natural Earth sattelite', false, 384400, 3);
INSERT INTO public.moon VALUES (2, 'Io', true, -5000, '1st Natural Jupiter sattelite', false, NULL, 5);
INSERT INTO public.moon VALUES (3, 'Europa', true, -5000, '2nd Natural Jupiter sattelite', false, NULL, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', true, -5000, '3rd Natural Jupiter sattelite', false, NULL, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', true, -5000, '4th Natural Jupiter sattelite', false, NULL, 5);
INSERT INTO public.moon VALUES (6, 'Titan', true, -5000, 'Biggest Natural Saturn sattelite', false, NULL, 6);
INSERT INTO public.moon VALUES (7, 'Rhea', true, -5000, 'Natural Saturn sattelite', false, NULL, 6);
INSERT INTO public.moon VALUES (8, 'Enceladus', true, -5000, 'Natural Saturn sattelite', false, NULL, 6);
INSERT INTO public.moon VALUES (9, 'Iapetus', true, -5000, 'Natural Saturn sattelite', false, NULL, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', true, -5000, 'Natural Saturn sattelite', false, NULL, 6);
INSERT INTO public.moon VALUES (11, 'Thetys', true, -5000, 'Natural Saturn sattelite', false, NULL, 6);
INSERT INTO public.moon VALUES (12, 'Dione', true, -5000, 'Natural Saturn sattelite', false, NULL, 6);
INSERT INTO public.moon VALUES (13, 'Titania', true, -5000, 'Natural Uranus sattelite', false, NULL, 7);
INSERT INTO public.moon VALUES (14, 'Oberon', true, 1787, 'Natural Uranus sattelite', false, NULL, 7);
INSERT INTO public.moon VALUES (15, 'Ariel', true, 1851, 'Natural Uranus sattelite', false, NULL, 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', true, 1851, 'Natural Uranus sattelite', false, NULL, 7);
INSERT INTO public.moon VALUES (17, 'Miranda', true, 1948, 'Natural Uranus sattelite', false, NULL, 7);
INSERT INTO public.moon VALUES (18, 'Pucky', true, 1948, 'Natural Uranus sattelite', false, NULL, 7);
INSERT INTO public.moon VALUES (19, 'Perdita', true, 1999, 'Natural Uranus sattelite', false, NULL, 7);
INSERT INTO public.moon VALUES (20, 'Cupid', true, 2003, 'Natural Uranus sattelite', false, NULL, 7);
INSERT INTO public.moon VALUES (21, 'Margaret', true, 2003, 'Natural Uranus sattelite', false, NULL, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', true, -5000, 'The first planet from the Sun and the smallest planet of Solar System. ', false, 57909000, 1);
INSERT INTO public.planet VALUES (2, 'Venus', true, -5000, 'The second planet from the Sun and a rocky planet', false, 108208930, 1);
INSERT INTO public.planet VALUES (4, 'Mars', true, -5000, 'The forth planet from the Sun, the red planet.', false, 227936640, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, -5000, 'The fifth planet from the Sun.', false, 778000000, 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, -5000, 'The third planet from the Sun, with water and organic life.', true, 149507890, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', true, -5000, 'The sixth planet from the Sun.', false, 14778000000, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', true, 1781, 'The seventh planet from the Sun.', false, 28708900000, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', true, 1846, 'The eighth planet from the Sun.', false, 44988900000, 1);
INSERT INTO public.planet VALUES (9, 'PA-99-N2', true, 1999, 'nothing described', false, 44988900000, 2);
INSERT INTO public.planet VALUES (10, 'Spe', true, 2009, 'nothing described', false, 249000000000, 2);
INSERT INTO public.planet VALUES (11, 'Fiction One', true, 2023, 'something for my exercise', false, 1.3, 2);
INSERT INTO public.planet VALUES (12, 'Fiction Two', true, 2023, 'something for my exercise', false, 5.4, 3);
INSERT INTO public.planet VALUES (13, 'Fiction Three', true, 2023, 'something for my exercise', false, 5.4, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, -3000, 'Ball of fire, with hidrogen in its constitution', false, 1000000000, 0.1, 1);
INSERT INTO public.star VALUES (2, 'XYZ', true, 1915, 'Ball of fire, with hidrogen in its constitution, plus Helium', false, 3453465, 8.0, 3);
INSERT INTO public.star VALUES (3, 'Theta Leporis', true, 1903, 'Ball of fire, with hidrogen in its constitution, plus Helium', false, 344522, 105.0, 2);
INSERT INTO public.star VALUES (4, 'Omega Opus', true, 2003, 'Ball of fire, with hidrogen and Helium', false, 99323122, 3299.0, 4);
INSERT INTO public.star VALUES (5, 'Beta Anion', true, 1970, 'Ball of fire, hidrogen and copper', false, 8993232, 32.0, 6);
INSERT INTO public.star VALUES (6, 'Cation Mercury', true, 1999, 'Ball of fire, mercury and hidrogen', false, 32435, 568.0, 7);
INSERT INTO public.star VALUES (7, 'Alpha Andromedae', true, 1999, 'The same as Alpheratz', false, 280000, NULL, 2);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

