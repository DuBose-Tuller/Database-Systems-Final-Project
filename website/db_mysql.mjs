// You have to do an 'npm install mysql2' to get the package
// Documentation in: https://www.npmjs.com/package/mysql2

import { createConnection } from 'mysql2';
import fs from "fs"

var connection = createConnection({
	host: 'localhost',
	user: 'root',
	password: 'DolphinsFor4994',
	database: 'qb'
});


function connect() {
	connection.connect();
}

function queryCallback(callback) {
	connection.query("SELECT * FROM Student", (error, results, fields) => {
		if (error) throw error;

		console.log(results)
		callback(results);
	});
}

function disconnect() {
	connection.end();
}

function getAllPlayersByName(name, callback) {
	connection.query("SELECT * FROM (player NATURAL JOIN playson) WHERE player.name = ?",[name], (error, results, fields) => {
		if (error) throw error;

		console.log(results)
		callback(results);
	});
}

function createNewMatch(homeID, awayID, callback) {
	connection.query("INSERT INTO qb_match VALUES (0, ?,?,?)",[new Date().toISOString().slice(0, 19).replace('T', ' '), homeID, awayID], (error, results, fields) => {
		if (error) {
			console.log(error);
			throw error;
		}

		callback(results);
	});
}

function getMatchInfoByID(matchID, callback) {
	connection.query("SELECT * FROM qb_match WHERE match_id = ?", [matchID] , (error, results, fields) => {
		if (error) {
			console.log(error);
			throw error;
		}

		console.log(results)
		callback(results);
	});
}

// Inserts a new player into database
function createPlayer(username, major, minor, callback) {
	connection.query("INSERT INTO player VALUES (?, ?, ?)", [username, major, minor], (error, results, fields) => {
		if (error) {
			console.log(error);
			throw error;
		}

		console.log(results)
		callback(results);
	});
};

// Inserts a new team into database
function createTeam(name, school, callback) {
	connection.query("INSERT INTO team VALUES (0, ?, ?)", [name, school], (error, results, fields) => {
		if (error) {
			console.log(error);
			throw error;
		}

		console.log(results)
		callback(results);
	});
};

// Assigns a player to a team
function insertIntoPlaysOn(playerUsername, teamID) {
	connection.query("INSERT INTO playsOn VALUES (?, ?)", [playerUsername, teamID])
};

function initializePlayerScore(username, matchID) {
	connection.query("INSERT INTO plays VALUES (?, ?, 0, 0, 0, 0)", [username, matchID])
};

function updatePlayerScore(numPowersOnTossup, numTensOnTossup, numNegsOnTossup, username, matchID, callback) {
	connection.query("UPDATE plays SET num_powers = num_powers + ?, num_tens = num_tens = ?, num_negs = num_negs + ?, num_tossups_heard = num_tossups_heard + 1 WHERE username = ? AND match_id = ?",
	[numPowersOnTossup, numTensOnTossup, numNegsOnTossup, username, matchID],
	(error, results, fields) => {
		if (error) {
			console.log(error);
			throw error;
		}

		console.log(results.affectedRows)
		console.log(results)
		callback(results);
	})
}

function getPlayerStats(playerID, callback) {
	// Read the SQL file
	let sqlQueries = fs.readFileSync('../tests/PlayerStats.sql', 'utf8');

	// Split the file content by semicolon to get individual queries
	let queriesArray = sqlQueries.split(';');
	let query = queriesArray[2].replace("<username>", "?")
	connection.query(query,[playerID], (error, results, fields) => {
		if (error) throw error;
		callback(results);
	});
}

function getPlayersFromMatch(matchID, callback) {
	// Read the SQL file
	let sqlString = fs.readFileSync('../queries/getPlayerAndTeamNamesFromMatchID.sql', 'utf8');

	let query = sqlString.replace("<match_id>", "?")
	connection.query(query,[matchID], (error, results, fields) => {
		if (error) throw error;
		callback(results);
	});
}


// Setup exports to include the external variables/functions
export {
	connection,
	connect,
	queryCallback,
	getAllPlayersByName,
	createNewMatch,
	getPlayerStats,
	createPlayer,
	createTeam,
	insertIntoPlaysOn,
	initializePlayerScore,
	updatePlayerScore,
	getMatchInfoByID,
	getPlayersFromMatch,
	disconnect
}

// For testing:
// connect()
// queryCallback(r => console.log(r))
// disconnect()