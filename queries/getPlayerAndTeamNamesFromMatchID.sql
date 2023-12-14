SELECT 
	qb_match.match_id, 
	playson.username, 
	team.name 
FROM 
	qb_match 
	INNER JOIN team
		ON team.team_id = qb_match.home_id OR team.team_id = qb_match.away_id 
	INNER JOIN playson
		ON team.team_id = playson.team_id 			
WHERE qb_match.match_id = <match_id> 
ORDER BY team.name DESC;