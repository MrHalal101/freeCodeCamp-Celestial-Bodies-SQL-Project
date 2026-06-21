--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_million_of_years integer NOT NULL,
    radius integer NOT NULL,
    distance_from_earth_in_light_years numeric NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    star_id integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(99) NOT NULL,
    age_in_million_of_years integer NOT NULL,
    radius integer,
    distance_from_earth_in_light_years integer,
    description text,
    is_spherical boolean,
    stars character varying(99) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(99) NOT NULL,
    age_in_million_of_years integer NOT NULL,
    radius integer,
    distance_from_earth_in_light_years integer,
    description text,
    is_spherical boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(99) NOT NULL,
    age_in_million_of_years integer NOT NULL,
    radius integer,
    distance_from_earth_in_light_years integer,
    description text,
    is_spherical boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(99) NOT NULL,
    age_in_million_of_years integer NOT NULL,
    radius integer,
    distance_from_earth_in_light_years integer,
    description text,
    is_spherical boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.constellation (constellation_id, name, age_in_million_of_years, radius, distance_from_earth_in_light_years, description, is_spherical, star_id) FROM stdin;
1	Ursa Major	4600	696340	0	The Great Bear constellation, visible year-round in the northern hemisphere sky.	f	1
2	Orion	8000	54930000	860	The celestial Hunter, famous for its distinctive three-star alignment belt.	f	5
3	Lyra	455	1918000	25	A small but highly prominent constellation representing the ancient stringed lyre.	f	6
\.


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, age_in_million_of_years, radius, distance_from_earth_in_light_years, description, is_spherical, stars) FROM stdin;
1	Milky Way	13600	52850	0	Our home barred spiral galaxy hosting billions of star systems.	f	400000
2	Andromeda	10000	110000	2537000	The nearest major spiral galaxy to the Milky Way on a collision course.	f	1000000
3	Triangulum	12000	30000	2730000	The third-largest member of the Local Group with a distinct spiral structure.	f	40000
4	Messier 87	13200	120000	53490000	A massive supergiant elliptical galaxy famous for its central supermassive black hole.	t	1200000
5	Large Magellanic Cloud	13001	14000	158200	A satellite dwarf irregular galaxy closely orbiting our Milky Way.	f	30000
6	Sombrero	13250	25000	29350000	An unbarred spiral galaxy featuring a highly prominent, thick dust lane ring.	f	80000
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, name, age_in_million_of_years, radius, distance_from_earth_in_light_years, description, is_spherical, planet_id) FROM stdin;
1	The Moon	4510	1737	0	Earths only natural satellite, heavily influencing oceanic tides.	t	3
2	Phobos	4500	11	0	The larger, heavily grooved, potato-shaped inner moon of Mars.	f	4
3	Deimos	4500	6	0	A small, smooth, heavily impacted outer satellite of Mars.	f	4
4	Io	4500	1821	0	The most volcanically active body in the entire solar system.	t	5
5	Europa	4500	1560	0	An icy world hiding a massive liquid subsurface water ocean.	t	5
6	Ganymede	4500	2634	0	The largest planetary moon in the solar system, bigger than Mercury.	t	5
7	Callisto	4500	2410	0	An ancient, heavily cratered world showing zero geological activity.	t	5
8	Mimas	4500	198	0	An icy moon featuring an enormous impact crater resembling the Death Star.	t	6
9	Enceladus	4500	252	0	A bright icy moon venting active saltwater geysers into space.	t	6
10	Tethys	4500	531	0	A mid-sized icy moon displaying a massive, canyon-like chasm rift.	t	6
11	Dione	4500	561	0	Features large, bright ice cliffs cutting across its dark terrain.	t	6
12	Rhea	4500	763	0	A heavily cratered, airless body composed primarily of water ice.	t	6
13	Titan	4500	2574	0	Features a thick nitrogen atmosphere with liquid methane lakes.	t	6
14	Iapetus	4500	734	0	Distinctly two-toned moon featuring a striking equatorial ridge wall.	t	6
15	Miranda	4500	235	0	Displays a deeply scarred patchwork surface of mixed geological blocks.	t	7
16	Ariel	4500	578	0	The brightest and youngest moon orbiting the planet Uranus.	t	7
17	Umbriel	4500	584	0	An incredibly dark, ancient moon heavily covered in deep impact craters.	t	7
18	Titania	4500	788	0	The largest moon of Uranus, cutting across massive normal faults.	t	7
19	Oberon	4500	761	0	The outermost large moon of Uranus, deeply scarred by cosmic collisions.	t	7
20	Triton	4500	1353	0	An active geyser-venting moon locked in a strange retrograde orbit.	t	8
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, name, age_in_million_of_years, radius, distance_from_earth_in_light_years, description, is_spherical, star_id) FROM stdin;
1	Mercury	4500	2439	0	A heavily cratered, barren terrestrial planet closest to the Sun.	t	1
2	Venus	4500	6051	0	A volcanic world choked by an incredibly dense, toxic atmosphere.	t	1
3	Earth	4543	6371	0	The only known astronomical object supporting complex organic life.	t	1
4	Mars	4603	3389	0	A cold, iron-rich desert world known as the Red Planet.	t	1
5	Jupiter	4603	69911	0	A massive gas giant featuring the iconic, swirling Great Red Spot.	t	1
6	Saturn	4503	58232	0	A gas giant globally famous for its sweeping ice-and-rock ring system.	t	1
7	Uranus	4503	25362	0	An ice giant with an extreme, completely sideways rotational axis.	t	1
8	Neptune	4503	24622	0	A freezing, windy ice giant world tracking dark supersonic storms.	t	1
9	Proxima b	4850	6500	4	An exoplanet orbiting within the habitable zone of our closest neighbor.	t	2
10	Sirius Prime	242	5800	9	A hypothetical rocky exoplanet orbiting within the Sirius system.	t	3
11	Betelgeuse b	8500	95000	642	A scorched, volatile gas giant orbiting dangerously close to its star.	t	4
12	Vega Minor	455	7100	25	A rocky exoplanet rich in metallic elements wrapped in a debris disk.	t	6
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, name, age_in_million_of_years, radius, distance_from_earth_in_light_years, description, is_spherical, galaxy_id) FROM stdin;
1	Sun	4600	696340	0	The yellow dwarf main-sequence star at the absolute center of our solar system.	t	1
2	Alpha Centauri A	4850	847400	4	The principal component of the closest triple star system to Earth.	t	1
3	Sirius A	242	1190000	9	The brightest main-sequence star visible in our entire night sky.	t	1
4	Betelgeuse	8500	61700000	642	A massive red supergiant star nearing the end of its life cycle.	t	1
5	Rigel	8000	54930000	860	A highly luminous blue supergiant star anchor in the Orion constellation.	t	1
6	Vega	455	1918000	25	A rapidly spinning, bright blue-white star in the Lyra constellation.	t	1
\.


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: constellation constellation_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

