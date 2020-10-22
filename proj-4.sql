/*
	Team: Kellie Colson & Ghar Pautz
    Assignment: proj-4
    Class: CPSC 321
*/

SET sql_mode = STRICT_ALL_TABLES;

CREATE TABLE Destinations (
	city VARCHAR(15),
    country VARCHAR(15),
    hasBeaches BOOL, 
    hasMountains BOOL, 
    isModern BOOL, 
    isHistoric BOOL,
    isAdventurous BOOL,
    isFamilyFriendly BOOL, 
    hasTravelCompanion BOOL, 
    isRelaxing BOOL,
    averageRating FLOAT,
    PRIMARY KEY (city, country)
);

CREATE TABLE Destination_Review (
	reviewID INT AUTO_INCREMENT, 
    destination_city VARCHAR(15),
    destination_country VARCHAR(15),
    review TEXT,
    PRIMARY KEY (reviewID)
);

CREATE Travel_Survey (
    survey_id INT,
    question_number INT,
    user_choice ENUM('0', '1'),
    option1 VARCHAR(15),
    option2 VARCHAR(15),
    PRIMARY KEY (survey_id, question_number)
);

CREATE Survey_Results (
    survey_id INT AUTO_INCREMENT,
    question_number INT,
    city VARCHAR(15),
    country VARCHAR(15),
    PRIMARY KEY (survey_id, question_number, city, country)
);

CREATE Travel_Survey_User (
    username VARCHAR(15),
    survey_id INT,
    PRIMARY KEY (username, survey_id)
);

CREATE Feedback_Survey_User (
    username VARCHAR(15),
    survey_id INT AUTO_INCREMENT,
    PRIMARY KEY (username, survey_id)
);




