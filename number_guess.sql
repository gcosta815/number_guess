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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    user_id integer,
    guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (40, 2);
INSERT INTO public.games VALUES (40, 8);
INSERT INTO public.games VALUES (40, 5);
INSERT INTO public.games VALUES (43, 8);
INSERT INTO public.games VALUES (43, 1);
INSERT INTO public.games VALUES (44, 3);
INSERT INTO public.games VALUES (44, 3);
INSERT INTO public.games VALUES (43, 8);
INSERT INTO public.games VALUES (43, 10);
INSERT INTO public.games VALUES (43, 3);
INSERT INTO public.games VALUES (40, 3);
INSERT INTO public.games VALUES (40, 3);
INSERT INTO public.games VALUES (40, 3);
INSERT INTO public.games VALUES (40, 3);
INSERT INTO public.games VALUES (40, 3);
INSERT INTO public.games VALUES (40, 8);
INSERT INTO public.games VALUES (40, 8);
INSERT INTO public.games VALUES (40, 8);
INSERT INTO public.games VALUES (40, 3);
INSERT INTO public.games VALUES (45, 2);
INSERT INTO public.games VALUES (45, 7);
INSERT INTO public.games VALUES (46, 4);
INSERT INTO public.games VALUES (46, 4);
INSERT INTO public.games VALUES (45, 12);
INSERT INTO public.games VALUES (45, 2);
INSERT INTO public.games VALUES (45, 3);
INSERT INTO public.games VALUES (47, 348);
INSERT INTO public.games VALUES (47, 194);
INSERT INTO public.games VALUES (48, 405);
INSERT INTO public.games VALUES (48, 397);
INSERT INTO public.games VALUES (47, 494);
INSERT INTO public.games VALUES (47, 370);
INSERT INTO public.games VALUES (47, 64);
INSERT INTO public.games VALUES (49, 402);
INSERT INTO public.games VALUES (49, 732);
INSERT INTO public.games VALUES (50, 674);
INSERT INTO public.games VALUES (50, 312);
INSERT INTO public.games VALUES (49, 921);
INSERT INTO public.games VALUES (49, 124);
INSERT INTO public.games VALUES (49, 303);
INSERT INTO public.games VALUES (51, 494);
INSERT INTO public.games VALUES (51, 380);
INSERT INTO public.games VALUES (52, 168);
INSERT INTO public.games VALUES (52, 854);
INSERT INTO public.games VALUES (51, 680);
INSERT INTO public.games VALUES (51, 792);
INSERT INTO public.games VALUES (51, 924);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (40, 'Guille');
INSERT INTO public.users VALUES (41, 'Felipe');
INSERT INTO public.users VALUES (42, 'Emilia');
INSERT INTO public.users VALUES (43, 'user_1692486219851');
INSERT INTO public.users VALUES (44, 'user_1692486219850');
INSERT INTO public.users VALUES (45, 'user_1692486827385');
INSERT INTO public.users VALUES (46, 'user_1692486827384');
INSERT INTO public.users VALUES (47, 'user_1692486864514');
INSERT INTO public.users VALUES (48, 'user_1692486864513');
INSERT INTO public.users VALUES (49, 'user_1692487239050');
INSERT INTO public.users VALUES (50, 'user_1692487239049');
INSERT INTO public.users VALUES (51, 'user_1692487425974');
INSERT INTO public.users VALUES (52, 'user_1692487425973');


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 52, true);


--
-- Name: users user_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_id_key UNIQUE (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games user_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

