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

app.set('view engine', 'ejs');
app.set('views', __dirname + '/views'); // Set the directory where your views (templates) are stored

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
        //response.send(results)
        //response.redirect("/get-match?matchID=" + results.insertId);
    })

 
});

// app.get("/get-players-from-match", function(request, response) {
//     let matchID = request.query["matchID"]

//     db.getPlayersFromMatch(matchID, (results) => {
//       console.log(results)
//       response.json(results);
//     })
// });

app.get("/match", function(request, response) {
    let matchID = request.query["matchID"]

    // Query the database to get info about the match
    db.getPlayersFromMatch(matchID, (results) => {
      response.render('match', {"results": results})
  })

});

app.get("/register", function(request, response) {
    response.sendFile(__dirname + "/templates/register.html")
    console.log("Register Page")
});

app.get("/stats", function(request, response) {
    let playerID = request.query["playerID"];

    db.getPlayerStats(playerID, (results) => {
      response.json(results)
    });

});

app.get("/create-player", function(request, response) {
  let username = request.query["username"]
  let major = request.query["major"]
  let minor = request.query["minor"]

  // Insert player data into player relation
  db.createPlayer(username, major, minor, (results) => {
    response.json(results)   
  })
})

// Calls db.create_team() and then db.insertIntoPlaysOn 
//    for each non-null player entered from the form
app.get("/create-team", function(request, response) {
  let name = request.query["name"]
  let school = request.query["school"]
  let playerUsernames = [
    request.query["P1"],
    request.query["P2"],
    request.query["P3"],
    request.query["P4"],
    request.query["P5"]
  ]

  // Insert team data into team relation
  db.createTeam(name, school, (results) => {
    console.log(results)

    for (var player of playerUsernames) {
      if (player === '') {
        continue;
      } 
      db.insertIntoPlaysOn(player, results["insertId"])
    }

    response.json(results)
  })
})

app.get("/update-player-score", function(request, response) {
  let username = request.query["username"]
  let matchID = request.query["matchID"]
  let numPowersOnTossup = request.query["numPowersOnTossup"]
  let numTensOnTossup = request.query["numTensOnTossup"]
  let numNegsOnTossup = request.query["numNegsOnTossup"]

  db.updatePlayerScore(username, matchID, numPowersOnTossup, numTensOnTossup, numNegsOnTossup)
  response.json(results)
})


app.listen(port, () => console.log('Server is starting on PORT,', port))

process.on('exit', () => {
    db.disconnect()
})

// fetch('https://www.qbreader.org/api/random-tossup')
//   .then(response => {
//     if (!response.ok) {
//       throw new Error('Network response failed');
//     }
//     return response.json();
//   })
//   .then(data => {
//     // Process and use the retrieved data in your application
//     console.log(data);
//   })
//   .catch(error => {
//     console.error('There was a problem with the fetch operation:', error);
//   });