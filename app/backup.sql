PGDMP     5    /                {            translator-app    15.1    15.1      :           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ;           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            <           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            =           1262    59935    translator-app    DATABASE     ?   CREATE DATABASE "translator-app" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = icu LOCALE = 'en_US.UTF-8' ICU_LOCALE = 'en-US';
     DROP DATABASE "translator-app";
             	   adampecan    false            ?            1259    72326    phrasebook_translation    TABLE     ?   CREATE TABLE public.phrasebook_translation (
    phrasebook_id integer NOT NULL,
    translation_id integer NOT NULL,
    note text
);
 *   DROP TABLE public.phrasebook_translation;
       public         heap 	   adampecan    false            ?            1259    72313    phrasebooks    TABLE     ?   CREATE TABLE public.phrasebooks (
    id integer NOT NULL,
    name character varying NOT NULL,
    user_id integer NOT NULL,
    public boolean NOT NULL,
    lang_from character varying NOT NULL,
    lang_to character varying NOT NULL
);
    DROP TABLE public.phrasebooks;
       public         heap 	   adampecan    false            ?            1259    72312    phrasebooks_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.phrasebooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.phrasebooks_id_seq;
       public       	   adampecan    false    219            >           0    0    phrasebooks_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.phrasebooks_id_seq OWNED BY public.phrasebooks.id;
          public       	   adampecan    false    218            ?            1259    72304    translations    TABLE     ?   CREATE TABLE public.translations (
    id integer NOT NULL,
    lang_from character varying NOT NULL,
    lang_to character varying NOT NULL,
    text_from text NOT NULL,
    text_to text NOT NULL
);
     DROP TABLE public.translations;
       public         heap 	   adampecan    false            ?            1259    72303    translations_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.translations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.translations_id_seq;
       public       	   adampecan    false    217            ?           0    0    translations_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.translations_id_seq OWNED BY public.translations.id;
          public       	   adampecan    false    216            ?            1259    72293    users    TABLE     o   CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL
);
    DROP TABLE public.users;
       public         heap 	   adampecan    false            ?            1259    72292    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public       	   adampecan    false    215            @           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public       	   adampecan    false    214            ?           2604    72316    phrasebooks id    DEFAULT     p   ALTER TABLE ONLY public.phrasebooks ALTER COLUMN id SET DEFAULT nextval('public.phrasebooks_id_seq'::regclass);
 =   ALTER TABLE public.phrasebooks ALTER COLUMN id DROP DEFAULT;
       public       	   adampecan    false    219    218    219            ?           2604    72307    translations id    DEFAULT     r   ALTER TABLE ONLY public.translations ALTER COLUMN id SET DEFAULT nextval('public.translations_id_seq'::regclass);
 >   ALTER TABLE public.translations ALTER COLUMN id DROP DEFAULT;
       public       	   adampecan    false    217    216    217            ?           2604    72296    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public       	   adampecan    false    214    215    215            7          0    72326    phrasebook_translation 
   TABLE DATA           U   COPY public.phrasebook_translation (phrasebook_id, translation_id, note) FROM stdin;
    public       	   adampecan    false    220   %       6          0    72313    phrasebooks 
   TABLE DATA           T   COPY public.phrasebooks (id, name, user_id, public, lang_from, lang_to) FROM stdin;
    public       	   adampecan    false    219   E&       4          0    72304    translations 
   TABLE DATA           R   COPY public.translations (id, lang_from, lang_to, text_from, text_to) FROM stdin;
    public       	   adampecan    false    217   ?&       2          0    72293    users 
   TABLE DATA           7   COPY public.users (id, username, password) FROM stdin;
    public       	   adampecan    false    215   ,-       A           0    0    phrasebooks_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.phrasebooks_id_seq', 35, true);
          public       	   adampecan    false    218            B           0    0    translations_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.translations_id_seq', 71, true);
          public       	   adampecan    false    216            C           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 7, true);
          public       	   adampecan    false    214            ?           2606    72332 2   phrasebook_translation phrasebook_translation_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public.phrasebook_translation
    ADD CONSTRAINT phrasebook_translation_pkey PRIMARY KEY (phrasebook_id, translation_id);
 \   ALTER TABLE ONLY public.phrasebook_translation DROP CONSTRAINT phrasebook_translation_pkey;
       public         	   adampecan    false    220    220            ?           2606    72320    phrasebooks phrasebooks_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.phrasebooks
    ADD CONSTRAINT phrasebooks_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.phrasebooks DROP CONSTRAINT phrasebooks_pkey;
       public         	   adampecan    false    219            ?           2606    72311    translations translations_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.translations
    ADD CONSTRAINT translations_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.translations DROP CONSTRAINT translations_pkey;
       public         	   adampecan    false    217            ?           2606    72300    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         	   adampecan    false    215            ?           2606    72302    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public         	   adampecan    false    215            ?           2606    72333 @   phrasebook_translation phrasebook_translation_phrasebook_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.phrasebook_translation
    ADD CONSTRAINT phrasebook_translation_phrasebook_id_fkey FOREIGN KEY (phrasebook_id) REFERENCES public.phrasebooks(id);
 j   ALTER TABLE ONLY public.phrasebook_translation DROP CONSTRAINT phrasebook_translation_phrasebook_id_fkey;
       public       	   adampecan    false    3485    220    219            ?           2606    72338 A   phrasebook_translation phrasebook_translation_translation_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.phrasebook_translation
    ADD CONSTRAINT phrasebook_translation_translation_id_fkey FOREIGN KEY (translation_id) REFERENCES public.translations(id);
 k   ALTER TABLE ONLY public.phrasebook_translation DROP CONSTRAINT phrasebook_translation_translation_id_fkey;
       public       	   adampecan    false    220    217    3483            ?           2606    72321 $   phrasebooks phrasebooks_user_id_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.phrasebooks
    ADD CONSTRAINT phrasebooks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 N   ALTER TABLE ONLY public.phrasebooks DROP CONSTRAINT phrasebooks_user_id_fkey;
       public       	   adampecan    false    219    3479    215            7   0  x?E?=O?0???+?S?*????,LH]Bj?HG?K??c?????NgC9]ބ?2Qӓ???|???????xwҐ̶+[??>^??&?i??v?a?O??xf??ݲ???n?J??
9??s?????|n?O˾?+_?x???<???L?
???a?֫H?W?
??୨Hei???gk???j?u?oZϽ???B??s3????????ķ??aKX?:?3(???y?8/?u??r?j??A?n?????X?KX?:?gP?8OS???9,`	+?6?"?q??BA?aKX?:Yf0λ????;      6   ?   x?M??
?0E?w?"???ZA?BSQ??q???h?i ?
???$d{8???z?F?9?XZ?q?o??QnOTc????*?K'??[ew??E8?wgZ?N2?D??5:??????AѪf??b?B?V??{?R??̉?2?48      4   ?  x?mV?nG>O?E???$??D?'?????? +or??8S???3M?i?dD?oD{??@?v ??(<?-?UsZ?>??k?????WϾ:??y?켪[??ի??????W?f}?fzmb?c?znldP}??$q???]8]?^??V???p???⽠??????7i??^R?35???gM??qIϽ???)?f??oX3???͙z0?X8?????􋒅?G?@=?>/^?m/
?wx%??`??dPq_S?qǛ\?>??.<???{?X2??_?mL$?5??Lr:P??p??d???m??>?\??:S??h,?>\m?Z?????}?nw????[5?Ƙz?vW????yw?N?N?sf[????jt:?????]??????????<Q??]?̄??hԸ??\?]???? ,A/-??M2??'?&^??K???VΫq?<,MOu?ҿ?+??? ?Ը?ޥ?z???8{y??.?b?p?M??h??̕?ޭ5e????q??	5?????dA?>????Ɓ?x???^??L?!?s?CМ"???ƥ P?s4??5?^<?p ?d?Lhs(??[??4?C9?D:S?B?-???p???? Y????jC?Ju??3!DLK?B?!?M}?V@<???d2???Q?cդ@|?f#?Z?SKҡe;Gڇ:8?7??3?o;!1?4?]t{??Cmq?s???t`U?Ң?S??f?1?IA?3????ܲf%?:}??BÓ^??x???P??nbq#(?,<>Ǝu???7<X???Lp,?ע]3??"?<??1?$9Z??񊛛\???5^???n?4????T\I???Gk?O?
ё?H???+?z????
Y?B?ltKVK??p??2?,N?H?x????J??E???h?t??A?!?x P4??j??"????Κ??ur2g?iB?^??I????g?ҁ?H[£??w?U'????.?O\'Ҙy??h?~?H???????????WC?o????G??????k?K?w?c??p??Q1??p???p?kt? ?.????w??͢E??HH'???????E?@??p??????Do??I???A?????4? ??0?dhi?????[??x?m?K?_u.m?G98?N??){?9I?G?NO?Z???!?xz?Ȣ?????????u???R??Q???B???ej?,O?$??xg???n,/?,?Y?>?k?<??%?~5??9 ???X?U_?2=?]Zq>R?Iϯ^?Ro??@?@Et????2?[7?a?f?!F??.??P?N?v.s??C??5-
ͯ??y?q?KIM?T??t?l5ae!5-??o#,?D????n.?3???m?D?7c?nɫi??<??X?#IM?Į?Hd????Yԛ????lH??-0??P??E??̥?ZB??s??????^2T??"A?>Zڻ??b????jz??1v?}?f?y??찙TêIE???nB?A?^0j?????}?%?Z$D?lL??????r?E??Wh?2T+C??R??F.???if??$??x?E??0?f????؎?YÞ?:	Hy?B??x??F???:???J??????      2   ?   x?5?KR?0  ?59?hc??2?:?`G???&??~??X??ӻ?;?[$? ???I?T?@??ŕ??fϾ~9+?7#????޶??/?? ӶCS_???;=۾?Goec??P?)"}?P~??&3?c)W??Ɲ?˦6??X$???? ?????N???9;c??ձ?BM??}??I???K???????Q?3~  ?I?C?     