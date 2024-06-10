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
-- Name: skinsoko_user; Type: TABLE; Schema: public; Owner: botontapwater
--

CREATE TABLE public.skinsoko_user (
    id uuid NOT NULL,
    username character varying(100) NOT NULL,
    email character varying(254) NOT NULL,
    password character varying(100) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    verification_token uuid,
    password_reset_token uuid,
    is_verified boolean NOT NULL
);


ALTER TABLE public.skinsoko_user OWNER TO botontapwater;

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
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$pOnlvZfzMzOew3IObDwfGn$mHTDRxbb5GUeD89aoQu3ufof6+p3bwvPK3jz3EokkRI=	2024-06-10 07:27:41.711572+00	t	admin			admin@outlook.com	t	t	2024-06-09 13:27:57.879516+00
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
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-06-09 13:10:00.229374+00
2	auth	0001_initial	2024-06-09 13:10:00.27921+00
3	admin	0001_initial	2024-06-09 13:10:00.293133+00
4	admin	0002_logentry_remove_auto_add	2024-06-09 13:10:00.302361+00
5	admin	0003_logentry_add_action_flag_choices	2024-06-09 13:10:00.309138+00
6	contenttypes	0002_remove_content_type_name	2024-06-09 13:10:00.327306+00
7	auth	0002_alter_permission_name_max_length	2024-06-09 13:10:00.334962+00
8	auth	0003_alter_user_email_max_length	2024-06-09 13:10:00.343482+00
9	auth	0004_alter_user_username_opts	2024-06-09 13:10:00.349844+00
10	auth	0005_alter_user_last_login_null	2024-06-09 13:10:00.356503+00
11	auth	0006_require_contenttypes_0002	2024-06-09 13:10:00.358203+00
12	auth	0007_alter_validators_add_error_messages	2024-06-09 13:10:00.365409+00
13	auth	0008_alter_user_username_max_length	2024-06-09 13:10:00.373852+00
14	auth	0009_alter_user_last_name_max_length	2024-06-09 13:10:00.380608+00
15	auth	0010_alter_group_name_max_length	2024-06-09 13:10:00.388917+00
16	auth	0011_update_proxy_permissions	2024-06-09 13:10:00.401702+00
17	auth	0012_alter_user_first_name_max_length	2024-06-09 13:10:00.409088+00
18	sessions	0001_initial	2024-06-09 13:10:00.423321+00
19	skinsoko	0001_initial	2024-06-09 13:10:00.569574+00
20	skinsoko	0002_auto_20240609_1625	2024-06-09 13:25:51.453504+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
rmviz9l1n12hcbpkcytr3ig8jtlqcx0x	.eJyrViotTi2Kz0xRslKyTDQ0NkpJSdVNTTI20jVJMjHVTTIxS9Y1tzRINTC2NDE0NTZU0oFoyEvMTQVqKUktLgHxYcKpuYmZOUjiDukgAb3k_FylWgDJqCIm:1sGLoU:bSj_8tmmyh61XBIY9Be7epkEP9b_ID_vh8lOgulYiMU	2024-06-23 16:54:38.421159+00
kxdrk1dlztmvkoe7yp0owgo0iv681h0n	.eJxVjMsOwiAQRf-FtSHQ4enSvd9AGBikaiAp7cr479qkC93ec859sRC3tYZt0BLmzM5MstPvhjE9qO0g32O7dZ56W5cZ-a7wgw5-7Zmel8P9O6hx1G_tTUTQEzgH5A35hCSkFFkTKSeUJg9WYtLGqALSTlarBLEUAUrIhIa9P8dmNxE:1sGZRN:dm2PGqvCcD_ATBlT9CfC2WVHgsNjdv2N1DhQiGJsvPI	2024-06-24 07:27:41.714775+00
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
1	CONCERNS
2	SKIN TYPE
3	SKINCARE
4	HAIR CARE
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
1	Licorice pH Balancing Cleansing Toner	Deep clean and brighten your skin with this specially-formulated toner that's perfect for all skin types!\r\n\r\nAcwell Licorice pH Balancing Cleansing Toner has a pH level of 5.5 to effectively balance your skin. Peony extract and a high concentration of licorice water - both natural brighteners - seep into skin to add an extra dose of luminosity to your complexion. Green tea extract also helps calm and reduce pigmentation, including acne scars and dark spots. After use, skin feels clean and smooth, not dry or tight. Because it's so good at removing any impurities left on the skin post-cleanser, it helps the rest of the products in your routine absorb better. To maximize results and benefits use with Licorice pH Balancing Essence Mist.\r\n\r\n5 fl. oz./150ml\r\n\r\nThe toner is your ticket to achieving glowing, supple honey skin. Follow with the Neogen Real Ferment Micro Essence for even more flawless results.	18	0	30	t	https://sokoglam.com/cdn/shop/products/Bestseller-Reshoot-PDP_-Acwell-Licorice-pH-Balancing-Toner_Bestseller-Reshoot-PDP_-Acwell-Licorice-pH-Balancing-Toner_860x.jpg?v=1677605532	1	Water, Glycyrrhiza Glabra (Licorice) Root Water, PEG-6 Caprylic/Capric Glycerides, PEG-7 Glyceryl Cocoate, Dipropylene Glycol, 1,2-Hexanediol, Poloxamer 184, Phenoxyethanol, Glycerin, Butylene Glycol, Rheum Palmatum Root Extract, Psidium Guajava Leaf Extract, Rosa Centifolia Flower Extract, Camellia Sinensis Leaf Extract, Perilla Ocymoides Seed Extract, Poncirus Trifoliata Fruit Extract, Citrus Aurantium Bergamia (Bergamot) Fruit Oil, Sodium Citrate, Disodium EDTA, Citric Acid, Tocopheryl Acetate, Glycyrrhiza Glabra (Licorice) Root Extract, Paeonia Albiflora Root Extract, Cimicifuga Dahurica Root Extract, Pueraria Lobata Root Extract, Propylene Glycol, Ethylhexylglycerin
\.


