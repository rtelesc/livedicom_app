-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-03-24 07:42:26.249

-- tables
-- Table: attachs
CREATE TABLE attachs (
    id_attach int NOT NULL,
    reports_id_report int NOT NULL,
    CONSTRAINT attachs_pk PRIMARY KEY (id_attach)
);

-- Table: images
CREATE TABLE images (
    id_image int NOT NULL,
    reports_id_report int NOT NULL,
    CONSTRAINT images_pk PRIMARY KEY (id_image)
);

-- Table: locals
CREATE TABLE locals (
    id_local int NOT NULL,
    name varchar(255) NOT NULL,
    users_id_user int NOT NULL,
    CONSTRAINT locals_pk PRIMARY KEY (id_local)
);

-- Table: profiles
CREATE TABLE profiles (
    id_profile int NOT NULL,
    status int NOT NULL,
    type varchar(60) NOT NULL,
    users_id_user int NOT NULL,
    CONSTRAINT profiles_pk PRIMARY KEY (id_profile)
);

-- Table: reports
CREATE TABLE reports (
    id_report int NOT NULL,
    nome varchar(255) NOT NULL,
    id_image int NOT NULL,
    locals_id_local int NOT NULL,
    CONSTRAINT id_report PRIMARY KEY (id_report)
);

-- Table: users
CREATE TABLE users (
    id_user int NOT NULL,
    email varchar(255) NOT NULL,
    CONSTRAINT id_user PRIMARY KEY (id_user)
);

-- foreign keys
-- Reference: attachs_reports (table: attachs)
ALTER TABLE attachs ADD CONSTRAINT attachs_reports FOREIGN KEY attachs_reports (reports_id_report)
    REFERENCES reports (id_report);

-- Reference: images_reports (table: images)
ALTER TABLE images ADD CONSTRAINT images_reports FOREIGN KEY images_reports (reports_id_report)
    REFERENCES reports (id_report);

-- Reference: locals_users (table: locals)
ALTER TABLE locals ADD CONSTRAINT locals_users FOREIGN KEY locals_users (users_id_user)
    REFERENCES users (id_user)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- Reference: profiles_users (table: profiles)
ALTER TABLE profiles ADD CONSTRAINT profiles_users FOREIGN KEY profiles_users (users_id_user)
    REFERENCES users (id_user)
    ON DELETE CASCADE;

-- Reference: reports_locals (table: reports)
ALTER TABLE reports ADD CONSTRAINT reports_locals FOREIGN KEY reports_locals (locals_id_local)
    REFERENCES locals (id_local)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

-- End of file.

