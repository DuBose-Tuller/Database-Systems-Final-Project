// This is a framework to handle server-side content

// You have to do an 'npm install express' to get the package
// Documentation in: https://expressjs.com/en/starter/hello-world.html
import express, { response } from 'express';
import { fileURLToPath } from 'url';
import {dirname} from 'path';

import * as db from "./db_mysql.mjs";

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

var app = express();
let port = 3001

db.connect();

// Serve static HTML files in the chosen directory
// Change the filepath if the index.html is moved
app.use(express.static('./templates/'))

app.get("/", (request, response) => {
    response.sendFile(__dirname + "/templates/index.html")
});

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

    // Redirect to /match/<results.insertId>
    response.redirect("/match/") // doesn't work
});

app.get("/match", function(request, response) {
    let matchID = request.query["matchID"]
    response.sendFile(__dirname + "/templates/match.html")

    console.log(matchID)
});

app.get("/register", function(request, response) {
    response.sendFile(__dirname + "/templates/register.html")
    console.log("Register Page")
});

app.get("/stats", function(request, response) {
    let teamID = request.query["teamID"];

    db.getTeamStats(teamID, (results) => {
      response.json(results)
    });

});

// Calls db.create_team() and then db.insertIntoPlaysOn 
//    for each non-null player entered from the form
app.get("/create-team");

app.listen(port, () => console.log('Server is starting on PORT,', port))

process.on('exit', () => {
    db.disconnect()
})

fetch('https://www.qbreader.org/api/random-tossup')
  .then(response => {
    if (!response.ok) {
      throw new Error('Network response failed');
    }
    return response.json();
  })
  .then(data => {
    // Process and use the retrieved data in your application
    console.log(data);
  })
  .catch(error => {
    console.error('There was a problem with the fetch operation:', error);
  });