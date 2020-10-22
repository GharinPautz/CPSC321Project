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
	reviewID , 
    destination, 
    review,
    PRIMARY KEY (reviewID)
);


