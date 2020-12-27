CREATE DATABASE IF NOT EXISTS smart_easy_travel;
CREATE SCHEMA IF NOT EXISTS smart_easy_travel;

CREATE TABLE IF NOT EXISTS smart_easy_travel.user_role (
	id  SMALLINT(255) AUTO_INCREMENT,
    role VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS smart_easy_travel.user (
	id  SMALLINT(255) AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL UNIQUE,
	phone VARCHAR(50) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    token VARCHAR(255) DEFAULT NULL,
    role SMALLINT(255),
    PRIMARY KEY (id),
    FOREIGN KEY (role) REFERENCES user_role(id)
);

CREATE TABLE IF NOT EXISTS smart_easy_travel.company (
	id  SMALLINT(255) AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT NOT NULL,
	email VARCHAR(50) NOT NULL UNIQUE,
	phone VARCHAR(50) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    user_id SMALLINT(255),
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);


CREATE TABLE IF NOT EXISTS smart_easy_travel.tourist_package (
	id  SMALLINT(255) AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
	image_path VARCHAR(255) DEFAULT NULL,
	price DECIMAL(8, 1) DEFAULT NULL,
    start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    end_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    max_tourists INT DEFAULT 4,
    status VARCHAR(120) DEFAULT 'ACTIVE',
    company_id SMALLINT(255),
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE IF NOT EXISTS smart_easy_travel.tourist_feedback (
	id  SMALLINT(255) AUTO_INCREMENT,
    tourist_package_id SMALLINT(255),
    feedback TEXT DEFAULT NULL,
	rate INTEGER DEFAULT NULL,
    PRIMARY KEY (id, tourist_package_id),
    FOREIGN KEY (tourist_package_id) REFERENCES tourist_package(id)
);

CREATE TABLE IF NOT EXISTS smart_easy_travel.tourist_area (
	id  SMALLINT(255) AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
	image_path VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS smart_easy_travel.booking (
	user_id  SMALLINT(255),
	tourist_package_id SMALLINT(255),
    status VARCHAR(255) NOT NULL DEFAULT 'BOOKING',
    PRIMARY KEY (user_id, tourist_package_id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (tourist_package_id) REFERENCES tourist_package(id)
);


CREATE TABLE IF NOT EXISTS smart_easy_travel.tourist_package_area (
	tourist_area_id  SMALLINT(255),
	tourist_package_id SMALLINT(255),
    PRIMARY KEY (tourist_area_id, tourist_package_id),
    FOREIGN KEY (tourist_area_id) REFERENCES tourist_area(id),
    FOREIGN KEY (tourist_package_id) REFERENCES tourist_package(id)
);

