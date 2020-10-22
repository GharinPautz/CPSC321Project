/*
	Team: Kellie Colson & Ghar Pautz
    Assignment: proj-4
    Class: CPSC 321
*/

SET sql_mode = STRICT_ALL_TABLES;

CREATE TABLE Destinations (
	city VARCHAR(15),
    country VARCHAR(15),
    has_beaches BOOL, 
    has_mountains BOOL, 
    is_modern BOOL, 
    is_historic BOOL,
    is_adventurous BOOL,
    is_family_friendly BOOL, 
    has_travel_companion BOOL, 
    is_relaxing BOOL,
    average_rating FLOAT,
    PRIMARY KEY (city, country)
);

CREATE TABLE Destination_Review (
	review_id INT AUTO_INCREMENT, 
    destination_city VARCHAR(15),
    destination_country VARCHAR(15),
    review TEXT,
    PRIMARY KEY (review_id)
);

CREATE TABLE User (
	username VARCHAR(20),
    password VARCHAR(30),
    name VARCHAR(30), 
    city VARCHAR(20),
    state VARCHAR(15),
    address VARCHAR(50),
    zipcode CHAR(5),
    PRIMARY KEY (username)
);

CREATE TABLE Feedback_Survey (
	survey_id INT AUTO_INCREMENT,
    destination_city VARCHAR(15),
    destination_country VARCHAR(15), 
    rating FLOAT,
    review TEXT,
    review_id INT,
    PRIMARY KEY (survey_id),
    FOREIGN KEY (destination_city, destination_country) REFERENCES Destinations (city, country)
)



