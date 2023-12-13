SELECT player.username, team.name FROM
	plays INNER JOIN qb_match 
				ON plays.match_id = qb_match.match_id
		  INNER JOIN player
				ON plays.username = player.username
		  INNER JOIN playson
		 		ON playson.username = player.username
		  INNER JOIN team
				ON team.team_id = playson.team_id

WHERE qb_match.match_id = <match_id>;