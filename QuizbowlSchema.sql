DROP DATABASE IF EXISTS qb;
CREATE SCHEMA qb;
USE qb;

CREATE TABLE player (
	id		INT NOT NULL AUTO_INCREMENT,
	name				VARCHAR(100) NOT NULL,
	major				VARCHAR(25) CHECK (major IN ('Science', 'History', 'Literature')),
	minor				VARCHAR(25) CHECK (minor IN ('RMP', 'Geography', 'FA', 'Trash')),
	 	
	PRIMARY KEY (id)	
);

CREATE TABLE team (
	id			INT NOT NULL AUTO_INCREMENT,
	name				VARCHAR(100) NOT NULL,
	school 			VARCHAR(50),

	PRIMARY KEY (id)
);

-- Joint relation between player and team
CREATE TABLE playsOn (
	player_id	INT,
	team_id		INT,
	
	FOREIGN KEY (team_id) 
			REFERENCES team(id),

	FOREIGN KEY (player_id) 
		REFERENCES player(id),

	PRIMARY KEY(player_id, team_id)
);

CREATE TABLE qb_match(
	id		INT NOT NULL AUTO_INCREMENT,
	datetime		DATETIME,
	winner_id		INT,
	loser_id		INT,
		
	FOREIGN KEY (winner_id) 
		REFERENCES team(id),
		
	FOREIGN KEY (loser_id) 
		REFERENCES team(id),
		
	PRIMARY KEY (id)
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
		REFERENCES player(id),
		
	FOREIGN KEY (match_id)
		REFERENCES qb_match(id),
		
	PRIMARY KEY (player_id, match_id)
);