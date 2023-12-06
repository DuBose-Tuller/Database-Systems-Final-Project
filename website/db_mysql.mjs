// You have to do an 'npm install mysql2' to get the package
// Documentation in: https://www.npmjs.com/package/mysql2

import { createConnection } from 'mysql2';

var connection = createConnection({
	host: 'localhost',
	user: 'root',
	password: '123456',
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

	// With parameters:
	// "... WHERE name = ?", ['Fernanda'], (error ...)
}

function disconnect() {
	connection.end();
}

function testCallback(name, callback) {
	connection.query("SELECT * FROM (player NATURAL JOIN playson) WHERE player.name = ?",[name], (error, results, fields) => {
		if (error) throw error;

		console.log(results)
		callback(results);
	});
}

// Setup exports to include the external variables/functions
export {
	connection,
	connect,
	queryCallback,
	testCallback,
	disconnect
}

// For testing:
// connect()
// queryCallback(r => console.log(r))
// disconnect()