--
-- Data for Name: skinsoko_product_subcategories; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.skinsoko_product_subcategories (id, product_id, subcategory_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	1	10
11	1	11
12	1	12
13	1	13
14	1	14
15	1	15
16	1	16
17	1	17
18	1	18
19	1	19
20	1	20
21	1	21
22	1	22
23	1	23
24	1	24
25	1	25
26	1	26
27	1	27
28	1	28
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
-- Data for Name: skinsoko_user; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.skinsoko_user (id, username, email, password, first_name, last_name, verification_token, password_reset_token, is_verified) FROM stdin;
9a132dde-eb32-4b45-b46c-790e03941531	testuser	testuser@gmail.com	testuser	test	user	aee0d3b0-4ccb-4a07-b8ff-26d1ac9ae706	\N	t
\.


--
-- Data for Name: skinsoko_wishlist; Type: TABLE DATA; Schema: public; Owner: botontapwater
--

COPY public.skinsoko_wishlist (wishlist_id, added_at, product_id, user_id) FROM stdin;
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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 112, true);


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

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 76, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 28, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- Name: skinsoko_address_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.skinsoko_address_address_id_seq', 1, false);


--
-- Name: skinsoko_brand_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.skinsoko_brand_brand_id_seq', 9, true);


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

SELECT pg_catalog.setval('public.skinsoko_product_product_id_seq', 1, true);


--
-- Name: skinsoko_product_subcategories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: botontapwater
--

SELECT pg_catalog.setval('public.skinsoko_product_subcategories_id_seq', 28, true);


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
-- Name: skinsoko_user skinsoko_user_email_key; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_user
    ADD CONSTRAINT skinsoko_user_email_key UNIQUE (email);


--
-- Name: skinsoko_user skinsoko_user_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_user
    ADD CONSTRAINT skinsoko_user_pkey PRIMARY KEY (id);


--
-- Name: skinsoko_user skinsoko_user_username_key; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_user
    ADD CONSTRAINT skinsoko_user_username_key UNIQUE (username);


--
-- Name: skinsoko_wishlist skinsoko_wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_wishlist
    ADD CONSTRAINT skinsoko_wishlist_pkey PRIMARY KEY (wishlist_id);


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
-- Name: skinsoko_user_email_dee6e4a8_like; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX skinsoko_user_email_dee6e4a8_like ON public.skinsoko_user USING btree (email varchar_pattern_ops);


--
-- Name: skinsoko_user_username_eadd459b_like; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX skinsoko_user_username_eadd459b_like ON public.skinsoko_user USING btree (username varchar_pattern_ops);


--
-- Name: skinsoko_wishlist_product_id_fb67b88f; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX skinsoko_wishlist_product_id_fb67b88f ON public.skinsoko_wishlist USING btree (product_id);


--
-- Name: skinsoko_wishlist_user_id_7fa1bf13; Type: INDEX; Schema: public; Owner: botontapwater
--

CREATE INDEX skinsoko_wishlist_user_id_7fa1bf13 ON public.skinsoko_wishlist USING btree (user_id);


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
-- Name: skinsoko_address skinsoko_address_user_id_5826a87e_fk_skinsoko_user_id; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_address
    ADD CONSTRAINT skinsoko_address_user_id_5826a87e_fk_skinsoko_user_id FOREIGN KEY (user_id) REFERENCES public.skinsoko_user(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: skinsoko_order skinsoko_order_user_id_98babc2c_fk_skinsoko_user_id; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_order
    ADD CONSTRAINT skinsoko_order_user_id_98babc2c_fk_skinsoko_user_id FOREIGN KEY (user_id) REFERENCES public.skinsoko_user(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: skinsoko_review skinsoko_review_user_id_02d89112_fk_skinsoko_user_id; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_review
    ADD CONSTRAINT skinsoko_review_user_id_02d89112_fk_skinsoko_user_id FOREIGN KEY (user_id) REFERENCES public.skinsoko_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: skinsoko_shoppingcart skinsoko_shoppingcart_user_id_e4545bd1_fk_skinsoko_user_id; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_shoppingcart
    ADD CONSTRAINT skinsoko_shoppingcart_user_id_e4545bd1_fk_skinsoko_user_id FOREIGN KEY (user_id) REFERENCES public.skinsoko_user(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: skinsoko_wishlist skinsoko_wishlist_user_id_7fa1bf13_fk_skinsoko_user_id; Type: FK CONSTRAINT; Schema: public; Owner: botontapwater
--

ALTER TABLE ONLY public.skinsoko_wishlist
    ADD CONSTRAINT skinsoko_wishlist_user_id_7fa1bf13_fk_skinsoko_user_id FOREIGN KEY (user_id) REFERENCES public.skinsoko_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

