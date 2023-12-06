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
	player_id		INT NOT NULL AUTO_INCREMENT,
	name				VARCHAR(100) NOT NULL,
	major				VARCHAR(25) CHECK (major IN ('Science', 'History', 'Literature')),
	minor				VARCHAR(25) CHECK (minor IN ('RMP', 'Geography', 'FA', 'Trash')),
	 	
	PRIMARY KEY (player_id)	
);

CREATE TABLE team (
	team_id			INT NOT NULL AUTO_INCREMENT,
	name				VARCHAR(100) NOT NULL,
	school 			VARCHAR(50),

	PRIMARY KEY (team_id)
);

-- Joint relation between player and team
CREATE TABLE playsOn (
	player_id	INT,
	team_id		INT,
	
	FOREIGN KEY (team_id) 
			REFERENCES team(team_id),

	FOREIGN KEY (player_id) 
		REFERENCES player(player_id),

	PRIMARY KEY(player_id, team_id)
);

CREATE TABLE qb_match(
	match_id		INT NOT NULL AUTO_INCREMENT,
	datetime		DATETIME, -- start of match
	winner_id		INT,
	loser_id		INT,
		
	FOREIGN KEY (winner_id) 
		REFERENCES team(team_id),
		
	FOREIGN KEY (loser_id) 
		REFERENCES team(team_id),
		
	PRIMARY KEY (match_id)
);

-- Joint relation between player and match
CREATE TABLE plays (
	player_id			INT NOT NULL,
	match_id			INT NOT NULL,
	num_powers		INT,
	num_tens		INT,
	num_negs		INT,
	num_tossups_heard	INT,
	
	FOREIGN KEY (player_id) 
		REFERENCES player(player_id),
		
	FOREIGN KEY (match_id)
		REFERENCES qb_match(match_id),
		
	PRIMARY KEY (player_id, match_id)
);