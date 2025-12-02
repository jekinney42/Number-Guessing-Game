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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22),
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1764649848734', 1, 847);
INSERT INTO public.users VALUES ('user_1764649848735', 1, 15);
INSERT INTO public.users VALUES ('user_1764649929544', 2, 482);
INSERT INTO public.users VALUES ('user_1764649929545', 5, 223);
INSERT INTO public.users VALUES ('James', 1, 6);
INSERT INTO public.users VALUES ('user_1764650255447', 1, 356);
INSERT INTO public.users VALUES ('user_1764650255448', 1, 336);
INSERT INTO public.users VALUES ('user_1764650378942', 1, 298);
INSERT INTO public.users VALUES ('user_1764650378943', 1, 16);
INSERT INTO public.users VALUES ('user_1764650613445', 1, 90);
INSERT INTO public.users VALUES ('user_1764650613446', 1, 300);
INSERT INTO public.users VALUES ('user_1764650651619', 1, 435);
INSERT INTO public.users VALUES ('user_1764650651620', 1, 326);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--
