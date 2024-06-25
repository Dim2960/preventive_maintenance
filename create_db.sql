-- Active: 1718803304234@@127.0.0.1@5432
-- CREATE DATABASE preventive_maintenance;


CREATE TABLE aeronefs (
    ref_aero VARCHAR(15) NOT NULL PRIMARY KEY UNIQUE,
    type_model VARCHAR(15) NOT NULL,
    debut_service DATE NOT NULL,
    last_maint DATE NOT NULL,
    en_maintenance BOOLEAN NOT NULL,
    end_maint TIMESTAMP 
);

CREATE TABLE aeronefs_cdc (
    operation CHAR(1) NOT NULL, -- 'I' pour INSERT, 'U' pour UPDATE, 'D' pour DELETE
    ref_aero VARCHAR(15),
    type_model VARCHAR(15),
    debut_service DATE,
    last_maint DATE,
    en_maintenance BOOLEAN,
    end_maint TIMESTAMP,
    change_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE composants (
    ref_compo VARCHAR(25) PRIMARY KEY,
    categorie VARCHAR(50) NOT NULL,
    aero VARCHAR(15) NOT NULL,
    desc_compo  VARCHAR(255) NOT NULL,
    lifespan INT NOT NULL,
    taux_usure_actuel FLOAT,
    cout INT NOT NULL
);

CREATE TABLE composants_cdc (
    operation CHAR(1) NOT NULL, -- 'I' pour INSERT, 'U' pour UPDATE, 'D' pour DELETE
    ref_compo VARCHAR(25) NOT NULL,
    categorie VARCHAR(50) NOT NULL,
    aero VARCHAR(15) NOT NULL,
    desc_compo VARCHAR(255) NOT NULL,
    lifespan INT NOT NULL,
    taux_usure_actuel FLOAT,
    cout INT NOT NULL,
    change_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE degradations (
    ref_deg VARCHAR(15) NOT NULL PRIMARY KEY,
    linked_aero VARCHAR(15) NOT NULL,
    compo_concerned VARCHAR(25) NOT NULL,
    usure_nouvelle FLOAT NOT NULL,
    measure_day DATE NOT NULL,
    need_replacement BOOLEAN NOT NULL
);

CREATE TABLE degradations_cdc (
    operation CHAR(1) NOT NULL, -- 'I' pour INSERT, 'U' pour UPDATE, 'D' pour DELETE
    ref_deg VARCHAR(15) NOT NULL,
    linked_aero VARCHAR(15) NOT NULL,
    compo_concerned VARCHAR(25) NOT NULL,
    usure_nouvelle FLOAT NOT NULL,
    measure_day DATE NOT NULL,
    need_replacement BOOLEAN NOT NULL,
    change_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE logs_vols (
    ref_vol VARCHAR(15) NOT NULL,
    aero_linked VARCHAR(15) NOT NULL,
    jour_vol DATE NOT NULL,
    time_en_air FLOAT NOT NULL,
    sensor_data VARCHAR(255) NOT NULL,
    etat_voyant INT NOT NULL
);

CREATE TABLE logs_vols_cdc (
    operation CHAR(1) NOT NULL, -- 'I' pour INSERT, 'U' pour UPDATE, 'D' pour DELETE
    ref_vol VARCHAR(15) NOT NULL,
    aero_linked VARCHAR(15) NOT NULL,
    jour_vol DATE NOT NULL,
    time_en_air FLOAT NOT NULL,
    sensor_data VARCHAR(255) NOT NULL,
    etat_voyant INT NOT NULL,
    change_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


