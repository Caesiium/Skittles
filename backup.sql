--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: groceries; Type: TABLE; Schema: public; Owner: ssh_groceries_user
--

CREATE TABLE public.groceries (
    grocery_id integer NOT NULL,
    grocery_name character varying(255) NOT NULL,
    grocery_price numeric NOT NULL,
    supermarket_id integer NOT NULL,
    grocery_type character varying(50)
);


ALTER TABLE public.groceries OWNER TO ssh_groceries_user;

--
-- Name: groceries_grocery_id_seq; Type: SEQUENCE; Schema: public; Owner: ssh_groceries_user
--

CREATE SEQUENCE public.groceries_grocery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.groceries_grocery_id_seq OWNER TO ssh_groceries_user;

--
-- Name: groceries_grocery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ssh_groceries_user
--

ALTER SEQUENCE public.groceries_grocery_id_seq OWNED BY public.groceries.grocery_id;


--
-- Name: items_in_order; Type: TABLE; Schema: public; Owner: ssh_groceries_user
--

CREATE TABLE public.items_in_order (
    item_in_order_id integer NOT NULL,
    order_id integer NOT NULL,
    user_id integer NOT NULL,
    grocery_id integer NOT NULL,
    quantity integer NOT NULL,
    price numeric NOT NULL,
    total_price numeric GENERATED ALWAYS AS ((price * (quantity)::numeric)) STORED
);


ALTER TABLE public.items_in_order OWNER TO ssh_groceries_user;

--
-- Name: items_in_order_item_in_order_id_seq; Type: SEQUENCE; Schema: public; Owner: ssh_groceries_user
--

CREATE SEQUENCE public.items_in_order_item_in_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.items_in_order_item_in_order_id_seq OWNER TO ssh_groceries_user;

--
-- Name: items_in_order_item_in_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ssh_groceries_user
--

ALTER SEQUENCE public.items_in_order_item_in_order_id_seq OWNED BY public.items_in_order.item_in_order_id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: ssh_groceries_user
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    supermarket_id integer NOT NULL,
    total_price integer,
    order_made date DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE public.orders OWNER TO ssh_groceries_user;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: ssh_groceries_user
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_order_id_seq OWNER TO ssh_groceries_user;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ssh_groceries_user
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- Name: supermarkets; Type: TABLE; Schema: public; Owner: ssh_groceries_user
--

CREATE TABLE public.supermarkets (
    supermarket_id integer NOT NULL,
    supermarket_name character varying(255)
);


ALTER TABLE public.supermarkets OWNER TO ssh_groceries_user;

--
-- Name: supermarkets_supermarket_id_seq; Type: SEQUENCE; Schema: public; Owner: ssh_groceries_user
--

CREATE SEQUENCE public.supermarkets_supermarket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.supermarkets_supermarket_id_seq OWNER TO ssh_groceries_user;

--
-- Name: supermarkets_supermarket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ssh_groceries_user
--

ALTER SEQUENCE public.supermarkets_supermarket_id_seq OWNED BY public.supermarkets.supermarket_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: ssh_groceries_user
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    user_name character varying(255) NOT NULL,
    user_email character varying(255) NOT NULL,
    user_password character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO ssh_groceries_user;

--
-- Name: users_in_order; Type: TABLE; Schema: public; Owner: ssh_groceries_user
--

