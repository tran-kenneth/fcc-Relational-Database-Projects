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
    name character varying(30) NOT NULL,
    apparent_magnitude numeric(3,2),
    distance_in_kly integer,
    distance_in_kpc integer,
    constellation character varying(30)
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
    planet_id integer NOT NULL,
    diameter_in_km numeric(5,1),
    mass_10_power_24_kg numeric(6,5)
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
    has_life boolean NOT NULL,
    star_id integer NOT NULL,
    is_dwarf boolean NOT NULL,
    equatorial_diameter_in_km numeric(6,0),
    mass_10_power_24_kg numeric(8,4),
    planet_type_id integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer NOT NULL,
    magnitude numeric(3,2),
    mass_in_solar_mass numeric(4,3),
    radius_in_solar_radius numeric(3,1),
    radial_velocity_in_kmps numeric(3,1),
    distance_in_ly numeric(4,0) NOT NULL
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', -6.50, 0, 0, 'Sagittarius (centre)');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 3.40, 2500, 770, 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 0.90, 160, 49, 'Dorada/Mensa');
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 2.70, 200, 61, 'Tucana');
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 5.70, 2900, 890, 'Triangulum');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 6.84, 13700, 4200, 'Centaurus');
INSERT INTO public.galaxy VALUES (7, 'Bode''s Galaxy', 6.94, 12000, 3700, 'Ursa Major');
INSERT INTO public.galaxy VALUES (8, 'Sculptor Galaxy', 7.20, 12000, 3700, 'Sculptor');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1734.8, 0.07346);
INSERT INTO public.moon VALUES (2, 'Io', 5, 1817.7, 0.08959);
INSERT INTO public.moon VALUES (3, 'Europa', 5, 1569.0, 0.04801);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, 2634.1, 0.14811);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, 1773.1, 0.10750);
INSERT INTO public.moon VALUES (6, 'Mimas', 6, 197.7, 0.00004);
INSERT INTO public.moon VALUES (7, 'Enceladus', 6, 255.1, 0.00011);
INSERT INTO public.moon VALUES (8, 'Tethys', 6, 535.8, 0.00062);
INSERT INTO public.moon VALUES (9, 'Dione', 6, 561.3, 0.00109);
INSERT INTO public.moon VALUES (10, 'Rhea', 6, 765.4, 0.00231);
INSERT INTO public.moon VALUES (11, 'Titan', 6, 2576.7, 0.13437);
INSERT INTO public.moon VALUES (13, 'Miranda', 7, 236.0, 0.00007);
INSERT INTO public.moon VALUES (12, 'Iapetus', 6, 733.5, 0.00180);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, 580.4, 0.00135);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 586.8, 0.00119);
INSERT INTO public.moon VALUES (16, 'Titania', 7, 790.9, 0.00352);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 759.0, 0.00302);
INSERT INTO public.moon VALUES (18, 'Triton', 8, 1352.1, 0.02138);
INSERT INTO public.moon VALUES (19, 'Charon', 11, 605.9, 0.00152);
INSERT INTO public.moon VALUES (20, 'Dysnomia', 13, 363.5, 0.00030);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 1, false, 2443, 0.3583, 3);
INSERT INTO public.planet VALUES (2, 'Venus', false, 1, false, 6053, 4.8373, 3);
INSERT INTO public.planet VALUES (4, 'Mars', false, 1, false, 3393, 0.6569, 3);
INSERT INTO public.planet VALUES (3, 'Earth', true, 1, false, 6378, 5.9720, 3);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 1, false, 71491, 1898.0808, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 1, false, 60266, 568.2955, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 1, false, 25557, 86.8329, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 1, false, 24766, 102.4198, 1);
INSERT INTO public.planet VALUES (9, 'Ceres', false, 1, true, 473, 0.0010, NULL);
INSERT INTO public.planet VALUES (10, 'Orcus', false, 1, true, 459, 0.0006, NULL);
INSERT INTO public.planet VALUES (11, 'Pluto', false, 1, true, 1186, 0.0131, NULL);
INSERT INTO public.planet VALUES (12, 'Haumea', false, 1, true, 829, 0.0042, NULL);
INSERT INTO public.planet VALUES (13, 'Eris', false, 1, true, 1158, 0.0167, NULL);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Gas giant', 'A giant planet composed of gas.');
INSERT INTO public.planet_type VALUES (3, 'Terrestrial', 'A planet made up of rocks or metals with a hard surface.');
INSERT INTO public.planet_type VALUES (4, 'Neptune-like', 'Gaseous worlds around the size of Neptune.');
INSERT INTO public.planet_type VALUES (2, 'Super-Earth', 'A potentially rocky-world larger than Earth.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4.83, 1.000, 1.0, NULL, 0);
INSERT INTO public.star VALUES (2, 'Alpha Sagittarii', 1, 3.97, 2.950, NULL, -0.7, 182);
INSERT INTO public.star VALUES (3, 'Epsilon Sagittarii', 1, 1.85, 3.515, 6.8, -15.0, 143);
INSERT INTO public.star VALUES (4, 'Sigma Sagittarii', 1, 2.05, 7.800, 4.5, -11.2, 228);
INSERT INTO public.star VALUES (5, 'Zeta Sagittarii', 1, 2.59, 5.260, NULL, 22.0, 88);
INSERT INTO public.star VALUES (6, 'Delta Sagittarii', 1, 2.70, 3.210, 16.0, -19.9, 348);
INSERT INTO public.star VALUES (7, 'Eta Sagittarii', 1, 3.11, NULL, 57.0, 0.5, 146);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_unique UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_unique UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_type planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_type_id);


--
-- Name: planet_type planet_types_planet_type_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_types_planet_type_id_key UNIQUE (planet_type_id);


--
-- Name: star star_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_unique UNIQUE (star_id);


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
-- Name: planet planet_planet_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


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

