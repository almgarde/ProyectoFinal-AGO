CREATE TABLE NEWS (
id_news NUMBER(15,0) CONSTRAINT news_pk PRIMARY KEY,
title_news VARCHAR2(200) CONSTRAINT title_news_nn NOT NULL CONSTRAINT title_news_unique UNIQUE,
image_news VARCHAR2(150)CONSTRAINT image_news_nn NOT NULL,
abstract_news VARCHAR2(500),
content_news varchar2(3900) CONSTRAINT content_news_nn NOT NULL,
update_admin VARCHAR2(200) CONSTRAINT update_user_news_nn NOT NULL,
update_date DATE CONSTRAINT update_date_news_nn NOT NULL,
ACTIVE NUMBER (1,0) CONSTRAINT active_news_nn NOT NULL
);

CREATE TABLE LINKS (
id_link NUMBER(15,0) CONSTRAINT links_pk PRIMARY KEY,
title_link VARCHAR2(200) CONSTRAINT title_link_nn NOT NULL CONSTRAINT title_link_unique UNIQUE,
image_link VARCHAR2(150)CONSTRAINT image_link_nn NOT NULL,
url_link varchar2(3900) CONSTRAINT url_link_nn NOT NULL,
update_admin VARCHAR2(200) CONSTRAINT update_user_link_nn NOT NULL,
update_date DATE CONSTRAINT update_date_link_nn NOT NULL,
active NUMBER (1,0) CONSTRAINT active_links_nn NOT NULL
);

CREATE TABLE PUBLICATIONS (
id_publication NUMBER(15,0) CONSTRAINT publications_pk PRIMARY KEY,
title_publication VARCHAR2(200) CONSTRAINT title_publication_nn NOT NULL,
journal_publication VARCHAR2(50)CONSTRAINT journal_publication_nn NOT NULL,
doi_publication VARCHAR2(300) CONSTRAINT doi_publication_nn NOT NULL,
year_publication NUMBER(4,0) CONSTRAINT year_publication_nn NOT NULL,
update_admin VARCHAR2(200) CONSTRAINT update_user_publication_nn NOT NULL,
update_date DATE CONSTRAINT update_date_publication_nn NOT NULL,
active NUMBER (1,0) CONSTRAINT active_publications_nn NOT NULL
);

CREATE TABLE AUTHORS_PUBLICATIONS (
id_publication NUMBER(15,0) CONSTRAINT id_publication_nn NOT NULL,
id_author NUMBER(15,0),
id_member NUMBER(15,0),
name_author VARCHAR2(200) CONSTRAINT name_author_nn NOT NULL, 
short_name_author VARCHAR2(30) CONSTRAINT short_name_author_nn NOT NULL,
CONSTRAINT authors_publications_pk PRIMARY KEY(id_publication, id_author),
CONSTRAINT id_publication_fk FOREIGN KEY (id_publication) REFERENCES PUBLICATIONS(id_publication) ON DELETE CASCADE
);

CREATE TABLE PROJECTS (
id_project NUMBER(15,0) CONSTRAINT projects_pk PRIMARY KEY,
title_project VARCHAR2(200) CONSTRAINT title_project_nn NOT NULL CONSTRAINT title_project_unique UNIQUE,
image_project VARCHAR2(150)CONSTRAINT image_project_nn NOT NULL,
description_project varchar2(3900) CONSTRAINT description_project_nn NOT NULL,
update_admin VARCHAR2(200) CONSTRAINT update_user_project_nn NOT NULL,
update_date DATE CONSTRAINT update_date_project_nn NOT NULL,
active NUMBER (1,0) CONSTRAINT active_projects_nn NOT NULL
);

CREATE TABLE THESIS (
id_thesis NUMBER(15,0) CONSTRAINT thesis_pk PRIMARY KEY,
doctor_thesis VARCHAR2(200) CONSTRAINT doctor_thesis_nn NOT NULL,
title_thesis VARCHAR2(200) CONSTRAINT title_thesis_nn NOT NULL,
cover_page_thesis VARCHAR2(150)CONSTRAINT cover_page_thesis_nn NOT NULL,
date_defense_thesis DATE CONSTRAINT date_defense_thesis_nn NOT NULL,
director_thesis VARCHAR2(200) CONSTRAINT director_thesis_nn NOT NULL,
codirector_thesis VARCHAR2(200),
url_thesis varchar2(3900),
update_admin VARCHAR2(200) CONSTRAINT update_user_thesis_nn NOT NULL,
update_date DATE CONSTRAINT update_date_thesis_nn NOT NULL,
ACTIVE NUMBER (1,0) CONSTRAINT active_thesis_nn NOT NULL
);

CREATE TABLE PROFESSIONAL_CATEGORIES (
id_pro_cat NUMBER(15,0) CONSTRAINT pro_cats_pk PRIMARY KEY,
name_pro_cat VARCHAR2(200) CONSTRAINT name_pro_cat_nn NOT NULL CONSTRAINT name_pro_cat_unique UNIQUE,
update_admin VARCHAR2(200) CONSTRAINT update_user_pro_cat_nn NOT NULL,
update_date DATE CONSTRAINT update_date_pro_cat_nn NOT NULL,
ACTIVE NUMBER (1,0) CONSTRAINT active_pro_cat_nn NOT NULL
);

