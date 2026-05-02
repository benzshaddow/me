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
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
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
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1777730320148', 2, 271);
INSERT INTO public.users VALUES (1, 'user_1777730320149', 5, 488);
INSERT INTO public.users VALUES (19, 'user_1777730926296', 2, 15);
INSERT INTO public.users VALUES (4, 'user_1777730340156', 2, 636);
INSERT INTO public.users VALUES (18, 'user_1777730926297', 5, 297);
INSERT INTO public.users VALUES (3, 'user_1777730340157', 5, 303);
INSERT INTO public.users VALUES (35, 'user_1777731208252', 2, 297);
INSERT INTO public.users VALUES (6, 'user_1777730438544', 2, 79);
INSERT INTO public.users VALUES (21, 'user_1777731014362', 2, 759);
INSERT INTO public.users VALUES (5, 'user_1777730438545', 5, 4);
INSERT INTO public.users VALUES (7, 'benzshaddow', 1, 20);
INSERT INTO public.users VALUES (34, 'user_1777731208253', 5, 6);
INSERT INTO public.users VALUES (20, 'user_1777731014363', 5, 24);
INSERT INTO public.users VALUES (9, 'user_1777730672260', 2, 580);
INSERT INTO public.users VALUES (8, 'user_1777730672261', 5, 69);
INSERT INTO public.users VALUES (11, 'user_1777730714655', 2, 495);
INSERT INTO public.users VALUES (23, 'user_1777731047925', 2, 417);
INSERT INTO public.users VALUES (10, 'user_1777730714656', 5, 208);
INSERT INTO public.users VALUES (37, 'user_1777731216074', 2, 211);
INSERT INTO public.users VALUES (22, 'user_1777731047926', 5, 121);
INSERT INTO public.users VALUES (13, 'user_1777730817617', 2, 344);
INSERT INTO public.users VALUES (12, 'user_1777730817618', 5, 215);
INSERT INTO public.users VALUES (36, 'user_1777731216075', 5, 38);
INSERT INTO public.users VALUES (25, 'user_1777731115572', 2, 693);
INSERT INTO public.users VALUES (15, 'user_1777730904061', 2, 506);
INSERT INTO public.users VALUES (14, 'user_1777730904062', 5, 133);
INSERT INTO public.users VALUES (24, 'user_1777731115573', 5, 42);
INSERT INTO public.users VALUES (17, 'user_1777730914514', 2, 411);
INSERT INTO public.users VALUES (16, 'user_1777730914515', 5, 373);
INSERT INTO public.users VALUES (27, 'user_1777731123138', 2, 752);
INSERT INTO public.users VALUES (39, 'user_1777731220728', 2, 490);
INSERT INTO public.users VALUES (26, 'user_1777731123139', 5, 287);
INSERT INTO public.users VALUES (38, 'user_1777731220729', 5, 346);
INSERT INTO public.users VALUES (29, 'user_1777731130361', 2, 237);
INSERT INTO public.users VALUES (28, 'user_1777731130362', 5, 146);
INSERT INTO public.users VALUES (31, 'user_1777731138740', 2, 164);
INSERT INTO public.users VALUES (30, 'user_1777731138741', 5, 115);
INSERT INTO public.users VALUES (33, 'user_1777731144330', 2, 492);
INSERT INTO public.users VALUES (32, 'user_1777731144331', 5, 28);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 39, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

