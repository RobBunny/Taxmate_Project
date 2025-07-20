--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
-- SET transaction_timeout = 0;
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
-- Name: financial_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.financial_data (
    id integer NOT NULL,
    client_id integer NOT NULL,
    monthly_salary double precision,
    annual_bonus double precision,
    other_income double precision,
    monthly_rent double precision,
    utilities double precision,
    food_expenses double precision,
    transportation double precision,
    entertainment double precision,
    healthcare double precision,
    other_expenses double precision,
    savings_account double precision,
    checking_account double precision,
    investments double precision,
    property_value double precision,
    vehicle_value double precision,
    other_assets double precision,
    credit_card_debt double precision,
    student_loans double precision,
    mortgage double precision,
    car_loan double precision,
    other_debts double precision,
    financial_goals text,
    risk_tolerance character varying(20),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.financial_data OWNER TO postgres;

--
-- Name: financial_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.financial_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.financial_data_id_seq OWNER TO postgres;

--
-- Name: financial_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.financial_data_id_seq OWNED BY public.financial_data.id;


--
-- Name: loan_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loan_requests (
    id integer NOT NULL,
    client_id integer NOT NULL,
    blo_id integer NOT NULL,
    full_name character varying(100) NOT NULL,
    date_of_birth date NOT NULL,
    nid_number character varying(50) NOT NULL,
    phone_number character varying(20) NOT NULL,
    email character varying(100) NOT NULL,
    present_address text NOT NULL,
    employment_type character varying(50) NOT NULL,
    company_name character varying(100),
    designation character varying(100),
    monthly_income double precision NOT NULL,
    length_of_employment character varying(50) NOT NULL,
    loan_type character varying(100) NOT NULL,
    requested_amount double precision NOT NULL,
    loan_tenure character varying(50) NOT NULL,
    purpose_of_loan text NOT NULL,
    preferred_bank character varying(100) NOT NULL,
    guarantor_name character varying(100),
    guarantor_nid character varying(50),
    guarantor_phone character varying(20),
    collateral_info text,
    notes_remarks text,
    status character varying(20),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.loan_requests OWNER TO postgres;

--
-- Name: loan_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loan_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.loan_requests_id_seq OWNER TO postgres;

--
-- Name: loan_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loan_requests_id_seq OWNED BY public.loan_requests.id;


--
-- Name: loan_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loan_status (
    id integer NOT NULL,
    loan_request_id integer NOT NULL,
    client_id integer NOT NULL,
    blo_id integer NOT NULL,
    status character varying(20) NOT NULL,
    message text,
    updated_at timestamp with time zone,
    requested_amount double precision,
    purpose_of_loan text,
    preferred_bank character varying(100),
    loan_tenure character varying(50)
);


ALTER TABLE public.loan_status OWNER TO postgres;

--
-- Name: loan_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loan_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.loan_status_id_seq OWNER TO postgres;

--
-- Name: loan_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loan_status_id_seq OWNED BY public.loan_status.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    sender_id integer,
    receiver_id integer,
    message character varying,
    "timestamp" timestamp with time zone
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.messages_id_seq OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    token character varying(255) NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    used boolean NOT NULL,
    created_at timestamp with time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- Name: password_reset_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.password_reset_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.password_reset_tokens_id_seq OWNER TO postgres;

--
-- Name: password_reset_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.password_reset_tokens_id_seq OWNED BY public.password_reset_tokens.id;


--
-- Name: service_requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_requests (
    id integer NOT NULL,
    client_id integer NOT NULL,
    ca_id integer,
    status character varying(20),
    blo_id integer,
    fp_id integer
);


ALTER TABLE public.service_requests OWNER TO postgres;

--
-- Name: service_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.service_requests_id_seq OWNER TO postgres;

--
-- Name: service_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_requests_id_seq OWNED BY public.service_requests.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    user_type character varying(50) NOT NULL,
    client_type character varying(50),
    service_provider_type character varying(50),
    full_name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(20) NOT NULL,
    address character varying NOT NULL,
    password character varying NOT NULL,
    profession character varying(100),
    gender character varying(10),
    dob date,
    enterprise_name character varying(100),
    tin_number character varying(50),
    business_type character varying(50),
    experience character varying(50),
    qualification character varying,
    is_approved boolean DEFAULT false,
    fcm_token character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: financial_data id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.financial_data ALTER COLUMN id SET DEFAULT nextval('public.financial_data_id_seq'::regclass);


--
-- Name: loan_requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_requests ALTER COLUMN id SET DEFAULT nextval('public.loan_requests_id_seq'::regclass);


--
-- Name: loan_status id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_status ALTER COLUMN id SET DEFAULT nextval('public.loan_status_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: password_reset_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens ALTER COLUMN id SET DEFAULT nextval('public.password_reset_tokens_id_seq'::regclass);


--
-- Name: service_requests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_requests ALTER COLUMN id SET DEFAULT nextval('public.service_requests_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: financial_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.financial_data (id, client_id, monthly_salary, annual_bonus, other_income, monthly_rent, utilities, food_expenses, transportation, entertainment, healthcare, other_expenses, savings_account, checking_account, investments, property_value, vehicle_value, other_assets, credit_card_debt, student_loans, mortgage, car_loan, other_debts, financial_goals, risk_tolerance, created_at, updated_at) FROM stdin;
1	1	50000	10000	5000	10000	5000	5000	5000	2000	1000	1000	10000	10000	50000	100000	10000	0	0	5000	0	0	0	millionaire 	High	2025-07-17 12:36:16.075167+06	2025-07-17 12:36:16.07518+06
2	16	50000	10000	25000	15000	5000	5000	2500	2000	2500	1000	0	0	0	0	0	0	0	0	0	0	0		Moderate	2025-07-19 16:10:43.885058+06	2025-07-19 16:10:43.885071+06
\.


--
-- Data for Name: loan_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loan_requests (id, client_id, blo_id, full_name, date_of_birth, nid_number, phone_number, email, present_address, employment_type, company_name, designation, monthly_income, length_of_employment, loan_type, requested_amount, loan_tenure, purpose_of_loan, preferred_bank, guarantor_name, guarantor_nid, guarantor_phone, collateral_info, notes_remarks, status, created_at, updated_at) FROM stdin;
1	1	9	Farhan Bin Rabbani 	2004-01-03	377244199	946583127	rab35@email.com	Littleroot Town	salaried	Pok├⌐mon Company 	Nuzlocker	69000	4 years too many tears	Personal	100000	2 years	Health 	BRAC Bank	\N	\N	\N	\N	\N	pending	2025-07-16 00:10:31.941135+06	2025-07-16 00:10:31.94114+06
2	5	4	Red	1995-05-15	001	001001001	red01@email.com	Pallet Town 	salaried	Indigo League 	Champion 	96000	15 years 	Personal	1000000	5 years	Battle Frontier 	BRAC Bank	\N	\N	\N	\N	\N	pending	2025-07-16 03:19:51.508349+06	2025-07-16 03:19:51.508356+06
3	16	19	Aditya 	2004-07-03	1234598765	01675000289	adityaisadumbo@gmail.com	86/C, Giasuddin, DU, Dhaka-1000	salaried	\N	\N	50000	2 years	Personal 	150000	5 years 	Business 	DBBL	\N	\N	\N	\N	\N	pending	2025-07-18 17:22:13.673005+06	2025-07-18 17:22:13.673009+06
\.


--
-- Data for Name: loan_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loan_status (id, loan_request_id, client_id, blo_id, status, message, updated_at, requested_amount, purpose_of_loan, preferred_bank, loan_tenure) FROM stdin;
1	2	5	4	pending	Files have been submitted. Awaiting for Bank reply.	2025-07-16 03:38:56.333722+06	1000000	Battle Frontier 	BRAC Bank	5 years
3	3	16	19	pending	Request Sent.\nAwaiting Bank Approval	2025-07-18 17:27:28.006497+06	150000	Business 	DBBL	5 years 
2	1	1	9	approved		2025-07-19 18:36:45.738752+06	100000	Health 	BRAC Bank	2 years
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, sender_id, receiver_id, message, "timestamp") FROM stdin;
1	1	3	Hi	2025-07-10 13:55:15.147787+06
2	3	1	yo	2025-07-10 13:58:10.087321+06
3	1	3	hello	2025-07-10 14:11:34.65975+06
4	1	3	U married?	2025-07-15 12:29:19.889861+06
5	3	1	Yeah bro	2025-07-15 12:30:14.797251+06
6	1	3	Sed	2025-07-15 12:30:52.331727+06
7	3	5	Hello sor	2025-07-15 17:16:31.919594+06
8	5	3	Hello	2025-07-15 17:17:10.212287+06
9	3	1	hi	2025-07-16 13:35:30.415281+06
10	1	3	Yo	2025-07-16 13:36:21.164632+06
11	3	1	bro	2025-07-16 13:36:25.906469+06
12	3	1	h	2025-07-16 13:36:29.882607+06
13	3	1	dudw	2025-07-16 13:36:41.224495+06
14	1	3	neat	2025-07-16 13:37:20.681461+06
15	1	3	Hey	2025-07-16 13:40:06.517758+06
16	3	1	g	2025-07-16 13:40:52.241236+06
17	1	3	hi	2025-07-16 14:10:24.026584+06
18	3	1	hlw	2025-07-16 14:12:21.045931+06
19	3	1	hlw	2025-07-16 14:12:21.81284+06
20	3	1	hi	2025-07-17 12:30:18.42425+06
21	1	3	yes	2025-07-17 12:30:22.028566+06
22	1	3	ho	2025-07-17 12:30:29.16408+06
23	1	3	i	2025-07-17 12:30:34.055374+06
24	1	3	hi	2025-07-17 12:32:28.616937+06
25	1	3	hi	2025-07-17 12:32:34.81685+06
26	1	3	hi	2025-07-17 12:32:46.100933+06
27	16	17	Hello sir, I would like to request your servive	2025-07-18 17:17:23.161674+06
28	17	16	Of course, How can I help you?	2025-07-18 17:28:22.647198+06
29	16	18	Hello, could I ask for some advice for improving my net worth?	2025-07-19 16:17:38.302845+06
30	18	16	Surely, let me know how I can assist you	2025-07-19 16:18:35.443529+06
31	1	3	hello caΓ£ô$1233456788	2025-07-19 18:40:28.637867+06
32	3	1	raymond	2025-07-19 18:43:35.717327+06
33	3	1	sorry that was my pet rock typing and I don't know what the heck does Raymond mean	2025-07-19 18:45:19.755242+06
34	1	3	I don't care	2025-07-19 18:46:28.157777+06
35	1	3	Hey you there?	2025-07-19 20:38:29.053215+06
36	18	1	Hello Sir, how can I help you	2025-07-19 20:40:33.858045+06
37	3	1	I am	2025-07-19 20:41:18.501471+06
38	1	18	Hi, I want to increase my net worth	2025-07-19 20:42:39.674475+06
39	1	18	How can I save money?	2025-07-19 20:47:40.162101+06
40	18	1	You need to make a balance of how much spend against how much you earn	2025-07-19 20:48:36.608132+06
41	3	5	how r ya	2025-07-19 23:10:33.514843+06
42	5	3	fyne	2025-07-19 23:15:13.318522+06
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (id, email, token, expires_at, used, created_at) FROM stdin;
\.


--
-- Data for Name: service_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_requests (id, client_id, ca_id, status, blo_id, fp_id) FROM stdin;
1	1	3	approved	\N	\N
2	5	3	approved	\N	\N
3	6	3	rejected	\N	\N
9	1	\N	approved	4	\N
10	5	\N	approved	4	\N
11	5	7	pending	\N	\N
12	1	7	pending	\N	\N
13	8	7	pending	\N	\N
14	1	\N	approved	9	\N
16	15	\N	pending	4	\N
17	1	\N	pending	11	\N
15	15	3	approved	\N	\N
18	16	17	approved	\N	\N
20	16	\N	approved	19	\N
21	16	\N	approved	\N	18
22	16	\N	approved	9	\N
24	1	\N	approved	\N	18
23	1	17	approved	\N	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, user_type, client_type, service_provider_type, full_name, email, phone, address, password, profession, gender, dob, enterprise_name, tin_number, business_type, experience, qualification, is_approved, fcm_token) FROM stdin;
2	client	Enterprise	\N	Giovanni 	rocket@email.com	987654321	Celadon 	$2b$12$TCyApOyVxW0Vf/y3Sn4aXup/trMOhyQ6ztpSB88aPdMW2ugNe7OG2		\N	\N	Team Rocket	69	Finance			f	\N
6	client	Individual	\N	Blue	bluedbd@email.com	666000999	Pallet	$2b$12$5warygr0Iybm9f.1idjcWumpIjJWRLxyBVvlw5Q0htqHgFCwbEJSO	Leader	Male	1995-03-25			\N			f	\N
13	service_provider	\N	Financial Planner	Leo DiCaprio	leo@email.com	35487961	Washington 	$2b$12$FYak7i0IsYaccKFy9/3WzutqI02r6FRX38KVNh8n7w.hc.OgaJeyW		Male	1987-01-23			\N	20	B.Com	t	\N
8	client	Individual	\N	Jawad	dark69@email.com	696969691	Fartland	$2b$12$IzGEOmZQFcPU4WBMeC4aMen7.KucDnRq8O2UIjdGbMdUgFgtEfzKG	Student 	Male	2011-09-03			\N			t	dMPqpJ4AQOeCqB3sJOvP9b:APA91bG0xcFOa0mcwkq9phxOXb0z53WX4XwKRyFkrl5RBp-zLlCDfg-NyoHTNEWc8hbp6ZjDtFCqxtXTNTdboy6JAzsAX2VJBV-0lD2ifPVNS8LuaeRIV7Q
11	service_provider	\N	Bank Loan Officer	hsjsj	ase@gmail.com	167979	ajsjjj	$2b$12$1pxpsszM.IBRFRdffdBpnOEKR0cGvuUqzJr0dUheEx3MwTziJZ86u		Male	2000-01-21			\N	12 years	1234	t	\N
7	service_provider	\N	Chartered Accountant	Bruce Lee	bruce@email.com	696969691	Hokkaido 	$2b$12$LEgwUCLvRW0GJBAYW.7.COjXo22A.uSxcLALqemu/jAiv1EY7ypvS		\N	\N			\N	10	420	t	\N
20	client	Individual	\N	Brendan James	brend@email.com	97348123	Littleroot 	$2b$12$iPO7WHHXk7wEB1Vzys7t6OKGRGUeu3mJtQkSYRBhs2oKbPTtJbUAq	Trainer	Male	1998-01-16			\N			t	foldtmiQRKyBPKiys9WJnh:APA91bHHhVXFjU7JROo1SniaQSyisDUm_l3GvArr1B7kOVPL3uT4RRBKzCKI5Nm0gk88_P3sEjQntkxjhEvAiGE3rv73K2Ph_ZEIlogz2g7M20Ro5xDWpZA
4	service_provider	\N	Bank Loan Officer	Jack Mar	jackmar@email.com	78326541	Kentucky 	$2b$12$3VcZQleAaxJ/GFl7Iz4tquAtIuqyXFR6XK6/BYbStMEqT4ly65PPO		\N	\N			\N	5	B.Com	t	fhQ828DBR6anoUMTgWuzZo:APA91bG6t23KAIoNgsy69QqsyHKO_RVQ3XlR6aObnKGNP9keNQLDb07aOaeOUBSFtv1a5cvy-9zeznvCQh32BjanPa1IX7P4dEe1RgeME8o01DoFNZRHmZw
5	client	Individual	\N	Red	red01@email.com	222333444	Pallet	$2b$12$A1NUtmhzwG2so0YwmG65OOCl6c8F7ajezYqP97AtwQLiCOOFLjETO	Master	Male	1995-05-15			\N			f	foldtmiQRKyBPKiys9WJnh:APA91bHHhVXFjU7JROo1SniaQSyisDUm_l3GvArr1B7kOVPL3uT4RRBKzCKI5Nm0gk88_P3sEjQntkxjhEvAiGE3rv73K2Ph_ZEIlogz2g7M20Ro5xDWpZA
16	client	Individual	\N	Aditya 	adityaisadumbo@gmail.com	01675000289	86/C, Giasuddin, DU, Dhaka-1000	$2b$12$m1Dw0zNe/PUeiU.D3Yx7Xe7Jmx1Oud3oMr/KeWpS37AYNGX4ZfAqG	Student 	Male	2004-01-03			\N			t	foldtmiQRKyBPKiys9WJnh:APA91bHHhVXFjU7JROo1SniaQSyisDUm_l3GvArr1B7kOVPL3uT4RRBKzCKI5Nm0gk88_P3sEjQntkxjhEvAiGE3rv73K2Ph_ZEIlogz2g7M20Ro5xDWpZA
17	service_provider	\N	Chartered Accountant	Mau Ka Long	maukl@email.com	97845612	Hokkaido 	$2b$12$H3C0GYcjkTaLKCqwBM4wo.qgAJExmnpxtvwZp3bDS8fI4nfEgQlR6		Male	\N			\N	7	420	t	foldtmiQRKyBPKiys9WJnh:APA91bHHhVXFjU7JROo1SniaQSyisDUm_l3GvArr1B7kOVPL3uT4RRBKzCKI5Nm0gk88_P3sEjQntkxjhEvAiGE3rv73K2Ph_ZEIlogz2g7M20Ro5xDWpZA
1	client	Individual	\N	Rabs	rab35@email.com	999420911	Littleroot 	$2b$12$UK.kWbkVOlzZZqR..ENUqeFwE5WommNHADmwz4xKrLh/E/yJbneUO	Trainer	Male	2004-01-03			\N			f	foldtmiQRKyBPKiys9WJnh:APA91bHHhVXFjU7JROo1SniaQSyisDUm_l3GvArr1B7kOVPL3uT4RRBKzCKI5Nm0gk88_P3sEjQntkxjhEvAiGE3rv73K2Ph_ZEIlogz2g7M20Ro5xDWpZA
19	service_provider	\N	Bank Loan Officer	Laura Dickinson 	laura1@email.com	378482194	Miami	$2b$12$JfPabuTPx4SlUq8jbvUdXeVet9uZ8yW8/lHoBct2/qd2w5EBElGFS		Female	1999-12-31			\N	8	B.Com	t	foldtmiQRKyBPKiys9WJnh:APA91bHHhVXFjU7JROo1SniaQSyisDUm_l3GvArr1B7kOVPL3uT4RRBKzCKI5Nm0gk88_P3sEjQntkxjhEvAiGE3rv73K2Ph_ZEIlogz2g7M20Ro5xDWpZA
18	service_provider	\N	Financial Planner	Mia Yim	miayim@email.com	12784838	Okinawa 	$2b$12$.lCbyEtcr9cIJwR2TRlkgezEuOmn72epZiluKUSkH/6QkWktV7QV6		Male	2000-06-30			\N	6	B.Com	t	foldtmiQRKyBPKiys9WJnh:APA91bHHhVXFjU7JROo1SniaQSyisDUm_l3GvArr1B7kOVPL3uT4RRBKzCKI5Nm0gk88_P3sEjQntkxjhEvAiGE3rv73K2Ph_ZEIlogz2g7M20Ro5xDWpZA
15	client	Individual	\N	Green	green03@email.com	333555777	Cerulean 	$2b$12$CWjO6bpPiKlUlxJg9EcgzuFfrJwqPfRKqXcV/Zo07gzwdk64foxiG	Thief 	Female	2000-01-01			\N			t	eWGOdXVRSOyq19hXuY0Mcq:APA91bF6LTED2SSed1YCVDDF94JRd9UUaknKug6MlqzxHWndYmF-UC3GaaZ0z4Eksr5gD7qP1eDGkREwJoNyYTpyVIRqm4hHxvZqZZXm-VClqbo8sfN72z0
9	service_provider	\N	Bank Loan Officer	John Cena	nucm@email.com	420000024	Boston 	$2b$12$CLpZ1z1Nf9l2GjrLiii5reI//oRY2wtDtITQrKyrkupFB2Dx.Tbc6		\N	\N			\N	20	17 time champ	t	foldtmiQRKyBPKiys9WJnh:APA91bHHhVXFjU7JROo1SniaQSyisDUm_l3GvArr1B7kOVPL3uT4RRBKzCKI5Nm0gk88_P3sEjQntkxjhEvAiGE3rv73K2Ph_ZEIlogz2g7M20Ro5xDWpZA
14	service_provider	\N	Financial Planner	Jennifer 	jenny@email.com	68953421	Kentucky 	$2b$12$2P4FvLfqEoEpksCtQJW9P.DfgpsOJ4vawvIIJRQkKsE1Udvk4RtQu		Female	1998-04-17			\N	8	B.Com	t	foldtmiQRKyBPKiys9WJnh:APA91bHHhVXFjU7JROo1SniaQSyisDUm_l3GvArr1B7kOVPL3uT4RRBKzCKI5Nm0gk88_P3sEjQntkxjhEvAiGE3rv73K2Ph_ZEIlogz2g7M20Ro5xDWpZA
10	admin	\N	\N	Admin User	admin@gmail.com	0000000000	Admin HQ	$2b$12$.Ii00heiAkUP9KGwJ60zh.dIJldftueRfkLeu5DQih8uQrDp5Zsmq	\N	\N	\N	\N	\N	\N	\N	\N	t	foldtmiQRKyBPKiys9WJnh:APA91bHHhVXFjU7JROo1SniaQSyisDUm_l3GvArr1B7kOVPL3uT4RRBKzCKI5Nm0gk88_P3sEjQntkxjhEvAiGE3rv73K2Ph_ZEIlogz2g7M20Ro5xDWpZA
3	service_provider	\N	Chartered Accountant	John Doe	johndoe@email.com	63458921	Washington 	$2b$12$GEQHBWO5sIjCOgxM0Do//Ov.ytjsyJRR32dXtrupiI.7go/rU7kI6		\N	\N			\N	6	4	t	foldtmiQRKyBPKiys9WJnh:APA91bHHhVXFjU7JROo1SniaQSyisDUm_l3GvArr1B7kOVPL3uT4RRBKzCKI5Nm0gk88_P3sEjQntkxjhEvAiGE3rv73K2Ph_ZEIlogz2g7M20Ro5xDWpZA
\.


--
-- Name: financial_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.financial_data_id_seq', 2, true);


--
-- Name: loan_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loan_requests_id_seq', 3, true);


--
-- Name: loan_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loan_status_id_seq', 3, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.messages_id_seq', 42, true);


--
-- Name: password_reset_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.password_reset_tokens_id_seq', 1, false);


--
-- Name: service_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_requests_id_seq', 24, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 20, true);


--
-- Name: financial_data financial_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.financial_data
    ADD CONSTRAINT financial_data_pkey PRIMARY KEY (id);


--
-- Name: loan_requests loan_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_requests
    ADD CONSTRAINT loan_requests_pkey PRIMARY KEY (id);


--
-- Name: loan_status loan_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_status
    ADD CONSTRAINT loan_status_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (id);


--
-- Name: service_requests service_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_requests
    ADD CONSTRAINT service_requests_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: idx_service_requests_blo_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_service_requests_blo_id ON public.service_requests USING btree (blo_id);


--
-- Name: ix_financial_data_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_financial_data_id ON public.financial_data USING btree (id);


--
-- Name: ix_loan_requests_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_loan_requests_id ON public.loan_requests USING btree (id);


--
-- Name: ix_loan_status_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_loan_status_id ON public.loan_status USING btree (id);


--
-- Name: ix_password_reset_tokens_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_password_reset_tokens_email ON public.password_reset_tokens USING btree (email);


--
-- Name: ix_password_reset_tokens_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_password_reset_tokens_id ON public.password_reset_tokens USING btree (id);


--
-- Name: ix_password_reset_tokens_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_password_reset_tokens_token ON public.password_reset_tokens USING btree (token);


--
-- Name: ix_service_requests_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_service_requests_id ON public.service_requests USING btree (id);


--
-- Name: ix_users_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_users_email ON public.users USING btree (email);


--
-- Name: ix_users_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_users_id ON public.users USING btree (id);


--
-- Name: financial_data financial_data_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.financial_data
    ADD CONSTRAINT financial_data_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.users(id);


--
-- Name: service_requests fk_service_requests_blo_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_requests
    ADD CONSTRAINT fk_service_requests_blo_id FOREIGN KEY (blo_id) REFERENCES public.users(id);


--
-- Name: loan_requests loan_requests_blo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_requests
    ADD CONSTRAINT loan_requests_blo_id_fkey FOREIGN KEY (blo_id) REFERENCES public.users(id);


--
-- Name: loan_requests loan_requests_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_requests
    ADD CONSTRAINT loan_requests_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.users(id);


--
-- Name: loan_status loan_status_blo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_status
    ADD CONSTRAINT loan_status_blo_id_fkey FOREIGN KEY (blo_id) REFERENCES public.users(id);


--
-- Name: loan_status loan_status_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_status
    ADD CONSTRAINT loan_status_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.users(id);


--
-- Name: loan_status loan_status_loan_request_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan_status
    ADD CONSTRAINT loan_status_loan_request_id_fkey FOREIGN KEY (loan_request_id) REFERENCES public.loan_requests(id);


--
-- Name: service_requests service_requests_ca_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_requests
    ADD CONSTRAINT service_requests_ca_id_fkey FOREIGN KEY (ca_id) REFERENCES public.users(id);


--
-- Name: service_requests service_requests_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_requests
    ADD CONSTRAINT service_requests_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.users(id);


--
-- Name: service_requests service_requests_fp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_requests
    ADD CONSTRAINT service_requests_fp_id_fkey FOREIGN KEY (fp_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

