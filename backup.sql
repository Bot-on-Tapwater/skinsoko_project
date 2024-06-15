--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.11 (Ubuntu 14.11-0ubuntu0.22.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO botontapwater;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO botontapwater;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO botontapwater;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO botontapwater;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO botontapwater;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO botontapwater;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO botontapwater;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO botontapwater;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO botontapwater;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO botontapwater;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO botontapwater;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO botontapwater;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO botontapwater;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO botontapwater;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO botontapwater;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO botontapwater;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO botontapwater;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO botontapwater;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO botontapwater;

--
-- Name: skinsoko_address; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.skinsoko_address (
    address_id integer NOT NULL,
    street_address character varying(255),
    town character varying(255),
    county character varying(255),
    phone_number character varying(255),
    additional_details text,
    user_id uuid NOT NULL
);


ALTER TABLE public.skinsoko_address OWNER TO botontapwater;

--
-- Name: skinsoko_address_address_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.skinsoko_address_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skinsoko_address_address_id_seq OWNER TO botontapwater;

--
-- Name: skinsoko_address_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.skinsoko_address_address_id_seq OWNED BY public.skinsoko_address.address_id;


--
-- Name: skinsoko_brand; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.skinsoko_brand (
    brand_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.skinsoko_brand OWNER TO botontapwater;

--
-- Name: skinsoko_brand_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.skinsoko_brand_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skinsoko_brand_brand_id_seq OWNER TO botontapwater;

--
-- Name: skinsoko_brand_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.skinsoko_brand_brand_id_seq OWNED BY public.skinsoko_brand.brand_id;


--
-- Name: skinsoko_cartitem; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.skinsoko_cartitem (
    item_id integer NOT NULL,
    quantity integer NOT NULL,
    product_id integer NOT NULL,
    cart_id integer NOT NULL,
    CONSTRAINT skinsoko_cartitem_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.skinsoko_cartitem OWNER TO botontapwater;

--
-- Name: skinsoko_cartitem_item_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.skinsoko_cartitem_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skinsoko_cartitem_item_id_seq OWNER TO botontapwater;

--
-- Name: skinsoko_cartitem_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.skinsoko_cartitem_item_id_seq OWNED BY public.skinsoko_cartitem.item_id;


--
-- Name: skinsoko_maincategory; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.skinsoko_maincategory (
    main_category_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.skinsoko_maincategory OWNER TO botontapwater;

--
-- Name: skinsoko_maincategory_main_category_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.skinsoko_maincategory_main_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skinsoko_maincategory_main_category_id_seq OWNER TO botontapwater;

--
-- Name: skinsoko_maincategory_main_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.skinsoko_maincategory_main_category_id_seq OWNED BY public.skinsoko_maincategory.main_category_id;


--
-- Name: skinsoko_order; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.skinsoko_order (
    order_id integer NOT NULL,
    total_amount integer NOT NULL,
    order_status character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id uuid NOT NULL,
    CONSTRAINT skinsoko_order_total_amount_check CHECK ((total_amount >= 0))
);


ALTER TABLE public.skinsoko_order OWNER TO botontapwater;

--
-- Name: skinsoko_order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.skinsoko_order_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skinsoko_order_order_id_seq OWNER TO botontapwater;

--
-- Name: skinsoko_order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.skinsoko_order_order_id_seq OWNED BY public.skinsoko_order.order_id;


--
-- Name: skinsoko_orderitem; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.skinsoko_orderitem (
    item_id integer NOT NULL,
    quantity integer NOT NULL,
    unit_price integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    CONSTRAINT skinsoko_orderitem_quantity_check CHECK ((quantity >= 0)),
    CONSTRAINT skinsoko_orderitem_unit_price_check CHECK ((unit_price >= 0))
);


ALTER TABLE public.skinsoko_orderitem OWNER TO botontapwater;

--
-- Name: skinsoko_orderitem_item_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.skinsoko_orderitem_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skinsoko_orderitem_item_id_seq OWNER TO botontapwater;

--
-- Name: skinsoko_orderitem_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.skinsoko_orderitem_item_id_seq OWNED BY public.skinsoko_orderitem.item_id;


--
-- Name: skinsoko_product; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.skinsoko_product (
    product_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    price integer NOT NULL,
    discount integer NOT NULL,
    quantity_in_stock integer NOT NULL,
    best_seller boolean NOT NULL,
    image text NOT NULL,
    brand_id integer NOT NULL,
    ingredients text NOT NULL,
    CONSTRAINT skinsoko_product_discount_check CHECK ((discount >= 0)),
    CONSTRAINT skinsoko_product_price_check CHECK ((price >= 0)),
    CONSTRAINT skinsoko_product_quantity_in_stock_check CHECK ((quantity_in_stock >= 0))
);


ALTER TABLE public.skinsoko_product OWNER TO botontapwater;

--
-- Name: skinsoko_product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.skinsoko_product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skinsoko_product_product_id_seq OWNER TO botontapwater;

--
-- Name: skinsoko_product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.skinsoko_product_product_id_seq OWNED BY public.skinsoko_product.product_id;


--
-- Name: skinsoko_product_subcategories; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.skinsoko_product_subcategories (
    id bigint NOT NULL,
    product_id integer NOT NULL,
    subcategory_id integer NOT NULL
);


ALTER TABLE public.skinsoko_product_subcategories OWNER TO botontapwater;

--
-- Name: skinsoko_product_subcategories_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.skinsoko_product_subcategories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skinsoko_product_subcategories_id_seq OWNER TO botontapwater;

--
-- Name: skinsoko_product_subcategories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.skinsoko_product_subcategories_id_seq OWNED BY public.skinsoko_product_subcategories.id;


--
-- Name: skinsoko_review; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.skinsoko_review (
    review_id integer NOT NULL,
    rating integer NOT NULL,
    comment text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    product_id integer NOT NULL,
    user_id uuid NOT NULL,
    CONSTRAINT skinsoko_review_rating_check CHECK ((rating >= 0))
);


ALTER TABLE public.skinsoko_review OWNER TO botontapwater;

--
-- Name: skinsoko_review_review_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.skinsoko_review_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skinsoko_review_review_id_seq OWNER TO botontapwater;

--
-- Name: skinsoko_review_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.skinsoko_review_review_id_seq OWNED BY public.skinsoko_review.review_id;


--
-- Name: skinsoko_shoppingcart; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.skinsoko_shoppingcart (
    cart_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.skinsoko_shoppingcart OWNER TO botontapwater;

--
-- Name: skinsoko_shoppingcart_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.skinsoko_shoppingcart_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skinsoko_shoppingcart_cart_id_seq OWNER TO botontapwater;

--
-- Name: skinsoko_shoppingcart_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.skinsoko_shoppingcart_cart_id_seq OWNED BY public.skinsoko_shoppingcart.cart_id;


--
-- Name: skinsoko_subcategory; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.skinsoko_subcategory (
    sub_category_id integer NOT NULL,
    name character varying(255) NOT NULL,
    main_category_id integer NOT NULL
);


ALTER TABLE public.skinsoko_subcategory OWNER TO botontapwater;

--
-- Name: skinsoko_subcategory_sub_category_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.skinsoko_subcategory_sub_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skinsoko_subcategory_sub_category_id_seq OWNER TO botontapwater;

--
-- Name: skinsoko_subcategory_sub_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.skinsoko_subcategory_sub_category_id_seq OWNED BY public.skinsoko_subcategory.sub_category_id;


--
-- Name: skinsoko_towns; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.skinsoko_towns (
    town_id integer NOT NULL,
    name character varying(255) NOT NULL,
    delivery_fee integer NOT NULL,
    CONSTRAINT skinsoko_towns_delivery_fee_check CHECK ((delivery_fee >= 0))
);


ALTER TABLE public.skinsoko_towns OWNER TO botontapwater;

--
-- Name: skinsoko_towns_town_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.skinsoko_towns_town_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skinsoko_towns_town_id_seq OWNER TO botontapwater;

--
-- Name: skinsoko_towns_town_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.skinsoko_towns_town_id_seq OWNED BY public.skinsoko_towns.town_id;


--
-- Name: skinsoko_wishlist; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.skinsoko_wishlist (
    wishlist_id integer NOT NULL,
    added_at timestamp with time zone NOT NULL,
    product_id integer NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.skinsoko_wishlist OWNER TO botontapwater;

--
-- Name: skinsoko_wishlist_wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.skinsoko_wishlist_wishlist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skinsoko_wishlist_wishlist_id_seq OWNER TO botontapwater;

--
-- Name: skinsoko_wishlist_wishlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.skinsoko_wishlist_wishlist_id_seq OWNED BY public.skinsoko_wishlist.wishlist_id;


--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.social_auth_association (
    id bigint NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO botontapwater;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.social_auth_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO botontapwater;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.social_auth_code (
    id bigint NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO botontapwater;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.social_auth_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO botontapwater;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.social_auth_nonce (
    id bigint NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO botontapwater;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO botontapwater;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.social_auth_partial (
    id bigint NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    data jsonb NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO botontapwater;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO botontapwater;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.social_auth_usersocialauth (
    id bigint NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL,
    extra_data jsonb NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO botontapwater;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: botontapwater
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO botontapwater;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: botontapwater
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: skinsoko_address address_id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_address ALTER COLUMN address_id SET DEFAULT nextval('public.skinsoko_address_address_id_seq'::regclass);


--
-- Name: skinsoko_brand brand_id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_brand ALTER COLUMN brand_id SET DEFAULT nextval('public.skinsoko_brand_brand_id_seq'::regclass);


--
-- Name: skinsoko_cartitem item_id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_cartitem ALTER COLUMN item_id SET DEFAULT nextval('public.skinsoko_cartitem_item_id_seq'::regclass);


--
-- Name: skinsoko_maincategory main_category_id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_maincategory ALTER COLUMN main_category_id SET DEFAULT nextval('public.skinsoko_maincategory_main_category_id_seq'::regclass);


--
-- Name: skinsoko_order order_id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_order ALTER COLUMN order_id SET DEFAULT nextval('public.skinsoko_order_order_id_seq'::regclass);


--
-- Name: skinsoko_orderitem item_id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_orderitem ALTER COLUMN item_id SET DEFAULT nextval('public.skinsoko_orderitem_item_id_seq'::regclass);


--
-- Name: skinsoko_product product_id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_product ALTER COLUMN product_id SET DEFAULT nextval('public.skinsoko_product_product_id_seq'::regclass);


--
-- Name: skinsoko_product_subcategories id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_product_subcategories ALTER COLUMN id SET DEFAULT nextval('public.skinsoko_product_subcategories_id_seq'::regclass);


--
-- Name: skinsoko_review review_id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_review ALTER COLUMN review_id SET DEFAULT nextval('public.skinsoko_review_review_id_seq'::regclass);


--
-- Name: skinsoko_shoppingcart cart_id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_shoppingcart ALTER COLUMN cart_id SET DEFAULT nextval('public.skinsoko_shoppingcart_cart_id_seq'::regclass);


--
-- Name: skinsoko_subcategory sub_category_id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_subcategory ALTER COLUMN sub_category_id SET DEFAULT nextval('public.skinsoko_subcategory_sub_category_id_seq'::regclass);


--
-- Name: skinsoko_towns town_id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_towns ALTER COLUMN town_id SET DEFAULT nextval('public.skinsoko_towns_town_id_seq'::regclass);


--
-- Name: skinsoko_wishlist wishlist_id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_wishlist ALTER COLUMN wishlist_id SET DEFAULT nextval('public.skinsoko_wishlist_wishlist_id_seq'::regclass);


--
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add brand	1	add_brand
2	Can change brand	1	change_brand
3	Can delete brand	1	delete_brand
4	Can view brand	1	view_brand
5	Can add main category	2	add_maincategory
6	Can change main category	2	change_maincategory
7	Can delete main category	2	delete_maincategory
8	Can view main category	2	view_maincategory
9	Can add order	3	add_order
10	Can change order	3	change_order
11	Can delete order	3	delete_order
12	Can view order	3	view_order
13	Can add shopping cart	4	add_shoppingcart
14	Can change shopping cart	4	change_shoppingcart
15	Can delete shopping cart	4	delete_shoppingcart
16	Can view shopping cart	4	view_shoppingcart
17	Can add towns	5	add_towns
18	Can change towns	5	change_towns
19	Can delete towns	5	delete_towns
20	Can view towns	5	view_towns
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add product	7	add_product
26	Can change product	7	change_product
27	Can delete product	7	delete_product
28	Can view product	7	view_product
29	Can add order item	8	add_orderitem
30	Can change order item	8	change_orderitem
31	Can delete order item	8	delete_orderitem
32	Can view order item	8	view_orderitem
33	Can add cart item	9	add_cartitem
34	Can change cart item	9	change_cartitem
35	Can delete cart item	9	delete_cartitem
36	Can view cart item	9	view_cartitem
37	Can add sub category	10	add_subcategory
38	Can change sub category	10	change_subcategory
39	Can delete sub category	10	delete_subcategory
40	Can view sub category	10	view_subcategory
41	Can add review	11	add_review
42	Can change review	11	change_review
43	Can delete review	11	delete_review
44	Can view review	11	view_review
45	Can add address	12	add_address
46	Can change address	12	change_address
47	Can delete address	12	delete_address
48	Can view address	12	view_address
49	Can add category	13	add_category
50	Can change category	13	change_category
51	Can delete category	13	delete_category
52	Can view category	13	view_category
53	Can add product	14	add_product
54	Can change product	14	change_product
55	Can delete product	14	delete_product
56	Can view product	14	view_product
57	Can add shopping cart	15	add_shoppingcart
58	Can change shopping cart	15	change_shoppingcart
59	Can delete shopping cart	15	delete_shoppingcart
60	Can view shopping cart	15	view_shoppingcart
61	Can add cart item	16	add_cartitem
62	Can change cart item	16	change_cartitem
63	Can delete cart item	16	delete_cartitem
64	Can view cart item	16	view_cartitem
65	Can add order	17	add_order
66	Can change order	17	change_order
67	Can delete order	17	delete_order
68	Can view order	17	view_order
69	Can add order item	18	add_orderitem
70	Can change order item	18	change_orderitem
71	Can delete order item	18	delete_orderitem
72	Can view order item	18	view_orderitem
73	Can add review	19	add_review
74	Can change review	19	change_review
75	Can delete review	19	delete_review
76	Can view review	19	view_review
77	Can add address	20	add_address
78	Can change address	20	change_address
79	Can delete address	20	delete_address
80	Can view address	20	view_address
81	Can add payment	21	add_payment
82	Can change payment	21	change_payment
83	Can delete payment	21	delete_payment
84	Can view payment	21	view_payment
85	Can add log entry	22	add_logentry
86	Can change log entry	22	change_logentry
87	Can delete log entry	22	delete_logentry
88	Can view log entry	22	view_logentry
89	Can add permission	23	add_permission
90	Can change permission	23	change_permission
91	Can delete permission	23	delete_permission
92	Can view permission	23	view_permission
93	Can add group	24	add_group
94	Can change group	24	change_group
95	Can delete group	24	delete_group
96	Can view group	24	view_group
97	Can add user	25	add_user
98	Can change user	25	change_user
99	Can delete user	25	delete_user
100	Can view user	25	view_user
101	Can add content type	26	add_contenttype
102	Can change content type	26	change_contenttype
103	Can delete content type	26	delete_contenttype
104	Can view content type	26	view_contenttype
105	Can add session	27	add_session
106	Can change session	27	change_session
107	Can delete session	27	delete_session
108	Can view session	27	view_session
109	Can add wishlist	28	add_wishlist
110	Can change wishlist	28	change_wishlist
111	Can delete wishlist	28	delete_wishlist
112	Can view wishlist	28	view_wishlist
113	Can add association	29	add_association
114	Can change association	29	change_association
115	Can delete association	29	delete_association
116	Can view association	29	view_association
117	Can add code	30	add_code
118	Can change code	30	change_code
119	Can delete code	30	delete_code
120	Can view code	30	view_code
121	Can add nonce	31	add_nonce
122	Can change nonce	31	change_nonce
123	Can delete nonce	31	delete_nonce
124	Can view nonce	31	view_nonce
125	Can add user social auth	32	add_usersocialauth
126	Can change user social auth	32	change_usersocialauth
127	Can delete user social auth	32	delete_usersocialauth
128	Can view user social auth	32	view_usersocialauth
129	Can add partial	33	add_partial
130	Can change partial	33	change_partial
131	Can delete partial	33	delete_partial
132	Can view partial	33	view_partial
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$pOnlvZfzMzOew3IObDwfGn$mHTDRxbb5GUeD89aoQu3ufof6+p3bwvPK3jz3EokkRI=	2024-06-10 17:56:14.090091+00	t	admin			admin@outlook.com	t	t	2024-06-09 13:27:57.879516+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2024-06-09 16:27:45.468793+00	9a132dde-eb32-4b45-b46c-790e03941531	testuser	1	[{"added": {}}]	6	1
2	2024-06-09 16:55:53.657761+00	1	AVEENO	1	[{"added": {}}]	1	1
3	2024-06-09 16:56:07.687717+00	2	BENTON	1	[{"added": {}}]	1	1
4	2024-06-09 16:56:14.571918+00	3	CERAVE	1	[{"added": {}}]	1	1
5	2024-06-09 16:56:21.228643+00	4	COSRX	1	[{"added": {}}]	1	1
6	2024-06-09 16:56:30.160659+00	5	ISNTREE	1	[{"added": {}}]	1	1
7	2024-06-09 16:56:41.453521+00	6	IT'S SKIN	1	[{"added": {}}]	1	1
8	2024-06-09 16:56:54.585742+00	7	NEUTROGENA	1	[{"added": {}}]	1	1
9	2024-06-09 16:57:04.585287+00	8	PYUNKANG YUL	1	[{"added": {}}]	1	1
10	2024-06-09 16:57:16.270669+00	9	SOME BY MI	1	[{"added": {}}]	1	1
11	2024-06-09 16:58:23.280553+00	1	CONCERNS	1	[{"added": {}}]	2	1
12	2024-06-09 16:58:29.725248+00	2	SKIN TYPE	1	[{"added": {}}]	2	1
13	2024-06-09 16:58:38.602953+00	3	SKINCARE	1	[{"added": {}}]	2	1
14	2024-06-09 16:58:48.075036+00	4	HAIR CARE	1	[{"added": {}}]	2	1
15	2024-06-09 17:01:07.168191+00	1	Breakouts	1	[{"added": {}}]	10	1
16	2024-06-09 17:01:18.318169+00	2	Blackheads	1	[{"added": {}}]	10	1
17	2024-06-09 17:01:28.628004+00	3	Dark Eye Circles	1	[{"added": {}}]	10	1
18	2024-06-09 17:01:38.94582+00	4	Dark Spots	1	[{"added": {}}]	10	1
19	2024-06-09 17:01:50.277469+00	5	Large Pores	1	[{"added": {}}]	10	1
20	2024-06-09 17:02:03.346861+00	6	Lifting & Firming	1	[{"added": {}}]	10	1
21	2024-06-09 17:02:13.836754+00	7	Stretch Marks	1	[{"added": {}}]	10	1
22	2024-06-09 17:02:22.038342+00	8	Sunburn	1	[{"added": {}}]	10	1
23	2024-06-09 17:02:40.295794+00	9	Uneven Skin Tone	1	[{"added": {}}]	10	1
24	2024-06-09 17:03:01.15432+00	10	Wrinkles & Fine Lines	1	[{"added": {}}]	10	1
25	2024-06-09 17:03:32.931458+00	11	Acne-Prone Skin	1	[{"added": {}}]	10	1
26	2024-06-09 17:03:46.29315+00	12	Dry Skin	1	[{"added": {}}]	10	1
27	2024-06-09 17:03:55.602462+00	13	Dull Skin	1	[{"added": {}}]	10	1
28	2024-06-09 17:04:04.258207+00	14	Mature Skin	1	[{"added": {}}]	10	1
29	2024-06-09 17:04:18.046494+00	15	Oily Skin	1	[{"added": {}}]	10	1
30	2024-06-09 17:04:27.564654+00	16	Rough Skin	1	[{"added": {}}]	10	1
31	2024-06-09 17:04:38.918377+00	17	Sensitive Skin	1	[{"added": {}}]	10	1
32	2024-06-09 17:05:41.665571+00	11	Acne-Prone Skin	2	[]	10	1
33	2024-06-09 17:06:05.612383+00	18	Ampoules & Essence	1	[{"added": {}}]	10	1
34	2024-06-09 17:06:14.659736+00	19	Cleansers	1	[{"added": {}}]	10	1
35	2024-06-09 17:06:25.400333+00	20	Eye Care	1	[{"added": {}}]	10	1
36	2024-06-09 17:06:35.92288+00	21	Lip Care	1	[{"added": {}}]	10	1
37	2024-06-09 17:06:49.641255+00	22	Beauty Masks	1	[{"added": {}}]	10	1
38	2024-06-09 17:07:03.897466+00	23	Moisturizers	1	[{"added": {}}]	10	1
39	2024-06-09 17:07:14.15263+00	24	Scrubs & Peels	1	[{"added": {}}]	10	1
40	2024-06-09 17:07:22.24567+00	25	Serums	1	[{"added": {}}]	10	1
41	2024-06-09 17:07:35.165561+00	26	Spot Treatments	1	[{"added": {}}]	10	1
42	2024-06-09 17:07:46.80941+00	27	Sunscreens	1	[{"added": {}}]	10	1
43	2024-06-09 17:07:56.565199+00	28	Toners & Mists	1	[{"added": {}}]	10	1
44	2024-06-09 17:10:31.025334+00	1	Towns object (1)	1	[{"added": {}}]	5	1
45	2024-06-09 17:10:38.529758+00	2	Towns object (2)	1	[{"added": {}}]	5	1
46	2024-06-09 17:10:47.566313+00	3	Towns object (3)	1	[{"added": {}}]	5	1
47	2024-06-09 17:10:54.708377+00	4	Towns object (4)	1	[{"added": {}}]	5	1
48	2024-06-09 17:11:04.496193+00	5	Towns object (5)	1	[{"added": {}}]	5	1
49	2024-06-09 17:11:12.027885+00	6	Towns object (6)	1	[{"added": {}}]	5	1
50	2024-06-09 17:11:21.547952+00	7	Towns object (7)	1	[{"added": {}}]	5	1
51	2024-06-09 17:11:30.603319+00	8	Towns object (8)	1	[{"added": {}}]	5	1
52	2024-06-09 17:11:39.226929+00	9	Towns object (9)	1	[{"added": {}}]	5	1
53	2024-06-09 17:11:49.312266+00	10	Towns object (10)	1	[{"added": {}}]	5	1
54	2024-06-09 17:11:57.69972+00	11	Towns object (11)	1	[{"added": {}}]	5	1
55	2024-06-09 17:12:07.852798+00	12	Towns object (12)	1	[{"added": {}}]	5	1
56	2024-06-09 17:12:14.967402+00	13	Towns object (13)	1	[{"added": {}}]	5	1
57	2024-06-09 17:12:21.861677+00	14	Towns object (14)	1	[{"added": {}}]	5	1
58	2024-06-09 17:12:28.761573+00	15	Towns object (15)	1	[{"added": {}}]	5	1
59	2024-06-09 17:12:37.896628+00	16	Towns object (16)	1	[{"added": {}}]	5	1
60	2024-06-09 17:12:45.697746+00	17	Towns object (17)	1	[{"added": {}}]	5	1
61	2024-06-09 17:12:54.300808+00	18	Towns object (18)	1	[{"added": {}}]	5	1
62	2024-06-09 17:13:02.782128+00	19	Towns object (19)	1	[{"added": {}}]	5	1
63	2024-06-09 17:13:11.743871+00	20	Towns object (20)	1	[{"added": {}}]	5	1
64	2024-06-09 17:13:20.700613+00	21	Towns object (21)	1	[{"added": {}}]	5	1
65	2024-06-09 17:13:28.982442+00	22	Towns object (22)	1	[{"added": {}}]	5	1
66	2024-06-09 17:13:37.904596+00	23	Towns object (23)	1	[{"added": {}}]	5	1
67	2024-06-09 17:13:46.661011+00	24	Towns object (24)	1	[{"added": {}}]	5	1
68	2024-06-09 17:13:55.325433+00	25	Towns object (25)	1	[{"added": {}}]	5	1
69	2024-06-09 17:14:06.475291+00	26	Towns object (26)	1	[{"added": {}}]	5	1
70	2024-06-09 17:14:15.08082+00	27	Towns object (27)	1	[{"added": {}}]	5	1
71	2024-06-09 17:14:23.175845+00	28	Towns object (28)	1	[{"added": {}}]	5	1
72	2024-06-09 17:14:32.342981+00	29	Towns object (29)	1	[{"added": {}}]	5	1
73	2024-06-09 17:14:41.421916+00	30	Towns object (30)	1	[{"added": {}}]	5	1
74	2024-06-09 17:14:49.858144+00	31	Towns object (31)	1	[{"added": {}}]	5	1
75	2024-06-09 17:14:57.697823+00	32	Towns object (32)	1	[{"added": {}}]	5	1
76	2024-06-09 17:50:22.641779+00	1	Licorice pH Balancing Cleansing Toner - 18	1	[{"added": {}}]	7	1
77	2024-06-10 18:43:41.701544+00	1	Licorice pH Balancing Cleansing Toner - 4500	2	[{"changed": {"fields": ["Price", "Subcategories"]}}]	7	1
78	2024-06-10 19:07:07.233149+00	1	Licorice pH Balancing Cleansing Toner - 4500	2	[]	7	1
79	2024-06-10 19:12:42.182627+00	2	Hyaluronic Acid Daily Sun Gel SPF 30 - 1500	1	[{"added": {}}]	7	1
80	2024-06-10 19:17:30.94163+00	3	Cerave PM Facial Moisturizing Lotion 52ml - 1850	1	[{"added": {}}]	7	1
81	2024-06-10 19:21:07.128507+00	4	La Roche Posay Anthelios Shaka Fluid Face SPF 50+ 50ml - 3100	1	[{"added": {}}]	7	1
82	2024-06-10 19:24:49.170395+00	5	https://www.goodlife.co.ke/wp-content/smush-webp/2022/02/1133356-CERAVE-FOAM-CLEANSER-236ML.jpg.webp - 2200	1	[{"added": {}}]	7	1
83	2024-06-10 19:26:15.869548+00	6	La Roche-Posay Pure Vitamin C10 Serum 30 ml - 5400	1	[{"added": {}}]	7	1
84	2024-06-10 19:29:30.324634+00	7	Cinnabar Green Jojoba, Calendula & Shea Lip Balm – 15ml - 600	1	[{"added": {}}]	7	1
85	2024-06-10 19:35:22.64118+00	8	Huxley Cream: Glow Awakening 50ml - 3300	1	[{"added": {}}]	7	1
86	2024-06-10 19:36:37.185142+00	5	Cerave Foam Cleanser 236ml - 2200	2	[{"changed": {"fields": ["Name"]}}]	7	1
87	2024-06-11 10:17:47.826661+00	10	Tocobo	1	[{"added": {}}]	1	1
88	2024-06-11 10:17:56.548573+00	1	Tocobo Multi Ceramide Cream 50ml - 2500	2	[{"changed": {"fields": ["Name", "Description", "Ingredients", "Price", "Quantity in stock", "Subcategories", "Brand", "Image"]}}]	7	1
89	2024-06-13 06:44:17.426598+00	9	Cerave AHA BHA Acne Control Gel 40ml - 3100	1	[{"added": {}}]	7	1
90	2024-06-13 06:45:34.369414+00	10	Cerave Eye Repair Cream For dark circles 14.2g - 1890	1	[{"added": {}}]	7	1
91	2024-06-13 06:46:30.273936+00	11	cetaphil	1	[{"added": {}}]	1	1
92	2024-06-13 06:47:23.094715+00	11	Cetaphil daily facial cleanswer 237ml - 2100	1	[{"added": {}}]	7	1
93	2024-06-13 06:47:59.706588+00	12	nineless	1	[{"added": {}}]	1	1
94	2024-06-13 06:49:13.889026+00	12	Nineless A-Control Heartleaf &amp; BHA Cleanser 120ml - 1650	1	[{"added": {}}]	7	1
95	2024-06-13 06:51:09.89834+00	13	Cetaphil gentle foaming cleanser 236ml - 2400	1	[{"added": {}}]	7	1
96	2024-06-13 06:53:31.279571+00	14	isntree green teal fresh cleanswer 120ml - 2100	1	[{"added": {}}]	7	1
97	2024-06-13 06:57:21.638882+00	15	Some By Mi Tea Tree Calming Glow Luminous Sheet Mask 25g - 250	1	[{"added": {}}]	7	1
98	2024-06-13 07:02:57.972136+00	16	Benton Snail Bee High Content Essence 100ml - 1900	1	[{"added": {}}]	7	1
99	2024-06-13 08:13:40.001287+00	17	Yuja Niacin Anti Blemish Starter Kit - 3000	1	[{"added": {}}]	7	1
100	2024-06-13 08:15:32.591032+00	18	Super Matcha Pore Care Starter Kit - 2700	1	[{"added": {}}]	7	1
101	2024-06-13 08:21:15.57853+00	1	SKIN CONCERNS	2	[{"changed": {"fields": ["Name"]}}]	2	1
102	2024-06-13 08:54:34.309833+00	16	Benton Snail Bee High Content Essence 100ml - 1900	2	[{"changed": {"fields": ["Discount"]}}]	7	1
103	2024-06-13 11:21:49.298613+00	13	NIVEA	1	[{"added": {}}]	1	1
104	2024-06-13 11:22:12.378551+00	13	NIVEA	3		1	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	skinsoko	brand
2	skinsoko	maincategory
3	skinsoko	order
4	skinsoko	shoppingcart
5	skinsoko	towns
6	skinsoko	user
7	skinsoko	product
8	skinsoko	orderitem
9	skinsoko	cartitem
10	skinsoko	subcategory
11	skinsoko	review
12	skinsoko	address
13	eridosolutions	category
14	eridosolutions	product
15	eridosolutions	shoppingcart
16	eridosolutions	cartitem
17	eridosolutions	order
18	eridosolutions	orderitem
19	eridosolutions	review
20	eridosolutions	address
21	eridosolutions	payment
22	admin	logentry
23	auth	permission
24	auth	group
25	auth	user
26	contenttypes	contenttype
27	sessions	session
28	skinsoko	wishlist
29	social_django	association
30	social_django	code
31	social_django	nonce
32	social_django	usersocialauth
33	social_django	partial
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
rmviz9l1n12hcbpkcytr3ig8jtlqcx0x	.eJyrViotTi2Kz0xRslKyTDQ0NkpJSdVNTTI20jVJMjHVTTIxS9Y1tzRINTC2NDE0NTZU0oFoyEvMTQVqKUktLgHxYcKpuYmZOUjiDukgAb3k_FylWgDJqCIm:1sGLoU:bSj_8tmmyh61XBIY9Be7epkEP9b_ID_vh8lOgulYiMU	2024-06-23 16:54:38.421159+00
dfmvyaqdjhv44ec4hje7d8oppuznpp5o	.eJxVjMsOwiAQRf-FtSHQ4enSvd9AGBikaiAp7cr479qkC93ec859sRC3tYZt0BLmzM5MstPvhjE9qO0g32O7dZ56W5cZ-a7wgw5-7Zmel8P9O6hx1G_tTUTQEzgH5A35hCSkFFkTKSeUJg9WYtLGqALSTlarBLEUAUrIhIa9P8dmNxE:1sGjFe:xy-nM5sv016FsRmP91iITWz5sYtVjyele4tueNnOMfY	2024-06-24 17:56:14.09273+00
5vztb6b0cnwaabogpubv1u7rnnmcuypd	eyJmYWNlYm9va19zdGF0ZSI6IndIUTRnWXk1Z0tMdFJGQjAxcldPSVNTaFpvYzZrSWxZIn0:1sI5ZJ:k9h5kEOk345M69NAH5jfTNMutt7A10khiOAXx5rKHhI	2024-06-28 11:58:09.737027+00
8zgvrqjnoipjpduu5673o366xg3s2sh4	eyJmYWNlYm9va19zdGF0ZSI6IjdVTkxpOXpvaTNqU0tCcTRjUlhKYnZRWWRYRTVvaUJJIn0:1sI5Zo:imj1BGZ0_IRY6XP0aFN12oO6Xyo_XTQdCW993ttoR9I	2024-06-28 11:58:40.383948+00
vuxom9po4aj79xq4nvywat65kqeo54lh	eyJmYWNlYm9va19zdGF0ZSI6IkRyNUpReVlDZ1Jhd1g3M3RrVm5vNFZYcUtnbE9TOE1zIn0:1sI5jV:ojnJBy98b5bILv4Kbr02UTeQVdP7rAd-sn9L_b9vh1M	2024-06-28 12:08:41.690497+00
kxdrk1dlztmvkoe7yp0owgo0iv681h0n	.eJxVjslOwzAURf_Fa4jseEjMMhJILkVsmNpN5OHZSYe8pklYgPh3EqlCdHvvPUf3m9R2Gpt6GuBct4HcEUZu_mfO-j10SxF2tkuYeezGc-uyZZJd2iF7wgCH6rK9EjR2aGZaK-u4zHlZctAKtHdAGaNBAoiSCgmaF8x5qZSInBV5IYXnNkbKBWXeqVkarQeHuK-H0Y4wO7_ElE4fnxVsN_xxhVuh4xiqh2eje3Pqj2ZmEmI6wC0uf_I_ECO8tG_vrTEOw_F1t76nctPrvuR0JdYpkJ9fNvJbxg:1sI6yU:Rxtelr2cSnRIqzBBF_9rAtn5ytEJKgnCz647yJv1gmw	2024-06-28 13:28:14.644434+00
1y6likoegekcitot9h88d3wmbz0hu7nd	eyJmYWNlYm9va19zdGF0ZSI6IkVOM3U2bTVpMUN3amVvZDZ6U0hXbnhiQzJJUjhjbUdFIn0:1sI7He:Q0HwGl2VLZGkdy9G8qeWhBm9dWh5p7L6hlpmEcqDjco	2024-06-28 13:48:02.961301+00
\.


--
-- Data for Name: skinsoko_address; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.skinsoko_address (address_id, street_address, town, county, phone_number, additional_details, user_id) FROM stdin;
\.


--
-- Data for Name: skinsoko_brand; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.skinsoko_brand (brand_id, name) FROM stdin;
1	AVEENO
2	BENTON
3	CERAVE
4	COSRX
5	ISNTREE
6	IT'S SKIN
7	NEUTROGENA
8	PYUNKANG YUL
9	SOME BY MI
10	Tocobo
11	cetaphil
12	nineless
\.


--
-- Data for Name: skinsoko_cartitem; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.skinsoko_cartitem (item_id, quantity, product_id, cart_id) FROM stdin;
\.


--
-- Data for Name: skinsoko_maincategory; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.skinsoko_maincategory (main_category_id, name) FROM stdin;
2	SKIN TYPE
3	SKINCARE
4	HAIR CARE
1	SKIN CONCERNS
\.


--
-- Data for Name: skinsoko_order; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.skinsoko_order (order_id, total_amount, order_status, created_at, user_id) FROM stdin;
\.


--
-- Data for Name: skinsoko_orderitem; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.skinsoko_orderitem (item_id, quantity, unit_price, order_id, product_id) FROM stdin;
\.


--
-- Data for Name: skinsoko_product; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.skinsoko_product (product_id, name, description, price, discount, quantity_in_stock, best_seller, image, brand_id, ingredients) FROM stdin;
4	La Roche Posay Anthelios Shaka Fluid Face SPF 50+ 50ml	An Ultra-resistant fluid very high broad-spectrum sun protection for a healthy glow effect, non-greasy, no white marks, non eye stinging. Very water resistant, non-sticky with instant absorption. Highest UVA protection. No ashy look.	3100	0	843	f	https://www.goodlife.co.ke/wp-content/smush-webp/2022/07/La-roche-Posay-Anthelious-Ultra-Face-Uv-Mune-Spf-50-50ml.jpg.webp	7	AQUA / WATER ? ALCOHOL DENAT. ? DIISOPROPYL SEBACATE ? SILICA ? ISOPROPYL MYRISTATE ? ETHYLHEXYL SALICYLATE ? ETHYLHEXYL TRIAZONE ? BIS-ETHYLHEXYLOXYPHENOL METHOXYPHENYL TRIAZINE ? BUTYL METHOXYDIBENZOYLMETHANE ? GLYCERIN ? C12-22 ALKYL ACRYLATE/HYDROXYETHYLACRYLATE COPOLYMER ? PROPANEDIOL ? DROMETRIZOLE TRISILOXANE ? PERLITE ? TOCOPHEROL ? CAPRYLIC/CAPRIC TRIGLYCERIDE ? ACRYLATES/C10-30 ALKYL ACRYLATE CROSSPOLYMER ? CAPRYLYL GLYCOL ? HYDROXYETHYLCELLULOSE ? TEREPHTHALYLIDENE DICAMPHOR SULFONIC ACID ? TRIETHANOLAMINE ? TRISODIUM ETHYLENEDIAMINE DISUCCINATE ? PARFUM / FRAGRANCE
18	Super Matcha Pore Care Starter Kit	The ideal skin routine for pore tightening is here! Set includes Super Matcha Pore Clean Cleansing Gel, Tightening Toner, Tightening Serum and Clean Clay Mask all enriched with matcha water, natural BHA from white willow bark and glacier water to rid skin of blackheads and refine texture.\r\n\r\nSkin routine from this kit is designed to leave skin purified, clear and refreshed.\r\n\r\nThe set comes with:\r\n\r\nSuper Matcha Pore Clean Cleansing Gel 42ml\r\nSuper Matcha Pore Clean Clay Mask 42g\r\nSuper Matcha Pore Tightening Toner 30ml\r\nSuper Matcha Pore Tightening Serum 10ml\r\nBenefits:\r\n\r\nSuper Matcha line targets pore concerns and leaves skin feeling refreshing without stickiness.\r\nFeatures Matcha Water and naturally derived BHA to gently purify and tighten up pores.\r\nRemoves excess sebum, blackheads and dead skin cells for clean and clear skin.\r\nSkin Irritation Test completed.	2700	0	299	f	https://kbeautykenya.com/wp-content/uploads/2023/10/SOME-BY-MI-Super-Matcha-Pore-Care-Starter-Kit.jpg	9	We'll update soon.
2	Hyaluronic Acid Daily Sun Gel SPF 30	Meet this gentle gel-type sunscreen, enriched with 10 types of Hyaluronic Acid, meticulously formulated to deliver long-lasting hydration. Perfect for daily use, this lightweight chemical SPF, ensures no white cast while providing deep moisture with its unique blend of 10 types of hyaluronic acid, offering your skin a refreshing splash of hydration throughout the day.\r\n\r\n50 ml / 1.69 oz	1500	20	43	f	https://sokoglam.com/cdn/shop/files/Soko-Glam-PDP-Isntree-Hyaluronic-Acid-Daily-Sunscreen-01_860x.png?v=1715051422	5	Water, Homosalate, Butyloctyl Salicylate, Ethylhexyl Salicylate, Butylene Glycol, Diethylhexyl 2,6-Naphthalate, Butyl Methoxydibenzoylmethane, Niacinamide, C20-22 Alkyl Phosphate, C20-22 Alcohols, 1,2-Hexanediol, Acrylates Copolymer, Pentylene Glycol, Polymethylsilsesquioxane, Centella Asiatica Extract, Portulaca Oleracea Extract, Houttuynia Cordata Extract, Nymphaea Alba Flower Extract, Sodium Hyaluronate, Cetyl Alcohol, Poly C10-30 Alkyl Acrylate, Glyceryl Stearate, Vp/Eicosene Copolymer, Silica, Tromethamine, Polyacrylate Crosspolymer-6, Propanediol, Ethylhexylglycerin, Xanthan Gum, Adenosine, Dimethylsilanol Hyaluronate, Hydrolyzed Sodium Hyaluronate, Hydrolyzed Hyaluronic Acid, Potassium Hyaluronate, Hyaluronic Acid, Sodium Hyaluronate Crosspolymer, Hydroxypropyltrimonium Hyaluronate, Sodium Hyaluronate Dimethylsilanol, Sodium Acetylated Hyaluronate, Ectoin, Tocopherol, Beta-Glucan, Dipropylene Glycol, Sodium Palmitoyl Proline, Glycerin
3	Cerave PM Facial Moisturizing Lotion 52ml	<p>An ultra-lightweight lotion is packed with 3 essential ceramides to fortify your skin’s natural barrier. Featuring MVE Technology, it provides a steady release of moisturizing ingredients throughout the night, ensuring skin stays beautifully hydrated.</p>	1850	0	93	f	https://assets.beautyhub.co.ke/wp-content/uploads/2023/05/31130656/cerave-facial-moisturising-lotion-52ml-eu.jpg	3	Aqua/Water, Glycerin, Caprylic/Capric Triglyceride, Niacinamide, Cetearyl Alcohol, Dimethicone, Phenoxyethanol, Ceteareth-20, Behentrimonium Methosulfate, Caprylyl Glycol, Polyglyceryl-3 Diisostearate, Sodium Lauroyl Lactylate, Potassium Phosphate, Disodium EDTA, Dipotassium Phosphate, Ceramide NP, Ceramide AP, Phytosphingosine, Cholesterol, Xanthan Gum, Carbomer, Ethylhexylglycerin, Sodium Hyaluronate, Ceramide EOP.
1	Tocobo Multi Ceramide Cream 50ml	This lightweight, super moisturizing cream packs a powerful punch when it comes to dry skin. Contains 10% of triple Hyaluronic Acid and 1,000ppm of multi-ceramide complex to hydrate, improve firmness and help skin maintain moisture. Perfect for all skin types including sensitive, dry skin.	2500	0	301	t	https://assets.beautyhub.co.ke/wp-content/uploads/2022/05/02171140/tocobo_multi_ceramide_cream_50ml.jpg	10	Aqua/Water/Eau, Glycerin, Coco-Caprylate/Caprate, Polyglyceryl-3 Methylglucose Distearate, Squalane, Caprylic/Capric Triglyceride, Pentylene Glycol, Propanediol, Polyglyceryl-3 Distearate, Cyclohexasiloxane, 1,2-Hexanediol, Butylene Glycol, Chlorella Minutissima Extract, Butyrospermum Parkii (Shea) Butter, Hyaluronic Acid, Hydrolyzed Hyaluronic Acid, Sodium Hyaluronate, Cetearyl Olivate, Diphenyl Dimethicone, Diphenylsiloxy Phenyl Trimethicone, Sorbitan Olivate, Hydrogenated Coco-Glycerides, Glyceryl Stearate, Polymethylsilsesquioxane, Glucose, Hydroxyacetophenone, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Fructooligosaccharides, Fructose, Sodium Polyacrylate Starch, Tromethamine, Glyceryl Stearate Citrate, Panthenol, Hydroxyethyl Acrylate/Sodium Acryloyldimethyl Taurate Copolymer, Hydrogenated Lecithin, Sodium Phytate, Stearic Acid, Ethylhexylglycerin, Beta-Glucan, Ceramide NP, Ceramide NS, Cholesterol, Phytosphingosine, Ceramide AP, Ceramide AS, Ceramide EOP, Cetearyl Alcohol, Xanthan Gum, Flavor, Linalool, Hexyl Cinnamal, Benzyl Benzoate, Eugenol, Hydroxycitronellal.
17	Yuja Niacin Anti Blemish Starter Kit	[Yuja Toner]\r\n\r\n– Contains 90% of the Goheung Yuja extract and Brightening functional ingredients(Niacinamide)\r\n– Vitamin extract toner for making clear and clean skin tone\r\n\r\n[Yuja Serum]\r\n\r\n– Contains 82% of Goheung Yuja extract and Brightening functional ingredients(Niacinamide, glutathione, arbutin)\r\n– Blemish and freckle treatment\r\n\r\n[Yuja Gel Cream]\r\n\r\n– Contains 90% of Korean Citron extract, glacial milk and ingredient for Brightening\r\n– Vitamin from Citron helps to improve marks on skin, soothing skin instantly and to halt to grow of melasma with glacial milk\r\n\r\n[Yuja sleeping Mask]\r\n\r\n– Contains 70% of Goheung Yuja extract and Brightening functional ingredients(Niacinamide, glutathione, arbutin)\r\n– Supply vitamins and moisture intensively during the night to make your skin brighter for the next morning	3000	0	292	f	https://kbeautykenya.com/wp-content/uploads/2024/04/SOME-BY-MI-Yuja-Niacin-Anti-Blemish-Starter-Kit.webp	9	We'll update soon.
6	La Roche-Posay Pure Vitamin C10 Serum 30 ml	PURE VITAMIN C10 improves the skin tone and restores the skin glow. It reveals sensitive skin’s full radiance. It corrects skin ageing and improves skin quality. A solution for all skin types to unveil full radiance & glow. Pure Vitamin C10 is a unique combination of efficient and well tolerated ingredients: Pure vitamin C, Salicylic Acid, Hyaluronic Acid; known by dermatologist for their anti-ageing and anti-oxidant efficacy. These ingredients are combined with Neurosensine and Thermal water in order to sooth the sensitive skin at a neutral pH. Ultra-light texture also suitable for combination skin.\r\nResults:\r\nAt 8 weeks* : 79% find that skin’s irregularity are less visible.\r\nAt 4 weeks : 84% find that pores are less visibles and tighther.\r\n\r\n*Clinical evaluation, on 53 subjects after 8 weeks\r\n\r\nHow to use\r\n\r\nApply morning on face and neck after cleansing, (before mositurizing). Use in association with a SPF protection. Light, fast-absorbing texture. Velvety, non greasy finish. Optimal make-up base. Avoid eye area	5400	18	343	f	https://www.goodlife.co.ke/wp-content/smush-webp/2021/09/la-roche-posay-pure-vitamin-c10-30ml.jpg.webp	5	AQUA /WATER ? ASCORBIC AC ID ? CYCLOHEXAS I LOXANE ? GLYCE R IN ? ALCOHOL DENAT. ? POTASSIUM HYDROXI DE ? POLYMETHYLSILSESQUIOXANE ? POLYSILICONE-11 ? DIMETHICONE ? PROPYLENE GLYCOL ? PENTAERYTHRITYL TETRAETHYLHEXANOATE ? C13-14 ISOPARAFFIN ? PEG-20 METHYL GLUCOSE SESQUISTEARATE ? SODIUM HYALURONATE ? ADENOSINE ? POLOXAMER 338 ? AMMONIUM POLYACRYLOYLDIMETHYL TAURATE ? DISODIUM EDTA ? HYDROLYZED HYALURONIC ACID ? CAPRYLYL GLYCOL ? LAURETH-7 ? ACETYL DIPEPTIDE-1 CETYL ESTER ? XANTHAN GUM ?TOLUENE SULFONICACID ? POLYACRYLAMIDE ? TOCOPHEROL ? SALICYLIC ACID ? PARFUM / FRAGRANCE.
7	Cinnabar Green Jojoba, Calendula & Shea Lip Balm – 15ml	Preservative- & Chemical-free, 100% natural lip balm with the sun-protecting vitamin E and beeswax, nourishing jojoba oil, shea butter and deeply moisturizing virgin avocado oil.\r\n\r\nThe Essential Oil Blend. The lavender oil is effective against sunburn and wounds, with additional benefits of being anti-inflammatory, antitoxic; antimicrobial and tonic to the lips. The sweet orange is also tonic and wound healing and the peppermint is anti-inflammatory and astringent.\r\n\r\nNatural Vitamin E.  Deeply moisturizes the lips and maintains their elasticity, making them smooth. It is also a natural antioxidant and aids in preventing lip damage caused by solar UV radiation.\r\n\r\nAvocado and Jojoba Oils, Shea Butter and Beeswax. The virgin avocado oil is easily absorbed by the skin, ensuring high levels of moisturization to the lips. It contains organic antioxidants that protect the lips from UV damage from the sun. The jojoba oil contains natural esters that closely resemble the human sebum- therefore nourishing the lips and aiding in deep moisturization. It also contains tocopherols that assist in protection against UV-induced lip damage. The shea butter makes the lips smooth, revitalized and shiny. Our Samburu beeswax is a natural antibacterial, antifungal and anti-inflammatory. It moisturizes the skin by reducing transepidermal water loss. It contains natural hydroxyesters that are known to leave the lips smooth without, mildly exfoliating damaged cells and protecting the lips from damage from the sun. It is an excellent moisturizer for the lips, giving them a non-greasy, glossy appearance.	600	3	343	t	https://greenspoon.co.ke/wp-content/uploads/2022/08/greenspoon-cinabar-green-jojoba-calendula-shea-lip-balm-6257.jpg	8	More info coming soon.
8	Huxley Cream: Glow Awakening 50ml	A smooth, luxurious cream that spreads easily and absorbs fast to moisturize and brighten skin. Infused with Pear Seed Oil to repair and protect skin from environmental stressors, Glutathione to improve skin tone, Niacinamide to brighten skin and Bisabolol to calm skin irritation.	3300	12	434	t	https://assets.beautyhub.co.ke/wp-content/uploads/2019/11/08213400/huxley_glow_awakening_cream.jpg	9	Opuntia Ficus-Indica Stem Extract, Butylene Glycol, Ethylhexyl Salicylate, Dimethicone, Cetearyl Alcohol, Butyloctyl Salicylate, Caprylic/Capric Triglyceride, Niacinamide, Butyl Methoxydibenzoylmethane, Water, Glyceryl Stearate, Steareth-2, Steareth 21, 1,2-Hexandiol, Squalane, Caprylic/Capric/Myristic/Stearic Triglyceride, Allantoin, Opuntia Ficus-Indica Seed Oil, Aloe Barbadensis Leaf Extract, Morus Nigra Fruit Extract, Biosaccharide Gum-1, Bisabolol, Beta-Glucan, Sodium Hyaluronate, Cycloplentasiloxane, Sorbitan Stearate, Ethyl Oleate, C12-15 Alkyl Benzoate, Polysilicone-11, Polyacrylate-13, Ethyl Stearate, Palmitic Acid, Polyisobutene, Stearic Acid, Glycerin, Ethyl Linoleate, Ethyl Palmitate, Glycerin, Butyrospermum Parkii (Shea Butter) Unsa Water, Ethalinolate, Ethyl Palmitate, Ethanol, Polysorbate 20, Sorbitanisostearate, Xanthan Gum, Butyl Octanol, Propandiol, Farnesol, Disodium EDTA, Ethylhexylglycerin, Phenoxyethanol, Fragrance.
5	Cerave Foam Cleanser 236ml	Developed with dermatologists, the foaming gel formula of the CeraVe Foaming Cleanser gently cleanses the skin to remove excess makeup, dirt and oil. It contains 3 essential ceramides to help protect the skin barrier. Hyaluronic Acid helps to retain the skin’s natural moisture while Niacinamide calms the skin.\r\n\r\nESSENTIAL CERAMIDES: Contains 3 essential ceramides (1, 3, 6-II) to cleanse while protecting the skin’s natural barrier\r\nMOISTURE RETAINING INGREDIENTS: Formulated with Hyaluronic Acid to retain skin’s moisture\r\nFOAMING GEL: Ideal for normal to oily skin. Refreshing gel removes dirt, oil and makeup\r\nGENTLE ON SKIN: Fragrance-free and non-comedogenic\r\n\r\nDEVELOPED WITH DERMATOLOGISTS.	2200	5	103	t	https://www.goodlife.co.ke/wp-content/smush-webp/2022/02/1133356-CERAVE-FOAM-CLEANSER-236ML.jpg.webp	3	AQUA / WATER, COCAMIDOPROPYL HYDROXYSULTAINE, SODIUM LAUROYL SARCOSINATE, PROPANEDIOL, PEG-150 PENTAERYTHRITYL TETRASTEARATE, PEG-6 CAPRYLIC/ CAPRIC GLYCERIDES, GLYCERIN, CERAMIDE NP, CERAMIDE AP, CERAMIDE EOP, CARBOMER, NIACINAMIDE, SODIUM METHYL COCOYL TAURATE, SODIUM BENZOATE, SODIUM CHLORIDE, SODIUM LAUROYL LACTYLATE, SODIUM HYALURONATE, CHOLESTEROL, PHENOXYETHANOL, DISODIUM EDTA, CITRIC ACID, TETRASODIUM EDTA, PHYTOSPHINGOSINE, XANTHAN GUM, ETHYLHEXYLGLYCERIN (Code F.I.L. D250307/1)
9	Cerave AHA BHA Acne Control Gel 40ml	A daily acne treatment with 2% Salicylic Acid, Niacinamide, Ceramides, alpha- and beta-hydroxy acids (AHA and BHA). Offers gentle exfoliation, helps clear acne and prevent new breakouts from forming, improves the appearance of pores and strengthens skin barrier.	3100	9	121	f	https://assets.beautyhub.co.ke/wp-content/uploads/2022/05/10114758/cerave_acne_control_gel_40ml_1-300x300.jpg	3	Water, Glycerin, Sodium Hydroxide,Glycolic Acid,Lactic Acid, Salicylic Acid, Niacinamide, Ceramide Np, Ceramide Ap, Ceramide Eop, Carbomer, Cetearyl Alcohol, Behentrimonium Methosulfate, Triethyl Citrate, Sodium Hyaluronate, Sodium Lauroyl Lactylate, Cholesterol, Chlorphenesin, Disodium Edta, Hydroxypropyl Guar, Caprylyl Glycol, Xanthan Gum, Phytosphingosine, Benzoic Acid.
10	Cerave Eye Repair Cream For dark circles 14.2g	A fragrance-free, non-comedogenic eye cream that visibly reduces the look of dark circles and puffiness. It contains 3 essential ceramides to repair and restore the protective skin barrier and Hyaluronic acid to help retain skin’s moisture. Ideal for all skin types.	1890	12	91	f	https://assets.beautyhub.co.ke/wp-content/uploads/2019/01/31173840/cerave_eye_repair_cream-300x300.jpg	3	Purified Water, Niacinamide, Cetyl Alcohol, Caprylic/Capric Triglyceride, Glycerin, Propanediol, Isononyl Isononanoate, Jojoba Esters, Peg-20 Methyl Glucose Sesquistearate, Cetearyl Alcohol, Dimethicone, Methyl Glucose Sesquistearate, Ceramide 3, Ceramide 6-Ii, Ceramide 1, Hyaluronic Acid, Zinc Citrate, Prunus Amygdalus Dulcis (Almond) Oil, Aloe Barbadensis Leaf Juice, Chrysanthellum Indicum Extract, Tocopherol, Equisetum Arvense Extract, Asparagopsis Armata Extract, Ascophyllum Nodosum Extract, Phenoxyethanol, Carbomer, Behentrimonium Methosulfate, Sorbitol, Triethanolamine, Laureth-4, Butylene Glycol, Hydrogenated Vegetable Oil, Tetrasodium Edta, Ethylhexylglycerin, Sodium Lauroyl Lactylate, Sodium Hydroxide, Phytosphingosine, Cholesterol, Xanthan Gum
11	Cetaphil daily facial cleanswer 237ml	A gentle yet effective face wash that removes excess surface oils, dirt and makeup to leave skin feeling refreshed and healthy. This non-stripping and non-irritating formula rinses clean and will never leave skin feeling dry or tight.	2100	23	43	f	https://assets.beautyhub.co.ke/wp-content/uploads/2020/06/05171319/cetaphil_daily_facial_cleanser-300x300.jpg	11	Water, Glycerin, Cocamidopropyl Betaine, Disodium Laureth Sulfosuccinate, Sodium Cocoamphoacetate, Panthenol, Niacinamide, Pantolactone, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Sodium Benzoate, Masking Fragrance, Sodium Chloride, Citric Acid.
12	Nineless A-Control Heartleaf &amp; BHA Cleanser 120ml	Elevate your cleansing routine with our A-Control Heartleaf &amp; BHA Cleanser, where effective cleansing meets gentle care. The rich texture foam works wonders, effortlessly removing impurities, excess oil, and makeup, leaving your skin feeling invigorated and squeaky clean.	1650	10	433	t	https://assets.beautyhub.co.ke/wp-content/uploads/2024/01/17202549/nineless-a-control-heartleaf-bha-cleanser-120ml-300x300.jpg	12	Houttuynia Cordata Extract(440,000ppm), Glycerin, Myristic Acid, Water, Lauric Acid, Palmitic Acid, Stearic Acid , Potassium Hydroxide, Glyceryl Stearate, Decyl Glucoside, Cocamidopropyl Betaine, Sorbitan Olivate, 1,2-Hexanediol, Salicylic Acid(5,000ppm), Dipropylene Glycol, Lauramide DEA, Hydroxyacetophenone, Sodium Chloride, Caprylyl Glycol, Betaine, Capric Acid, Salix Alba (Willow) Bark Extract, Cladosiphon Okamuranus Extract, Centella Asiatica Leaf Extract, Camellia Sinensis Leaf Extract, Disodium EDTA, Arachidic Acid, Coffea Arabica (Coffee) Seed Extract, Citrus Aurantium Bergamia (Bergamot) Leaf Extract, Pinus Densiflora Leaf Extract, Dipotassium Glycyrrhizate.
13	Cetaphil gentle foaming cleanser 236ml	A gentle self-foaming cleanser, formulated with hydrating glycerin and Vitamins B5 and E. Removes dirt, makeup and excess oil without drying to maintain skin’s natural moisture balance and leave it feeling soft. Ideal for sensitive, dry to normal skin.	2400	7	122	t	https://assets.beautyhub.co.ke/wp-content/uploads/2020/06/10130217/cetaphil_gentle_foaming_cleanser_236ml-300x300.jpg	11	Water, Cocamidopropyl Betaine, Coco-Glucoside, Betaine, Glycerin, Panthenol (Vitamin B5), Tocopheryl Acetate (Vitamin E), Sodium Benzoate, Polysorbate 20, Polyquaternium-10, Phenoxyethanol, Citric Acid
14	isntree green teal fresh cleanswer 120ml	A gentle, gel-textured cleanser that transforms into a refreshing foam. Formulated with Green Tea extract, Hyaluronic Acid, and the patented Anti-Sebum P Complex, this cleanser is more than just a face wash—it’s your key to controlling oiliness, reducing excess sebum, and enhancing your skin’s texture.	2100	5	323	t	https://assets.beautyhub.co.ke/wp-content/uploads/2023/11/15093452/isntree-green-tea-fresh-cleanser-120ml-300x300.jpg	5	Water, Glycerin, Sodium Cocoyl Alaninate, Disodium Cocoamphodiacetate, Butylene Glycol, Sodium Methyl Cocoyl Taurate, 1,2-Hexanediol, Lauryl Hydroxysultaine, Xanthan Gum, Sodium Chloride, Caprylyl Glycol, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Camellia Sinensis Leaf Powder, Camellia Sinensis Leaf, Camellia Sinensis Leaf Extract, Sodium Phytate, Malt Extract, Hexylene Glycol, Oenothera Biennis (Evening Primrose) Flower Extract, Pinus Palustris Leaf Extract, Pueraria Thunbergiana Root Extract, Ulmus Davidiana Root Extract, Ethylhexylglycerin, Hydrolyzed Glycosaminoglycans, Propanediol, Sodium Hyaluronate Crosspolymer, Sodium Hyaluronate, Benzyl Glycol, Hydrolyzed Hyaluronic Acid, Hyaluronic Acid.
15	Some By Mi Tea Tree Calming Glow Luminous Sheet Mask 25g	Skin soothing sheet masks formulated with Tea Tree, Centella and Calendula extracts. Adheres tightly to face to effectively deliver active ingredients, help control oiliness and excessive sebum, calm irritated skin, clear acne and prevent breakouts to leave skin glowing.	250	3	89	t	https://assets.beautyhub.co.ke/wp-content/uploads/2019/05/30103109/some_by_mi_tea_tree_calming_glow_luminous_sheet_mask-300x300.jpg	9	Water, Glycerin, Glycereth-26, Melaleuca Alternifolia (Tea Tree) Leaf Extract, Centella Asiatica Extract, Calendula Officinalis Flower Extract, Camellia Sinensis Leaf Extract, Artemisia Vulgaris Extract, Salix Alba (Willow) Bark Extract, Origanum Vulgare Leaf Extract, Chamaecyparis Obtusa Leaf Extract, Lactobacillus/Soybean Ferment Extract, Cinnamomum Cassia Bark Extract, Scutellaria Baicalensis Root Extract, Portulaca Oleracea Extract, Pentylene Glycol, Sodium Hyaluronate, Sodium Hyaluronate Crosspolymer, Hydrolyzed Hyaluronic Acid, Hyaluronic Acid, Hydrolyzed Sodium Hyaluronate, 1,2-Hexanediol, Butylene Glycol, Polyglyceryl-10 Laurate, Polyglyceryl-10 Myristate, Arginine, Carbomer, Xanthan Gum, Hydroxyethylcellulose, Panthenol, Dipotassium Glycyrrhizate, Disodium EDTA, Hexylene Glycol, Hydroxyacetophenone, Ethylhexylglycerin, Citrus Aurantium Bergamia (Bergamot) Fruit Oil.
16	Benton Snail Bee High Content Essence 100ml	A multi-tasking essence formulated with brightening and wrinkle-improving ingredients. Niacinamide and Adenosine help fade acne scars and brightens skin tone. Snail Mucin hydrates, supports skin cells regeneration, replenishes moisture and increases skin firmness. Bee Venom helps clear blemishes and boost collagen.	1900	0	62	t	https://assets.beautyhub.co.ke/wp-content/uploads/2019/02/20095513/benton_snail_bee_high_content_essence_100ml_1-300x300.jpg	2	Water, Snail Secretion Filtrate, Camellia Sinensis Leaf Water, Butylene Glycol, Glycerin, Niacinamide, 1,2-Hexanediol, sh-Oligopeptide-1, Bee Venom, Diospyros Kaki Leaf Extract, Salix Alba (Willow) Bark Extract, Plantago Asiatica Extract, Laminaria Digitata Extract, Ulmus Campestris (Elm) Extract Pentylene Glycol, Zanthoxylum Piperitum Fruit Extract, Pulsatilla Koreana Extract, Usnea Barbata (Lichen) Extract, Althaea Rosea Root Extract, Aloe Barbadensis Leaf Extract, Betaine, Panthenol, Beta-Glucan, Allantoin, Adenosine, Polysorbate 20, Lecithin.
\.


--
-- Data for Name: skinsoko_product_subcategories; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.skinsoko_product_subcategories (id, product_id, subcategory_id) FROM stdin;
29	2	3
30	2	5
31	2	7
32	3	17
33	3	15
34	4	1
35	4	6
36	4	22
37	4	25
38	4	26
39	5	2
40	5	6
41	5	7
42	6	1
43	6	2
44	6	3
45	7	2
46	7	4
47	7	12
48	8	10
49	8	1
50	8	2
51	8	3
52	1	3
53	1	6
54	1	7
55	9	1
56	9	3
57	10	9
58	10	6
59	10	7
60	11	2
61	11	3
62	11	11
63	11	18
64	11	26
65	11	27
66	12	2
67	12	4
68	12	28
69	13	8
70	13	9
71	13	3
72	14	2
73	14	19
74	14	28
75	15	2
76	15	3
77	16	12
78	16	15
79	17	4
80	17	6
81	18	4
82	18	6
\.


--
-- Data for Name: skinsoko_review; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.skinsoko_review (review_id, rating, comment, created_at, product_id, user_id) FROM stdin;
\.


--
-- Data for Name: skinsoko_shoppingcart; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.skinsoko_shoppingcart (cart_id, created_at, user_id) FROM stdin;
\.


--
-- Data for Name: skinsoko_subcategory; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.skinsoko_subcategory (sub_category_id, name, main_category_id) FROM stdin;
1	Breakouts	1
2	Blackheads	1
3	Dark Eye Circles	1
4	Dark Spots	1
5	Large Pores	1
6	Lifting & Firming	1
7	Stretch Marks	1
8	Sunburn	1
9	Uneven Skin Tone	1
10	Wrinkles & Fine Lines	1
12	Dry Skin	2
13	Dull Skin	2
14	Mature Skin	2
15	Oily Skin	2
16	Rough Skin	2
17	Sensitive Skin	2
11	Acne-Prone Skin	2
18	Ampoules & Essence	3
19	Cleansers	3
20	Eye Care	3
21	Lip Care	3
22	Beauty Masks	3
23	Moisturizers	3
24	Scrubs & Peels	3
25	Serums	3
26	Spot Treatments	3
27	Sunscreens	3
28	Toners & Mists	3
\.


--
-- Data for Name: skinsoko_towns; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.skinsoko_towns (town_id, name, delivery_fee) FROM stdin;
1	Dar es Salaam	0
2	Mwanza	0
3	Arusha	0
4	Mbeya	0
5	Morogoro	0
6	Tanga	0
7	Kahama	0
8	Tabora	0
9	Zanzibar	0
10	Kigoma	0
11	Dodoma	0
12	Sumbawanga	0
13	Kasulu	0
14	Songea	0
15	Moshi	0
16	Musoma	0
17	Shinyanga	0
18	Iringa	0
19	Singida	0
20	Njombe	0
21	Bukoba	0
22	Kibaha	0
23	Mtwara	0
24	Mpanda	0
25	Tunduma	0
26	Makambako	0
27	Bahati	0
28	Handeni	0
29	Lindi	0
30	Korogwe	0
31	Mafinga	0
32	Nansio	0
\.


--
-- Data for Name: skinsoko_wishlist; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.skinsoko_wishlist (wishlist_id, added_at, product_id, user_id) FROM stdin;
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.social_auth_partial (id, token, next_step, backend, "timestamp", data) FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.social_auth_usersocialauth (id, provider, uid, user_id, created, modified, extra_data) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 132, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 104, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 33, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 44, true);


--
-- Name: skinsoko_address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.skinsoko_address_address_id_seq', 1, false);


--
-- Name: skinsoko_brand_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.skinsoko_brand_brand_id_seq', 13, true);


--
-- Name: skinsoko_cartitem_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.skinsoko_cartitem_item_id_seq', 1, false);


--
-- Name: skinsoko_maincategory_main_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.skinsoko_maincategory_main_category_id_seq', 4, true);


--
-- Name: skinsoko_order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.skinsoko_order_order_id_seq', 1, false);


--
-- Name: skinsoko_orderitem_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.skinsoko_orderitem_item_id_seq', 1, false);


--
-- Name: skinsoko_product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.skinsoko_product_product_id_seq', 18, true);


--
-- Name: skinsoko_product_subcategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.skinsoko_product_subcategories_id_seq', 82, true);


--
-- Name: skinsoko_review_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.skinsoko_review_review_id_seq', 1, false);


--
-- Name: skinsoko_shoppingcart_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.skinsoko_shoppingcart_cart_id_seq', 1, false);


--
-- Name: skinsoko_subcategory_sub_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.skinsoko_subcategory_sub_category_id_seq', 28, true);


--
-- Name: skinsoko_towns_town_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.skinsoko_towns_town_id_seq', 32, true);


--
-- Name: skinsoko_wishlist_wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.skinsoko_wishlist_wishlist_id_seq', 1, false);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: skinsoko_address skinsoko_address_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_address
    ADD CONSTRAINT skinsoko_address_pkey PRIMARY KEY (address_id);


--
-- Name: skinsoko_brand skinsoko_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_brand
    ADD CONSTRAINT skinsoko_brand_pkey PRIMARY KEY (brand_id);


--
-- Name: skinsoko_cartitem skinsoko_cartitem_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_cartitem
    ADD CONSTRAINT skinsoko_cartitem_pkey PRIMARY KEY (item_id);


--
-- Name: skinsoko_maincategory skinsoko_maincategory_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_maincategory
    ADD CONSTRAINT skinsoko_maincategory_pkey PRIMARY KEY (main_category_id);


--
-- Name: skinsoko_order skinsoko_order_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_order
    ADD CONSTRAINT skinsoko_order_pkey PRIMARY KEY (order_id);


--
-- Name: skinsoko_orderitem skinsoko_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_orderitem
    ADD CONSTRAINT skinsoko_orderitem_pkey PRIMARY KEY (item_id);


--
-- Name: skinsoko_product skinsoko_product_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_product
    ADD CONSTRAINT skinsoko_product_pkey PRIMARY KEY (product_id);


--
-- Name: skinsoko_product_subcategories skinsoko_product_subcate_product_id_subcategory_i_0f611f29_uniq; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_product_subcategories
    ADD CONSTRAINT skinsoko_product_subcate_product_id_subcategory_i_0f611f29_uniq UNIQUE (product_id, subcategory_id);


--
-- Name: skinsoko_product_subcategories skinsoko_product_subcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_product_subcategories
    ADD CONSTRAINT skinsoko_product_subcategories_pkey PRIMARY KEY (id);


--
-- Name: skinsoko_review skinsoko_review_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_review
    ADD CONSTRAINT skinsoko_review_pkey PRIMARY KEY (review_id);


--
-- Name: skinsoko_shoppingcart skinsoko_shoppingcart_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_shoppingcart
    ADD CONSTRAINT skinsoko_shoppingcart_pkey PRIMARY KEY (cart_id);


--
-- Name: skinsoko_subcategory skinsoko_subcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_subcategory
    ADD CONSTRAINT skinsoko_subcategory_pkey PRIMARY KEY (sub_category_id);


--
-- Name: skinsoko_towns skinsoko_towns_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_towns
    ADD CONSTRAINT skinsoko_towns_pkey PRIMARY KEY (town_id);


--
-- Name: skinsoko_wishlist skinsoko_wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_wishlist
    ADD CONSTRAINT skinsoko_wishlist_pkey PRIMARY KEY (wishlist_id);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: skinsoko_address_user_id_5826a87e; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX skinsoko_address_user_id_5826a87e ON public.skinsoko_address USING btree (user_id);


--
-- Name: skinsoko_cartitem_cart_id_945c448d; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX skinsoko_cartitem_cart_id_945c448d ON public.skinsoko_cartitem USING btree (cart_id);


--
-- Name: skinsoko_cartitem_product_id_c5868036; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX skinsoko_cartitem_product_id_c5868036 ON public.skinsoko_cartitem USING btree (product_id);


--
-- Name: skinsoko_order_user_id_98babc2c; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX skinsoko_order_user_id_98babc2c ON public.skinsoko_order USING btree (user_id);


--
-- Name: skinsoko_orderitem_order_id_ac9280a4; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX skinsoko_orderitem_order_id_ac9280a4 ON public.skinsoko_orderitem USING btree (order_id);


--
-- Name: skinsoko_orderitem_product_id_17d6bee0; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX skinsoko_orderitem_product_id_17d6bee0 ON public.skinsoko_orderitem USING btree (product_id);


--
-- Name: skinsoko_product_brand_id_6ad7ac54; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX skinsoko_product_brand_id_6ad7ac54 ON public.skinsoko_product USING btree (brand_id);


--
-- Name: skinsoko_product_subcategories_product_id_3886578a; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX skinsoko_product_subcategories_product_id_3886578a ON public.skinsoko_product_subcategories USING btree (product_id);


--
-- Name: skinsoko_product_subcategories_subcategory_id_76efdd1b; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX skinsoko_product_subcategories_subcategory_id_76efdd1b ON public.skinsoko_product_subcategories USING btree (subcategory_id);


--
-- Name: skinsoko_review_product_id_2e595d7b; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX skinsoko_review_product_id_2e595d7b ON public.skinsoko_review USING btree (product_id);


--
-- Name: skinsoko_review_user_id_02d89112; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX skinsoko_review_user_id_02d89112 ON public.skinsoko_review USING btree (user_id);


--
-- Name: skinsoko_shoppingcart_user_id_e4545bd1; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX skinsoko_shoppingcart_user_id_e4545bd1 ON public.skinsoko_shoppingcart USING btree (user_id);


--
-- Name: skinsoko_subcategory_main_category_id_5c46ac6b; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX skinsoko_subcategory_main_category_id_5c46ac6b ON public.skinsoko_subcategory USING btree (main_category_id);


--
-- Name: skinsoko_wishlist_product_id_fb67b88f; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX skinsoko_wishlist_product_id_fb67b88f ON public.skinsoko_wishlist USING btree (product_id);


--
-- Name: skinsoko_wishlist_user_id_7fa1bf13; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX skinsoko_wishlist_user_id_7fa1bf13 ON public.skinsoko_wishlist USING btree (user_id);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_uid_796e51dc; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc ON public.social_auth_usersocialauth USING btree (uid);


--
-- Name: social_auth_usersocialauth_uid_796e51dc_like; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc_like ON public.social_auth_usersocialauth USING btree (uid varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: skinsoko_cartitem skinsoko_cartitem_cart_id_945c448d_fk_skinsoko_; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_cartitem
    ADD CONSTRAINT skinsoko_cartitem_cart_id_945c448d_fk_skinsoko_ FOREIGN KEY (cart_id) REFERENCES public.skinsoko_shoppingcart(cart_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: skinsoko_cartitem skinsoko_cartitem_product_id_c5868036_fk_skinsoko_; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_cartitem
    ADD CONSTRAINT skinsoko_cartitem_product_id_c5868036_fk_skinsoko_ FOREIGN KEY (product_id) REFERENCES public.skinsoko_product(product_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: skinsoko_orderitem skinsoko_orderitem_order_id_ac9280a4_fk_skinsoko_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_orderitem
    ADD CONSTRAINT skinsoko_orderitem_order_id_ac9280a4_fk_skinsoko_order_order_id FOREIGN KEY (order_id) REFERENCES public.skinsoko_order(order_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: skinsoko_orderitem skinsoko_orderitem_product_id_17d6bee0_fk_skinsoko_; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_orderitem
    ADD CONSTRAINT skinsoko_orderitem_product_id_17d6bee0_fk_skinsoko_ FOREIGN KEY (product_id) REFERENCES public.skinsoko_product(product_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: skinsoko_product skinsoko_product_brand_id_6ad7ac54_fk_skinsoko_brand_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_product
    ADD CONSTRAINT skinsoko_product_brand_id_6ad7ac54_fk_skinsoko_brand_brand_id FOREIGN KEY (brand_id) REFERENCES public.skinsoko_brand(brand_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: skinsoko_product_subcategories skinsoko_product_sub_product_id_3886578a_fk_skinsoko_; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_product_subcategories
    ADD CONSTRAINT skinsoko_product_sub_product_id_3886578a_fk_skinsoko_ FOREIGN KEY (product_id) REFERENCES public.skinsoko_product(product_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: skinsoko_product_subcategories skinsoko_product_sub_subcategory_id_76efdd1b_fk_skinsoko_; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_product_subcategories
    ADD CONSTRAINT skinsoko_product_sub_subcategory_id_76efdd1b_fk_skinsoko_ FOREIGN KEY (subcategory_id) REFERENCES public.skinsoko_subcategory(sub_category_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: skinsoko_review skinsoko_review_product_id_2e595d7b_fk_skinsoko_; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_review
    ADD CONSTRAINT skinsoko_review_product_id_2e595d7b_fk_skinsoko_ FOREIGN KEY (product_id) REFERENCES public.skinsoko_product(product_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: skinsoko_subcategory skinsoko_subcategory_main_category_id_5c46ac6b_fk_skinsoko_; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_subcategory
    ADD CONSTRAINT skinsoko_subcategory_main_category_id_5c46ac6b_fk_skinsoko_ FOREIGN KEY (main_category_id) REFERENCES public.skinsoko_maincategory(main_category_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: skinsoko_wishlist skinsoko_wishlist_product_id_fb67b88f_fk_skinsoko_; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_wishlist
    ADD CONSTRAINT skinsoko_wishlist_product_id_fb67b88f_fk_skinsoko_ FOREIGN KEY (product_id) REFERENCES public.skinsoko_product(product_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