CREATE TABLE TECHNICAL_CATEGORIES (
id_tech_cat NUMBER(15,0) CONSTRAINT tech_cats_pk PRIMARY KEY,
name_tech_cat VARCHAR2(200) CONSTRAINT name_tech_cat_nn NOT NULL CONSTRAINT name_tech_cat_unique UNIQUE,
update_admin VARCHAR2(200) CONSTRAINT update_user_tech_cat_nn NOT NULL,
update_date DATE CONSTRAINT update_date_tech_cat_nn NOT NULL,
ACTIVE NUMBER (1,0)
);

CREATE TABLE FACILITIES (
id_facility NUMBER(15,0) CONSTRAINT facility_pk PRIMARY KEY,
name_facility VARCHAR2(200) CONSTRAINT name_facility_nn NOT NULL,
id_tech_cat NUMBER(15,0) CONSTRAINT id_tech_cat_facility_nn NOT NULL,
photo_facility VARCHAR2(150)CONSTRAINT photo_facility_nn NOT NULL,
features_facility varchar2(3900) CONSTRAINT features_facility_nn NOT NULL,
update_admin VARCHAR2(200) CONSTRAINT update_user_facility_nn NOT NULL,
update_date DATE CONSTRAINT update_date_facility_nn NOT NULL,
ACTIVE NUMBER (1,0) CONSTRAINT active_facilitiy_nn NOT NULL,
CONSTRAINT id_tech_cat_facility_fk FOREIGN KEY (id_tech_cat) REFERENCES technical_categories(id_tech_cat) ON DELETE CASCADE
);

CREATE TABLE MEMBERS (
id_member NUMBER(15,0) CONSTRAINT members_pk PRIMARY KEY,
name_member VARCHAR2(200) CONSTRAINT name_member_nn NOT NULL,
short_name_member VARCHAR2(30) CONSTRAINT short_name_member_nn NOT NULL CONSTRAINT short_name_member_unique UNIQUE,
dni_member VARCHAR2(9) CONSTRAINT dni_member_unique UNIQUE,
email_member VARCHAR2(200) CONSTRAINT email_member_nn NOT NULL CONSTRAINT email_member_unique UNIQUE,
phone_member VARCHAR2(30),
id_pro_cat NUMBER(15,0) CONSTRAINT id_pro_cat_member_nn NOT NULL,
photo_member VARCHAR2(150)CONSTRAINT photo_member_nn NOT NULL,
research_id_member VARCHAR2(50) CONSTRAINT research_id_member_unique UNIQUE,
scopus_id_member VARCHAR2(50) CONSTRAINT scopus_id_member_unique UNIQUE,
orc_id_member VARCHAR2(50) CONSTRAINT orc_id_member_unique UNIQUE,
trajectory_member varchar2(3900),
update_admin VARCHAR2(200) CONSTRAINT update_user_member_nn NOT NULL,
update_date DATE CONSTRAINT update_date_member_nn NOT NULL,
ACTIVE NUMBER (1,0) CONSTRAINT active_member_nn NOT NULL,
CONSTRAINT id_pro_cat_members_fk FOREIGN KEY (id_pro_cat) REFERENCES professional_categories(id_pro_cat) ON DELETE CASCADE
);

CREATE TABLE ADMINS (
id_admin NUMBER(15,0) CONSTRAINT admins_pk PRIMARY KEY,
name_admin VARCHAR2(200) CONSTRAINT name_admin_nn NOT NULL,
email_admin VARCHAR2(200) CONSTRAINT email_admin_nn NOT NULL CONSTRAINT email_admin_unique UNIQUE,
user_admin VARCHAR2(10) CONSTRAINT user_admin_nn NOT NULL CONSTRAINT user_admin_unique UNIQUE,
pwd_admin varchar2(3900) CONSTRAINT psw_admin_nn NOT NULL
);

CREATE SEQUENCE SEQ_NEWS START WITH 1 INCREMENT BY 1 MAXVALUE 99999 MINVALUE 1;
CREATE SEQUENCE SEQ_LINKS START WITH 1 INCREMENT BY 1 MAXVALUE 99999 MINVALUE 1;
CREATE SEQUENCE SEQ_AUTHORS_PUBLICATIONS START WITH 1 INCREMENT BY 1 MAXVALUE 99999 MINVALUE 1;
CREATE SEQUENCE SEQ_PUBLICATIONS START WITH 1 INCREMENT BY 1 MAXVALUE 99999 MINVALUE 1;
CREATE SEQUENCE SEQ_PROJECTS START WITH 1 INCREMENT BY 1 MAXVALUE 99999 MINVALUE 1;
CREATE SEQUENCE SEQ_THESIS START WITH 1 INCREMENT BY 1 MAXVALUE 99999 MINVALUE 1;
CREATE SEQUENCE SEQ_PROFESSIONAL_CATEGORIES START WITH 1 INCREMENT BY 1 MAXVALUE 99999 MINVALUE 1;
CREATE SEQUENCE SEQ_TECHNICAL_CATEGORIES START WITH 1 INCREMENT BY 1 MAXVALUE 99999 MINVALUE 1;
CREATE SEQUENCE SEQ_FACILITIES START WITH 1 INCREMENT BY 1 MAXVALUE 99999 MINVALUE 1;
CREATE SEQUENCE SEQ_MEMBERS START WITH 1 INCREMENT BY 1 MAXVALUE 99999 MINVALUE 1;
CREATE SEQUENCE SEQ_ADMINS START WITH 1 INCREMENT BY 1 MAXVALUE 99999 MINVALUE 1;

