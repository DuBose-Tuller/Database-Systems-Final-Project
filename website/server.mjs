// This is a framework to handle server-side content

// You have to do an 'npm install express' to get the package
// Documentation in: https://expressjs.com/en/starter/hello-world.html
import express from 'express';

import * as db from "./db_mysql.mjs";
import { redirect } from 'express/lib/response';

var app = express();
let port = 3001

db.connect();

// Serve static HTML files in the chosen directory
// Change the filepath if the index.html is moved
app.use(express.static('./templates/'))

// For GET requests to "/player?name=<name>"
app.get('/player', function(request, response){
    let name = request.query["name"]

    db.getAllPlayersByName(name, (results) => {
        response.json(results)
    })
});

app.get('/create-match', function(request, response){
    let homeID = request.query["homeID"]
    let awayID = request.query["awayID"]

    db.createNewMatch(homeID, awayID, (results) => {
        response.json(results)
    })
});

app.listen(port, () => console.log('Server is starting on PORT,', port))

process.on('exit', () => {
    db.disconnect()
})