SELECT 
	qb_match.match_id, 
	team.team_id,
	player.name, 
	player.player_id, 
	num_powers, 
	num_tens, 
	num_negs,
	(num_powers * 15) + (num_tens * 10) + (num_negs * -5) AS total_pts
FROM 
	plays INNER JOIN qb_match 
				ON plays.match_id = qb_match.match_id
		  INNER JOIN player
				ON plays.player_id = player.player_id
		  INNER JOIN playson
		 		ON playson.player_id = player.player_id
		  INNER JOIN team
				ON team.team_id = playson.team_id
WHERE 
	qb_match.match_id = 1;


-- Get all of the stats for a single team (all players all matches)
SELECT 
	-- team.team_id, 
	player.name,
	AVG(num_powers), 
	AVG(num_tens), 
	AVG(num_negs),
	AVG((num_powers * 15) + (num_tens * 10) + (num_negs * -5)) AS total_pts
FROM 
	plays INNER JOIN qb_match 
				ON plays.match_id = qb_match.match_id
		  INNER JOIN player
				ON plays.player_id = player.player_id
		  INNER JOIN playson
		 		ON playson.player_id = player.player_id
		  INNER JOIN team
				ON team.team_id = playson.team_id
WHERE 
	team.team_id = <team_id>
	
GROUP BY player.name
ORDER BY player.name;