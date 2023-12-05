DROP DATABASE IF EXISTS qb;
CREATE SCHEMA qb;
USE qb;

CREATE TABLE player (
	player_id		INT NOT NULL AUTO_INCREMENT,
	name		VARCHAR(100) NOT NULL,
	major		VARCHAR(25) CHECK (major IN ('Science', 'History', 'Literature'))
	minor		VARCHAR(25) CHECK (minor IN ('RMP', 'Geography', 'FA', 'Trash'))
	 	
	PRIMARY KEY (player_id)	
);

CREATE TABLE team (
	team_id,
	name
);

CREATE TABLE playsOn (
	player_id,
	team_id,
	
FOREIGN KEY (team_id) 
		REFERENCES team(team_id)
		ON DELETE SET NULL,

	FOREIGN KEY (player_id) 
		REFERENCES player(player_id)
		ON DELETE SET NULL,
)

CREATE TABLE qb_match(
	match_id		INT NOT NULL AUTO_INCREMENT,
	datetime		DATETIME,
	winner_id		INT,
	loser_id		INT,
		
	FOREIGN KEY (winner_id) 
		REFERENCES team(team)
		ON DELETE SET NULL,
		
	FOREIGN KEY (loser_id) 
		REFERENCES team(id)
		ON DELETE SET NULL,
		
	PRIMARY KEY (match_id)
);


CREATE TABLE plays (
	player_id			INT NOT NULL,
	match_id			INT NOT NULL,
	
	is_winner			VARCHAR(1) NOT NULL,
	aces				INT,
	double_faults		INT,
	first_in			INT,
	first_won			INT,
	second_won			INT,
	service_games		INT,
	breakpoints_saved	INT,
	breakpoints_faced	INT,
	player_rank			INT CHECK(player_rank > 0), 	
	rank_points			INT CHECK(rank_points >= 0),
	
	FOREIGN KEY (player_id) 
		REFERENCES player(player_id),
		
	FOREIGN KEY (match_id)
		REFERENCES qb_match(match_id),
		
	PRIMARY KEY (player_id, match_id)
);