/*
  A SQL script for setting up the schema for the db database.

  Authors:
    Shahin Ahmadi
    Delario Nance, Jr.
    Dubose Tuller

  Date Written:
    December 5, 2023
*/

DROP DATABASE IF EXISTS qb;
CREATE SCHEMA qb;
USE qb;

CREATE TABLE player (
	username		VARCHAR(100),
	major			VARCHAR(25) CHECK (major IN ('Science', 'History', 'Literature')),
	minor			VARCHAR(25) CHECK (minor IN ('RMP', 'Geography', 'FA', 'Trash')),
	 	
	PRIMARY KEY (username)	
);

CREATE TABLE team (
	team_id			INT AUTO_INCREMENT,
	name			VARCHAR(100) NOT NULL,
	school 			VARCHAR(50),

	PRIMARY KEY (team_id)
);

-- Joint relation between player and team
CREATE TABLE playsOn (
	username		VARCHAR(100),
	team_id			INT,
	
	FOREIGN KEY (team_id) 
		REFERENCES team(team_id),

	FOREIGN KEY (username) 
		REFERENCES player(username),

	PRIMARY KEY(username, team_id)
);

CREATE TABLE qb_match(
	match_id		INT AUTO_INCREMENT,
	datetime		DATETIME, -- start of match
	home_id			INT,
	away_id			INT,
		
	FOREIGN KEY (home_id) 
		REFERENCES team(team_id),
		
	FOREIGN KEY (away_id) 
		REFERENCES team(team_id),
		
	PRIMARY KEY (match_id)
);

-- Joint relation between player and match
CREATE TABLE plays (
	username			VARCHAR(100),
	match_id			INT,
	num_powers			INT,
	num_tens			INT,
	num_negs			INT,
	num_tossups_heard	INT,
	
	FOREIGN KEY (username) 
		REFERENCES player(username),
		
	FOREIGN KEY (match_id)
		REFERENCES qb_match(match_id),
		
	PRIMARY KEY (username, match_id)
);