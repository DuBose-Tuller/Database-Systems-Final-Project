// You have to do an 'npm install mysql2' to get the package
// Documentation in: https://www.npmjs.com/package/mysql2

import { createConnection } from 'mysql2';

var connection = createConnection({
	host: 'dubose.dcreate.domains',
	user: 'dubosesc_root',
	password: 'S@n2fM97?~9E^~.',
	database: 'dubosedc_quizbowl'
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

	// With parameters:
	// "... WHERE name = ?", ['Fernanda'], (error ...)
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
	//connection.query("SELECT * FROM qb_match",[], (error, results, fields) => {
		if (error) {
			console.log(error);
			throw error;
		}

		console.log(results)
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
	disconnect
}

// For testing:
// connect()
// queryCallback(r => console.log(r))
// disconnect()