CREATE TABLE public.users_in_order (
    user_in_order_id integer NOT NULL,
    order_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_in_order OWNER TO ssh_groceries_user;

--
-- Name: users_in_order_user_in_order_id_seq; Type: SEQUENCE; Schema: public; Owner: ssh_groceries_user
--

CREATE SEQUENCE public.users_in_order_user_in_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_in_order_user_in_order_id_seq OWNER TO ssh_groceries_user;

--
-- Name: users_in_order_user_in_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ssh_groceries_user
--

ALTER SEQUENCE public.users_in_order_user_in_order_id_seq OWNED BY public.users_in_order.user_in_order_id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ssh_groceries_user
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO ssh_groceries_user;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ssh_groceries_user
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: groceries grocery_id; Type: DEFAULT; Schema: public; Owner: ssh_groceries_user
--

ALTER TABLE ONLY public.groceries ALTER COLUMN grocery_id SET DEFAULT nextval('public.groceries_grocery_id_seq'::regclass);


--
-- Name: items_in_order item_in_order_id; Type: DEFAULT; Schema: public; Owner: ssh_groceries_user
--

ALTER TABLE ONLY public.items_in_order ALTER COLUMN item_in_order_id SET DEFAULT nextval('public.items_in_order_item_in_order_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: ssh_groceries_user
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: supermarkets supermarket_id; Type: DEFAULT; Schema: public; Owner: ssh_groceries_user
--

ALTER TABLE ONLY public.supermarkets ALTER COLUMN supermarket_id SET DEFAULT nextval('public.supermarkets_supermarket_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: ssh_groceries_user
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_in_order user_in_order_id; Type: DEFAULT; Schema: public; Owner: ssh_groceries_user
--

ALTER TABLE ONLY public.users_in_order ALTER COLUMN user_in_order_id SET DEFAULT nextval('public.users_in_order_user_in_order_id_seq'::regclass);


--
-- Data for Name: groceries; Type: TABLE DATA; Schema: public; Owner: ssh_groceries_user
--

COPY public.groceries (grocery_id, grocery_name, grocery_price, supermarket_id, grocery_type) FROM stdin;
501	Apple	0.25	1	Fruit
502	Apple	0.2	2	Fruit
503	Apple	0.22	3	Fruit
504	Apple	0.2	4	Fruit
505	Apple	0.3	5	Fruit
506	Apple	0.15	6	Fruit
507	Apple	0.35	7	Fruit
508	Apple	0.4	8	Fruit
509	Apple	0.27	9	Fruit
510	Apple	0.25	10	Fruit
511	Apple Juice	2.00	1	Juice and Drinks
512	Apple Juice	2.25	2	Juice and Drinks
513	Apple Juice	1.75	3	Juice and Drinks
514	Apple Juice	1.60	4	Juice and Drinks
515	Apple Juice	3.00	5	Juice and Drinks
516	Apple Juice	2.00	6	Juice and Drinks
517	Apple Juice	1.25	7	Juice and Drinks
518	Apple Juice	3.00	8	Juice and Drinks
519	Apple Juice	2.80	9	Juice and Drinks
520	Apple Juice	2.00	10	Juice and Drinks
521	Bacon	4.00	1	Meat and Eggs
522	Bacon	3.80	2	Meat and Eggs
523	Bacon	3.60	3	Meat and Eggs
524	Bacon	3.50	4	Meat and Eggs
525	Bacon	3.90	5	Meat and Eggs
526	Bacon	4.20	6	Meat and Eggs
527	Bacon	4.10	7	Meat and Eggs
528	Bacon	4.30	8	Meat and Eggs
529	Bacon	4.00	9	Meat and Eggs
530	Bacon	4.40	10	Meat and Eggs
531	Banana	0.50	1	Fruit
532	Banana	0.45	2	Fruit
533	Banana	0.55	3	Fruit
534	Banana	0.50	4	Fruit
535	Banana	0.60	5	Fruit
536	Banana	0.55	6	Fruit
537	Banana	0.65	7	Fruit
538	Banana	0.70	8	Fruit
539	Banana	0.50	9	Fruit
540	Banana	0.75	10	Fruit
541	Blue Milk	1.20	1	Dairy
542	Blue Milk	1.10	2	Dairy
543	Blue Milk	1.30	3	Dairy
544	Blue Milk	1.20	4	Dairy
545	Blue Milk	1.40	5	Dairy
546	Blue Milk	1.25	6	Dairy
547	Blue Milk	1.35	7	Dairy
548	Blue Milk	1.50	8	Dairy
549	Blue Milk	1.20	9	Dairy
550	Blue Milk	1.55	10	Dairy
551	Broccoli	1.00	1	Vegetables
552	Broccoli	0.90	2	Vegetables
553	Broccoli	1.10	3	Vegetables
554	Broccoli	1.00	4	Vegetables
555	Broccoli	1.20	5	Vegetables
556	Broccoli	1.15	6	Vegetables
557	Broccoli	1.25	7	Vegetables
558	Broccoli	1.30	8	Vegetables
559	Broccoli	1.00	9	Vegetables
560	Broccoli	1.35	10	Vegetables
561	Brown Bread	1.50	1	Bakery
562	Brown Bread	1.40	2	Bakery
563	Brown Bread	1.60	3	Bakery
564	Brown Bread	1.50	4	Bakery
565	Brown Bread	1.70	5	Bakery
566	Brown Bread	1.65	6	Bakery
567	Brown Bread	1.75	7	Bakery
568	Brown Bread	1.80	8	Bakery
569	Brown Bread	1.50	9	Bakery
570	Brown Bread	1.85	10	Bakery
571	Cabbage	0.80	1	Vegetables
572	Cabbage	0.75	2	Vegetables
573	Cabbage	0.85	3	Vegetables
574	Cabbage	0.80	4	Vegetables
575	Cabbage	0.90	5	Vegetables
576	Cabbage	0.85	6	Vegetables
577	Cabbage	0.95	7	Vegetables
578	Cabbage	1.00	8	Vegetables
579	Cabbage	0.80	9	Vegetables
580	Cabbage	1.05	10	Vegetables
581	Carrot	0.60	1	Vegetables
582	Carrot	0.55	2	Vegetables
583	Carrot	0.65	3	Vegetables
584	Carrot	0.60	4	Vegetables
585	Carrot	0.70	5	Vegetables
586	Carrot	0.65	6	Vegetables
587	Carrot	0.75	7	Vegetables
588	Carrot	0.80	8	Vegetables
589	Carrot	0.60	9	Vegetables
590	Carrot	0.85	10	Vegetables
591	Cauliflower	1.00	1	Vegetables
592	Cauliflower	0.90	2	Vegetables
593	Cauliflower	1.10	3	Vegetables
594	Cauliflower	1.00	4	Vegetables
595	Cauliflower	1.20	5	Vegetables
596	Cauliflower	1.15	6	Vegetables
597	Cauliflower	1.25	7	Vegetables
598	Cauliflower	1.30	8	Vegetables
599	Cauliflower	1.00	9	Vegetables
600	Cauliflower	1.35	10	Vegetables
601	Cheese	2.50	1	Dairy
602	Cheese	2.40	2	Dairy
603	Cheese	2.60	3	Dairy
604	Cheese	2.50	4	Dairy
605	Cheese	2.70	5	Dairy
606	Cheese	2.65	6	Dairy
607	Cheese	2.75	7	Dairy
608	Cheese	2.80	8	Dairy
609	Cheese	2.50	9	Dairy
610	Cheese	2.85	10	Dairy
611	Cheese Pizza	7.00	1	Frozen Items
612	Cheese Pizza	6.80	2	Frozen Items
613	Cheese Pizza	7.20	3	Frozen Items
614	Cheese Pizza	7.00	4	Frozen Items
615	Cheese Pizza	7.50	5	Frozen Items
616	Cheese Pizza	7.25	6	Frozen Items
617	Cheese Pizza	7.75	7	Frozen Items
618	Cheese Pizza	8.00	8	Frozen Items
619	Cheese Pizza	7.00	9	Frozen Items
620	Cheese Pizza	8.25	10	Frozen Items
621	Cola	1.00	1	Juice and Drinks
622	Cola	0.90	2	Juice and Drinks
623	Cola	1.10	3	Juice and Drinks
624	Cola	1.00	4	Juice and Drinks
625	Cola	1.20	5	Juice and Drinks
626	Cola	1.15	6	Juice and Drinks
627	Cola	1.25	7	Juice and Drinks
628	Cola	1.30	8	Juice and Drinks
629	Cola	1.00	9	Juice and Drinks
630	Cola	1.35	10	Juice and Drinks
631	Cookie	0.75	1	Bakery
632	Cookie	0.70	2	Bakery
633	Cookie	0.80	3	Bakery
634	Cookie	0.75	4	Bakery
635	Cookie	0.85	5	Bakery
636	Cookie	0.80	6	Bakery
637	Cookie	0.90	7	Bakery
638	Cookie	0.95	8	Bakery
639	Cookie	0.75	9	Bakery
640	Cookie	1.00	10	Bakery
641	Crisps	1.50	1	Snacks
642	Crisps	1.40	2	Snacks
643	Crisps	1.60	3	Snacks
644	Crisps	1.50	4	Snacks
645	Crisps	1.70	5	Snacks
646	Crisps	1.65	6	Snacks
647	Crisps	1.75	7	Snacks
648	Crisps	1.80	8	Snacks
649	Crisps	1.50	9	Snacks
650	Crisps	1.85	10	Snacks
651	Croissant	1.00	1	Bakery
652	Croissant	0.95	2	Bakery
653	Croissant	1.05	3	Bakery
654	Croissant	1.00	4	Bakery
655	Croissant	1.10	5	Bakery
656	Croissant	1.05	6	Bakery
657	Croissant	1.15	7	Bakery
658	Croissant	1.20	8	Bakery
659	Croissant	1.00	9	Bakery
660	Croissant	1.25	10	Bakery
661	Cupcake	1.50	1	Bakery
662	Cupcake	1.40	2	Bakery
663	Cupcake	1.60	3	Bakery
664	Cupcake	1.50	4	Bakery
665	Cupcake	1.70	5	Bakery
666	Cupcake	1.65	6	Bakery
667	Cupcake	1.75	7	Bakery
668	Cupcake	1.80	8	Bakery
669	Cupcake	1.50	9	Bakery
670	Cupcake	1.85	10	Bakery
671	Egg	0.25	1	Meat and Eggs
672	Egg	0.20	2	Meat and Eggs
673	Egg	0.30	3	Meat and Eggs
674	Egg	0.25	4	Meat and Eggs
675	Egg	0.35	5	Meat and Eggs
676	Egg	0.30	6	Meat and Eggs
677	Egg	0.40	7	Meat and Eggs
678	Egg	0.45	8	Meat and Eggs
679	Egg	0.25	9	Meat and Eggs
680	Egg	0.50	10	Meat and Eggs
681	Fanta	1.50	1	Juice and Drinks
682	Fanta	1.40	2	Juice and Drinks
683	Fanta	1.60	3	Juice and Drinks
684	Fanta	1.50	4	Juice and Drinks
685	Fanta	1.70	5	Juice and Drinks
686	Fanta	1.65	6	Juice and Drinks
687	Fanta	1.75	7	Juice and Drinks
688	Fanta	1.80	8	Juice and Drinks
689	Fanta	1.50	9	Juice and Drinks
690	Fanta	1.85	10	Juice and Drinks
691	Flour	0.80	1	Home Baking
692	Flour	0.75	2	Home Baking
693	Flour	0.85	3	Home Baking
694	Flour	0.80	4	Home Baking
695	Flour	0.90	5	Home Baking
696	Flour	0.85	6	Home Baking
697	Flour	0.95	7	Home Baking
698	Flour	1.00	8	Home Baking
699	Flour	0.80	9	Home Baking
700	Flour	1.05	10	Home Baking
701	Grapes	2.00	1	Fruit
702	Grapes	1.90	2	Fruit
703	Grapes	2.10	3	Fruit
704	Grapes	2.00	4	Fruit
705	Grapes	2.20	5	Fruit
706	Grapes	2.15	6	Fruit
707	Grapes	2.25	7	Fruit
708	Grapes	2.30	8	Fruit
709	Grapes	2.00	9	Fruit
710	Grapes	2.35	10	Fruit
711	Green Milk	1.20	1	Dairy
712	Green Milk	1.10	2	Dairy
713	Green Milk	1.30	3	Dairy
714	Green Milk	1.20	4	Dairy
715	Green Milk	1.40	5	Dairy
716	Green Milk	1.35	6	Dairy
717	Green Milk	1.45	7	Dairy
718	Green Milk	1.50	8	Dairy
719	Green Milk	1.20	9	Dairy
720	Green Milk	1.55	10	Dairy
721	Hawaiian Pizza	7.00	1	Frozen Items
722	Hawaiian Pizza	6.80	2	Frozen Items
723	Hawaiian Pizza	7.20	3	Frozen Items
724	Hawaiian Pizza	7.00	4	Frozen Items
725	Hawaiian Pizza	7.50	5	Frozen Items
726	Hawaiian Pizza	7.25	6	Frozen Items
727	Hawaiian Pizza	7.75	7	Frozen Items
728	Hawaiian Pizza	8.00	8	Frozen Items
729	Hawaiian Pizza	7.00	9	Frozen Items
730	Hawaiian Pizza	8.25	10	Frozen Items
731	Ketchup	1.50	1	Sauces and Seasoning
732	Ketchup	1.40	2	Sauces and Seasoning
733	Ketchup	1.60	3	Sauces and Seasoning
734	Ketchup	1.50	4	Sauces and Seasoning
735	Ketchup	1.70	5	Sauces and Seasoning
736	Ketchup	1.65	6	Sauces and Seasoning
737	Ketchup	1.75	7	Sauces and Seasoning
738	Ketchup	1.80	8	Sauces and Seasoning
739	Ketchup	1.50	9	Sauces and Seasoning
740	Ketchup	1.85	10	Sauces and Seasoning
741	Lemon	0.50	1	Fruit
742	Lemon	0.45	2	Fruit
743	Lemon	0.55	3	Fruit
744	Lemon	0.50	4	Fruit
745	Lemon	0.60	5	Fruit
746	Lemon	0.55	6	Fruit
747	Lemon	0.65	7	Fruit
748	Lemon	0.70	8	Fruit
749	Lemon	0.50	9	Fruit
750	Lemon	0.75	10	Fruit
751	Lime	0.40	1	Fruit
752	Lime	0.35	2	Fruit
753	Lime	0.45	3	Fruit
754	Lime	0.40	4	Fruit
755	Lime	0.50	5	Fruit
756	Lime	0.45	6	Fruit
757	Lime	0.55	7	Fruit
758	Lime	0.60	8	Fruit
759	Lime	0.40	9	Fruit
760	Lime	0.65	10	Fruit
761	Mayonnaise	2.00	1	Sauces and Seasoning
762	Mayonnaise	1.90	2	Sauces and Seasoning
763	Mayonnaise	2.10	3	Sauces and Seasoning
764	Mayonnaise	2.00	4	Sauces and Seasoning
765	Mayonnaise	2.20	5	Sauces and Seasoning
766	Mayonnaise	2.15	6	Sauces and Seasoning
767	Mayonnaise	2.25	7	Sauces and Seasoning
768	Mayonnaise	2.30	8	Sauces and Seasoning
769	Mayonnaise	2.00	9	Sauces and Seasoning
770	Mayonnaise	2.35	10	Sauces and Seasoning
771	Milk Chocolate	1.00	1	Snacks
772	Milk Chocolate	0.95	2	Snacks
773	Milk Chocolate	1.05	3	Snacks
774	Milk Chocolate	1.00	4	Snacks
775	Milk Chocolate	1.10	5	Snacks
776	Milk Chocolate	1.05	6	Snacks
777	Milk Chocolate	1.15	7	Snacks
778	Milk Chocolate	1.20	8	Snacks
779	Milk Chocolate	1.00	9	Snacks
780	Milk Chocolate	1.25	10	Snacks
781	Onion	0.30	1	Vegetables
782	Onion	0.25	2	Vegetables
783	Onion	0.35	3	Vegetables
784	Onion	0.30	4	Vegetables
785	Onion	0.40	5	Vegetables
786	Onion	0.35	6	Vegetables
787	Onion	0.45	7	Vegetables
788	Onion	0.50	8	Vegetables
789	Onion	0.30	9	Vegetables
790	Onion	0.55	10	Vegetables
791	Orange	0.60	1	Fruit
792	Orange	0.55	2	Fruit
793	Orange	0.65	3	Fruit
794	Orange	0.60	4	Fruit
795	Orange	0.70	5	Fruit
796	Orange	0.65	6	Fruit
797	Orange	0.75	7	Fruit
798	Orange	0.80	8	Fruit
799	Orange	0.60	9	Fruit
800	Orange	0.85	10	Fruit
801	Parsnip	0.80	1	Vegetables
802	Parsnip	0.75	2	Vegetables
803	Parsnip	0.85	3	Vegetables
804	Parsnip	0.80	4	Vegetables
805	Parsnip	0.90	5	Vegetables
806	Parsnip	0.85	6	Vegetables
807	Parsnip	0.95	7	Vegetables
808	Parsnip	1.00	8	Vegetables
809	Parsnip	0.80	9	Vegetables
810	Parsnip	1.05	10	Vegetables
811	Pasta	1.00	1	Pasta and Rice
812	Pasta	0.90	2	Pasta and Rice
813	Pasta	1.10	3	Pasta and Rice
814	Pasta	1.00	4	Pasta and Rice
815	Pasta	1.20	5	Pasta and Rice
816	Pasta	1.15	6	Pasta and Rice
817	Pasta	1.25	7	Pasta and Rice
818	Pasta	1.30	8	Pasta and Rice
819	Pasta	1.00	9	Pasta and Rice
820	Pasta	1.35	10	Pasta and Rice
821	Pepper	0.60	1	Vegetables
822	Pepper	0.55	2	Vegetables
823	Pepper	0.65	3	Vegetables
824	Pepper	0.60	4	Vegetables
825	Pepper	0.70	5	Vegetables
826	Pepper	0.65	6	Vegetables
827	Pepper	0.75	7	Vegetables
828	Pepper	0.80	8	Vegetables
829	Pepper	0.60	9	Vegetables
830	Pepper	0.85	10	Vegetables
831	Pepperoni Pizza	12.99	1	Frozen Food
832	Pepperoni Pizza	12.50	2	Frozen Food
833	Pepperoni Pizza	13.50	3	Frozen Food
834	Pepperoni Pizza	12.99	4	Frozen Food
835	Pepperoni Pizza	13.00	5	Frozen Food
836	Pepperoni Pizza	12.75	6	Frozen Food
837	Pepperoni Pizza	13.25	7	Frozen Food
838	Pepperoni Pizza	12.80	8	Frozen Food
839	Pepperoni Pizza	12.99	9	Frozen Food
840	Pepperoni Pizza	13.10	10	Frozen Food
841	Potato	0.50	1	Vegetables
842	Potato	0.45	2	Vegetables
843	Potato	0.55	3	Vegetables
844	Potato	0.50	4	Vegetables
845	Potato	0.60	5	Vegetables
846	Potato	0.55	6	Vegetables
847	Potato	0.65	7	Vegetables
848	Potato	0.70	8	Vegetables
849	Potato	0.50	9	Vegetables
850	Potato	0.75	10	Vegetables
851	Raw Chicken	5.00	1	Meat and Eggs
852	Raw Chicken	4.80	2	Meat and Eggs
853	Raw Chicken	5.20	3	Meat and Eggs
854	Raw Chicken	5.00	4	Meat and Eggs
855	Raw Chicken	5.50	5	Meat and Eggs
856	Raw Chicken	5.25	6	Meat and Eggs
857	Raw Chicken	5.75	7	Meat and Eggs
858	Raw Chicken	6.00	8	Meat and Eggs
859	Raw Chicken	5.00	9	Meat and Eggs
860	Raw Chicken	6.25	10	Meat and Eggs
861	Red Milk	1.50	1	Dairy
862	Red Milk	1.40	2	Dairy
863	Red Milk	1.60	3	Dairy
864	Red Milk	1.50	4	Dairy
865	Red Milk	1.70	5	Dairy
866	Red Milk	1.65	6	Dairy
867	Red Milk	1.75	7	Dairy
868	Red Milk	1.80	8	Dairy
869	Red Milk	1.50	9	Dairy
870	Red Milk	1.85	10	Dairy
871	Rice	2.00	1	Pasta and Rice
872	Rice	1.90	2	Pasta and Rice
873	Rice	2.10	3	Pasta and Rice
874	Rice	2.00	4	Pasta and Rice
875	Rice	2.20	5	Pasta and Rice
876	Rice	2.15	6	Pasta and Rice
877	Rice	2.25	7	Pasta and Rice
878	Rice	2.30	8	Pasta and Rice
879	Rice	2.00	9	Pasta and Rice
880	Rice	2.35	10	Pasta and Rice
881	Roast Chicken	7.00	1	Ready Meals
882	Roast Chicken	6.80	2	Ready Meals
883	Roast Chicken	7.20	3	Ready Meals
884	Roast Chicken	7.00	4	Ready Meals
885	Roast Chicken	7.50	5	Ready Meals
886	Roast Chicken	7.25	6	Ready Meals
887	Roast Chicken	7.75	7	Ready Meals
888	Roast Chicken	8.00	8	Ready Meals
889	Roast Chicken	7.00	9	Ready Meals
890	Roast Chicken	8.25	10	Ready Meals
891	Salt	0.50	1	Sauces and Seasoning
892	Salt	0.45	2	Sauces and Seasoning
893	Salt	0.55	3	Sauces and Seasoning
894	Salt	0.50	4	Sauces and Seasoning
895	Salt	0.60	5	Sauces and Seasoning
896	Salt	0.55	6	Sauces and Seasoning
897	Salt	0.65	7	Sauces and Seasoning
898	Salt	0.70	8	Sauces and Seasoning
899	Salt	0.50	9	Sauces and Seasoning
900	Salt	0.75	10	Sauces and Seasoning
901	Soup	2.50	1	Ready Meals
902	Soup	2.40	2	Ready Meals
903	Soup	2.60	3	Ready Meals
904	Soup	2.50	4	Ready Meals
905	Soup	2.70	5	Ready Meals
906	Soup	2.65	6	Ready Meals
907	Soup	2.75	7	Ready Meals
908	Soup	2.80	8	Ready Meals
909	Soup	2.50	9	Ready Meals
910	Soup	2.85	10	Ready Meals
911	Sugar	1.00	1	Home Baking
912	Sugar	0.90	2	Home Baking
913	Sugar	1.10	3	Home Baking
914	Sugar	1.00	4	Home Baking
915	Sugar	1.20	5	Home Baking
916	Sugar	1.15	6	Home Baking
917	Sugar	1.25	7	Home Baking
918	Sugar	1.30	8	Home Baking
919	Sugar	1.00	9	Home Baking
920	Sugar	1.35	10	Home Baking
921	Tea	3.00	1	Tea and Coffee
922	Tea	2.80	2	Tea and Coffee
923	Tea	3.20	3	Tea and Coffee
924	Tea	3.00	4	Tea and Coffee
925	Tea	3.50	5	Tea and Coffee
926	Tea	3.25	6	Tea and Coffee
927	Tea	3.75	7	Tea and Coffee
928	Tea	4.00	8	Tea and Coffee
929	Tea	3.00	9	Tea and Coffee
930	Tea	4.25	10	Tea and Coffee
931	Beans	1.50	1	Vegetables
932	Beans	1.40	2	Vegetables
933	Beans	1.60	3	Vegetables
934	Beans	1.50	4	Vegetables
935	Beans	1.70	5	Vegetables
936	Beans	1.65	6	Vegetables
937	Beans	1.75	7	Vegetables
938	Beans	1.80	8	Vegetables
939	Beans	1.50	9	Vegetables
940	Beans	1.85	10	Vegetables
941	Pineapple	1.00	1	Fruit
942	Pineapple	0.90	2	Fruit
943	Pineapple	1.10	3	Fruit
944	Pineapple	1.00	4	Fruit
945	Pineapple	1.20	5	Fruit
946	Pineapple	1.15	6	Fruit
947	Pineapple	1.25	7	Fruit
948	Pineapple	1.30	8	Fruit
949	Pineapple	1.00	9	Fruit
950	Pineapple	1.35	10	Fruit
951	Tomato	0.80	1	Vegetables
952	Tomato	0.75	2	Vegetables
953	Tomato	0.85	3	Vegetables
954	Tomato	0.80	4	Vegetables
955	Tomato	0.90	5	Vegetables
956	Tomato	0.85	6	Vegetables
957	Tomato	0.95	7	Vegetables
958	Tomato	1.00	8	Vegetables
959	Tomato	0.80	9	Vegetables
960	Tomato	1.05	10	Vegetables
961	Water	0.50	1	Water
962	Water	0.45	2	Water
963	Water	0.55	3	Water
964	Water	0.50	4	Water
965	Water	0.60	5	Water
966	Water	0.55	6	Water
967	Water	0.65	7	Water
968	Water	0.70	8	Water
969	Water	0.50	9	Water
970	Water	0.75	10	Water
971	White Bread	1.50	1	Bakery
972	White Bread	1.40	2	Bakery
973	White Bread	1.60	3	Bakery
974	White Bread	1.50	4	Bakery
975	White Bread	1.70	5	Bakery
976	White Bread	1.65	6	Bakery
977	White Bread	1.75	7	Bakery
978	White Bread	1.80	8	Bakery
979	White Bread	1.50	9	Bakery
980	White Bread	1.85	10	Bakery
981	White Chocolate	2.00	1	Snacks
982	White Chocolate	1.90	2	Snacks
983	White Chocolate	2.10	3	Snacks
984	White Chocolate	2.00	4	Snacks
985	White Chocolate	2.20	5	Snacks
986	White Chocolate	2.15	6	Snacks
987	White Chocolate	2.25	7	Snacks
988	White Chocolate	2.30	8	Snacks
989	White Chocolate	2.00	9	Snacks
990	White Chocolate	2.35	10	Snacks
991	Yoghurt	1.20	1	Dairy
992	Yoghurt	1.15	2	Dairy
993	Yoghurt	1.25	3	Dairy
994	Yoghurt	1.20	4	Dairy
995	Yoghurt	1.30	5	Dairy
996	Yoghurt	1.25	6	Dairy
997	Yoghurt	1.35	7	Dairy
998	Yoghurt	1.40	8	Dairy
999	Yoghurt	1.20	9	Dairy
1000	Yoghurt	1.45	10	Dairy
\.


--
-- Data for Name: items_in_order; Type: TABLE DATA; Schema: public; Owner: ssh_groceries_user
--

COPY public.items_in_order (item_in_order_id, order_id, user_id, grocery_id, quantity, price) FROM stdin;
2	55	1	561	5	1.50
3	55	1	571	2	0.80
4	55	1	561	5	1.50
5	55	1	571	2	0.80
6	55	1	631	4	0.75
7	55	1	641	3	1.50
8	55	1	651	4	1.00
9	55	1	661	4	1.50
10	55	1	561	5	1.50
11	55	1	571	2	0.80
12	55	1	631	4	0.75
13	55	1	641	3	1.50
14	55	1	651	4	1.00
15	55	1	661	4	1.50
16	56	1	531	4	0.50
17	56	1	561	3	1.50
18	56	1	571	1	0.80
19	56	1	531	4	0.50
20	56	1	561	3	1.50
21	56	1	571	1	0.80
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: ssh_groceries_user
--

COPY public.orders (order_id, supermarket_id, total_price, order_made) FROM stdin;
1	1	\N	2024-12-12
2	2	\N	2024-12-12
3	1	\N	2024-12-12
4	1	\N	2024-12-12
5	2	\N	2024-12-12
6	1	\N	2024-12-12
7	2	\N	2024-12-12
8	1	\N	2024-12-12
9	1	\N	2024-12-12
10	1	\N	2024-12-12
11	1	\N	2024-12-12
12	1	\N	2024-12-12
13	1	\N	2024-12-12
14	1	\N	2024-12-12
15	1	\N	2024-12-12
16	1	\N	2024-12-12
17	1	\N	2024-12-12
18	2	\N	2024-12-12
19	1	\N	2024-12-12
20	1	\N	2024-12-12
21	1	\N	2024-12-12
22	1	\N	2024-12-12
23	1	\N	2024-12-12
24	1	\N	2024-12-12
25	1	\N	2024-12-12
26	1	\N	2024-12-12
27	1	\N	2024-12-12
28	1	\N	2024-12-12
29	1	\N	2024-12-12
30	2	\N	2024-12-12
31	1	\N	2024-12-12
32	1	\N	2024-12-12
33	2	\N	2024-12-12
34	1	\N	2024-12-12
35	1	\N	2024-12-12
36	1	\N	2024-12-12
37	1	\N	2024-12-12
38	1	\N	2024-12-12
39	1	\N	2024-12-12
40	1	\N	2024-12-12
41	1	\N	2024-12-12
42	1	\N	2024-12-12
43	1	\N	2024-12-12
44	1	\N	2024-12-12
45	2	\N	2024-12-12
46	2	\N	2024-12-12
47	1	\N	2024-12-12
48	1	\N	2024-12-12
49	2	\N	2024-12-12
50	1	\N	2024-12-12
51	1	\N	2024-12-12
52	1	\N	2024-12-12
53	2	\N	2024-12-12
54	2	\N	2024-12-12
55	1	\N	2024-12-12
56	1	\N	2024-12-12
\.


--
-- Data for Name: supermarkets; Type: TABLE DATA; Schema: public; Owner: ssh_groceries_user
--

COPY public.supermarkets (supermarket_id, supermarket_name) FROM stdin;
1	Aldi
2	Sainsburys
3	Co-op
4	Asda
5	Morrisions
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: ssh_groceries_user
--

COPY public.users (user_id, user_name, user_email, user_password) FROM stdin;
1	Lydia Barucka	lydiabarucka5@gmail.com	pass12345!
3	Elliot Stokes	elliotstokes123@gmail.com	elliotspassword12345
4	Ryan Burgess	rburgess7498@yahoo.com	tomato1244
5	Toby Perry	tobyp135@outlook.com	spinach9999
6	Jasper Barnett	jaspb125@gmail.com	passwordpassword1328951
7	Chris Greenwood	chrisgreenw12412@yahoo.com	greenwood92847
\.


--
-- Data for Name: users_in_order; Type: TABLE DATA; Schema: public; Owner: ssh_groceries_user
--

COPY public.users_in_order (user_in_order_id, order_id, user_id) FROM stdin;
\.


--
-- Name: groceries_grocery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ssh_groceries_user
--

SELECT pg_catalog.setval('public.groceries_grocery_id_seq', 1000, true);


--
-- Name: items_in_order_item_in_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ssh_groceries_user
--

SELECT pg_catalog.setval('public.items_in_order_item_in_order_id_seq', 21, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ssh_groceries_user
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 56, true);


--
-- Name: supermarkets_supermarket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ssh_groceries_user
--

SELECT pg_catalog.setval('public.supermarkets_supermarket_id_seq', 5, true);


--
-- Name: users_in_order_user_in_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ssh_groceries_user
--

SELECT pg_catalog.setval('public.users_in_order_user_in_order_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ssh_groceries_user
--

SELECT pg_catalog.setval('public.users_user_id_seq', 7, true);


--
-- Name: groceries groceries_pkey; Type: CONSTRAINT; Schema: public; Owner: ssh_groceries_user
--

ALTER TABLE ONLY public.groceries
    ADD CONSTRAINT groceries_pkey PRIMARY KEY (grocery_id);


--
-- Name: items_in_order items_in_order_pkey; Type: CONSTRAINT; Schema: public; Owner: ssh_groceries_user
--

ALTER TABLE ONLY public.items_in_order
    ADD CONSTRAINT items_in_order_pkey PRIMARY KEY (item_in_order_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: ssh_groceries_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: supermarkets supermarkets_pkey; Type: CONSTRAINT; Schema: public; Owner: ssh_groceries_user
--

ALTER TABLE ONLY public.supermarkets
    ADD CONSTRAINT supermarkets_pkey PRIMARY KEY (supermarket_id);


--
-- Name: users_in_order users_in_order_pkey; Type: CONSTRAINT; Schema: public; Owner: ssh_groceries_user
--

ALTER TABLE ONLY public.users_in_order
    ADD CONSTRAINT users_in_order_pkey PRIMARY KEY (user_in_order_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: ssh_groceries_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: items_in_order items_in_order_grocery_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ssh_groceries_user
--

ALTER TABLE ONLY public.items_in_order
    ADD CONSTRAINT items_in_order_grocery_id_fkey FOREIGN KEY (grocery_id) REFERENCES public.groceries(grocery_id);


--
-- Name: items_in_order items_in_order_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ssh_groceries_user
--

ALTER TABLE ONLY public.items_in_order
    ADD CONSTRAINT items_in_order_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- Name: items_in_order items_in_order_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ssh_groceries_user
--

ALTER TABLE ONLY public.items_in_order
    ADD CONSTRAINT items_in_order_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: users_in_order users_in_order_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ssh_groceries_user
--

ALTER TABLE ONLY public.users_in_order
    ADD CONSTRAINT users_in_order_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- Name: users_in_order users_in_order_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ssh_groceries_user
--

ALTER TABLE ONLY public.users_in_order
    ADD CONSTRAINT users_in_order_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

