--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30) NOT NULL,
    starcount integer,
    description text,
    distance_from_earth integer
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
    name character varying(30) NOT NULL,
    distance_from_planet integer,
    description text,
    speed_in_kmh integer,
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
    name character varying(30) NOT NULL,
    diameter_km integer,
    distance_from_star integer,
    atmospheric_composition text,
    habitable boolean,
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
-- Name: spacecraft; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spacecraft (
    spacecraft_id integer NOT NULL,
    name character varying(50) NOT NULL,
    mission_start_date date,
    mission_end_date date,
    destination character varying(100),
    conducting_agency character varying(100)
);


ALTER TABLE public.spacecraft OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spacecraft_spacecraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacecraft_spacecraft_id_seq OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spacecraft_spacecraft_id_seq OWNED BY public.spacecraft.spacecraft_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planetcount integer,
    age numeric,
    still_alive boolean,
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
-- Name: spacecraft spacecraft_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft ALTER COLUMN spacecraft_id SET DEFAULT nextval('public.spacecraft_spacecraft_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000000, 'The Milky Way is the galaxy that contains our Solar System.', 25000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 100000000, 'Andromeda is the nearest spiral galaxy to the Milky Way.', 2000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 100000000, 'The Triangulum Galaxy is a spiral galaxy approximately 3 million light-years from Earth.', 3000000);
INSERT INTO public.galaxy VALUES (4, 'Messier 81', 100000000, 'Messier 81 is a spiral galaxy in the constellation Ursa Major.', 11000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 100000000, 'The Sombrero Galaxy is an unbarred spiral galaxy in the constellation Virgo.', 29000000);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 100000000, 'The Whirlpool Galaxy is an interacting grand-design spiral galaxy in the constellation Canes Venatici.', 23000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384400, 'The Moon is Earth''s only natural satellite.', 3683, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 9378, 'Phobos is the larger and closer of the two natural satellites of Mars.', 2138, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 23460, 'Deimos is the smaller and outer of the two natural satellites of Mars.', 1343, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 1070400, 'Ganymede is the largest moon of Jupiter and in the Solar System.', 1035, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 671034, 'Europa is the smallest of the four Galilean moons orbiting Jupiter.', 1377, 5);
INSERT INTO public.moon VALUES (6, 'Io', 421700, 'Io is the innermost of the four Galilean moons of Jupiter.', 1736, 5);
INSERT INTO public.moon VALUES (7, 'Titan', 1221865, 'Titan is the largest moon of Saturn and the second-largest natural satellite in the Solar System.', 5570, 6);
INSERT INTO public.moon VALUES (8, 'Rhea', 527040, 'Rhea is the second-largest moon of Saturn and the ninth-largest moon in the Solar System.', 848, 6);
INSERT INTO public.moon VALUES (9, 'Titania', 436300, 'Titania is the largest of the moons of Uranus and the eighth-largest moon in the Solar System.', 3545, 7);
INSERT INTO public.moon VALUES (10, 'Oberon', 583520, 'Oberon is the second-largest moon of Uranus and the ninth-largest moon in the Solar System.', 3685, 7);
INSERT INTO public.moon VALUES (11, 'Triton', 354800, 'Triton is the largest natural satellite of the planet Neptune and the only moon in the Solar System known to have an atmosphere.', 4027, 8);
INSERT INTO public.moon VALUES (12, 'Nereid', 5513810, 'Nereid is the third-largest moon of Neptune and the smallest of the 13 known moons of Neptune.', 95, 8);
INSERT INTO public.moon VALUES (13, 'Charon', 19571, 'Charon is the largest of the five known natural satellites of the dwarf planet Pluto.', 17560, 9);
INSERT INTO public.moon VALUES (14, 'Luna', 5762, 'Luna is the second-largest moon of the dwarf planet Pluto.', 504, 9);
INSERT INTO public.moon VALUES (15, 'Phobos-Grunt', 9, 'Phobos-Grunt is a failed Russian mission to Mars, aiming to return samples from Phobos.', 0, 4);
INSERT INTO public.moon VALUES (16, 'JUICE', 4, 'JUICE is a future mission by the European Space Agency (ESA) to explore Jupiter and its moons.', 0, 5);
INSERT INTO public.moon VALUES (17, 'Europa Clipper', 0, 'Europa Clipper is a planned mission by NASA to study Jupiter''s moon Europa.', 0, 5);
INSERT INTO public.moon VALUES (18, 'Laplace-P', 7, 'Laplace-P is a proposed mission by the Russian Federal Space Agency to study the Galilean moons of Jupiter.', 0, 5);
INSERT INTO public.moon VALUES (19, 'Titan Saturn System Mission', 0, 'The Titan Saturn System Mission is a concept for a Flagship-class NASA spacecraft mission.', 0, 6);
INSERT INTO public.moon VALUES (20, 'Enceladus Life Finder', 0, 'Enceladus Life Finder is a proposed astrobiology mission by NASA to explore the habitability of Saturn''s moon Enceladus.', 0, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4, 57900, 'Minimal', false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12, 108000, 'Carbon dioxide, nitrogen', false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12, 150000, 'Nitrogen, oxygen', true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6, 228000, 'Carbon dioxide, nitrogen', false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 13, 778000, 'Hydrogen, helium', false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 11, 1430000, 'Hydrogen, helium', false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 5, 2870000, 'Hydrogen, helium, methane', false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 4, 4500000, 'Hydrogen, helium, methane', false, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 0, 209000, 'Unknown', true, 2);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 0, 20800, 'Unknown', true, 3);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 0, 9800, 'Unknown', true, 3);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 0, 7000, 'Unknown', true, 2);


--
-- Data for Name: spacecraft; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spacecraft VALUES (1, 'Voyager 1', '1977-09-05', '2025-03-19', 'Interstellar space', 'NASA');
INSERT INTO public.spacecraft VALUES (2, 'Voyager 2', '1977-08-20', '2025-03-19', 'Interstellar space', 'NASA');
INSERT INTO public.spacecraft VALUES (3, 'Cassini-Huygens', '1997-10-15', '2017-09-15', 'Saturn', 'NASA/ESA/ASI');
INSERT INTO public.spacecraft VALUES (4, 'New Horizons', '2006-01-19', '2025-03-19', 'Pluto, Kuiper Belt', 'NASA');
INSERT INTO public.spacecraft VALUES (5, 'Mars Perseverance Rover', '2020-07-30', NULL, 'Mars', 'NASA');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, 4.6, true, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 6.0, true, 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 1, 6.0, true, 2);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 0, 8.6, true, 3);
INSERT INTO public.star VALUES (5, 'VY Canis Majoris', 0, 8.2, true, 1);
INSERT INTO public.star VALUES (6, 'Polaris', 1, 0.4, true, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 5, true);


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
-- Name: spacecraft spacecraft_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_name_unique UNIQUE (name);


--
-- Name: spacecraft spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);


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

