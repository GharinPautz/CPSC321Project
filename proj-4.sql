/*
	Team: Kellie Colson & Ghar Pautz
    Assignment: proj-4
    Class: CPSC 321
*/

SET sql_mode = STRICT_ALL_TABLES;

-- ***DROP STATEMENTS***
DROP TABLE Feedback_Survey_User,
           Travel_Survey_User,
		   Survey_Results,
		   Feedback_Survey, 
		   Destinations,
           Travel_Survey, 
           User;

-- ***CREATE TABLE STATEMENTS***

-- create table statement for Destinations table holding information about a travel destination
CREATE TABLE Destinations (
	city VARCHAR(15),
    country VARCHAR(15),
    has_beaches BOOL, 
    has_mountains BOOL, 
    is_modern BOOL, 
    is_historic BOOL,
    is_adventurous BOOL,
    is_family_friendly BOOL, 
    need_travel_companion BOOL, 
    is_relaxing BOOL,
    average_rating FLOAT,
    PRIMARY KEY (city, country)
);

-- create table statement for Travel_Survey table holding information about a travel (destination) survey instance
CREATE TABLE Travel_Survey (
    survey_id INT AUTO_INCREMENT,
    question_number INT,
    user_choice ENUM('0', '1'),
    option1 VARCHAR(15),
    option2 VARCHAR(15),
    PRIMARY KEY (survey_id, question_number)
);

-- create table statement for User table holding information about an application user (account)
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

-- create table statement for Feedback_Survey table holding information about a feedback survey instance
CREATE TABLE Feedback_Survey (
	survey_id INT AUTO_INCREMENT,
    destination_city VARCHAR(15),
    destination_country VARCHAR(15), 
    rating FLOAT,
    review TEXT,
    PRIMARY KEY (survey_id),
    FOREIGN KEY (destination_city, destination_country) REFERENCES Destinations (city, country) ON DELETE CASCADE
);

-- create table statement for Survey_Results table holding information regarding the destination results from taking a travel survey
CREATE TABLE Survey_Results (
    survey_id INT AUTO_INCREMENT,
    question_number INT,
    city VARCHAR(15),
    country VARCHAR(15),
    PRIMARY KEY (survey_id, question_number, city, country),
    FOREIGN KEY (survey_id, question_number) REFERENCES Travel_Survey (survey_id, question_number) ON DELETE CASCADE, 
    FOREIGN KEY (city, country) REFERENCES Destinations(city, country) ON DELETE CASCADE
);

-- create table statement for Travel_Survey_User table holding information matching users to the travel survey(s) they have taken
CREATE TABLE Travel_Survey_User (
    username VARCHAR(15),
    survey_id INT,
    PRIMARY KEY (username, survey_id),
    FOREIGN KEY (username) REFERENCES User (username) ON DELETE CASCADE,
    FOREIGN KEY (survey_id) REFERENCES Travel_Survey(survey_id) ON DELETE CASCADE
);

-- create table statement for Feedback_Survey_User table holding information matching users to the feedback survey(s) they have taken
CREATE TABLE Feedback_Survey_User (
    username VARCHAR(15),
    survey_id INT,
    PRIMARY KEY (username, survey_id),
    FOREIGN KEY (username) REFERENCES User (username) ON DELETE CASCADE,
    FOREIGN KEY (survey_id) REFERENCES Feedback_Survey (survey_id) ON DELETE CASCADE
);


-- ***INSERT STATEMENTS***

-- Destinations(city, country, has_beaches, has_mountains, is_modern, is_historic, is_adventurous, is_family_friendly, need_travel_companion, is_relaxing, rating)
INSERT INTO Destinations VALUES ("Bali", "Indonesia", true, true, true, false, true, true, false, true, 4.0),
								("Kerry", "Ireland", false, true, false, true, true, true, false, false, 4.5),
                                ("Marrakesh", "Morocco", false, false, false, true, false, false, true, true, 4.1),
                                ("Sydney", "Australia", true, false, true, false, true, true, false, true, 4.3),
                                ("Paris", "France", false, false, true, true, false, false, false, false, 3.9);

-- Feedback_Survey(survey_id, destination_city, destination_country, rating, review)                                
INSERT INTO Feedback_Survey VALUES (1, "Paris", "France", 4.5, "Paris had so many sights to see, I wish I had more time to explore the city!"),
								   (2, "Kerry", "Ireland", 4.0, "Kerry was so beautiful!"),
                                   (3, "Sydney", "Australia", 5.0, "Best vacation ever!");