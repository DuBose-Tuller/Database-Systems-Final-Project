/*
  A SQL script for inserting test data into the db database.

  Authors:
    Shahin Ahmadi
    Delario Nance, Jr.
    Dubose Tuller

  Date Written:
    December 6, 2023
*/

-- Create Team 1 and players
INSERT INTO team VALUES (0, "Highlanders", "Heathwood");
INSERT INTO player VALUES ("DuBose", "Science", "Trash");
INSERT INTO player VALUES ("Delario", "Science", "FA");
INSERT INTO player VALUES ("Shahin", "Science", "RMP");
INSERT INTO player VALUES ("Tom", "Literature", "FA");
INSERT INTO player VALUES ("Caroline", "History", "Geography");

-- Assign the players to Team 1
INSERT INTO playson VALUES ("DuBose", 1);
INSERT INTO playson VALUES ("Delario", 1);
INSERT INTO playson VALUES ("Shahin", 1);
INSERT INTO playson VALUES ("Tom", 1);
INSERT INTO playson VALUES ("Caroline", 1);


-- Create Team 2 and players
INSERT INTO team VALUES (0, "Wildcats", "Davidson");
INSERT INTO player VALUES ("Bob", "History", "RMP");
INSERT INTO player VALUES ("Alice", "Literature", "Trash");
INSERT INTO player VALUES ("John", "Science", "Geography");
INSERT INTO player VALUES ("Joshua", "History", "Trash");

-- Assign the players to Team 2
INSERT INTO playson VALUES ("Bob", 2);
INSERT INTO playson VALUES ("Alice", 2);
INSERT INTO playson VALUES ("John", 2);
INSERT INTO playson VALUES ("Joshua", 2);


-- Create Match 1 info. and player statistics
INSERT INTO qb_match VALUES (0, '2023-12-06 14:16:39', 1, 2);
INSERT INTO plays VALUES ("DuBose", 1, 2, 1, 1, 20);
INSERT INTO plays VALUES ("Delario", 1, 0, 0, 1, 20);
INSERT INTO plays VALUES ("Shahin", 1, 0, 0, 1, 20);
INSERT INTO plays VALUES ("Tom", 1, 0, 0, 1, 20);
INSERT INTO plays VALUES ("Caroline", 1, 1, 0, 0, 20);
INSERT INTO plays VALUES ("Bob", 1, 0, 2, 1, 20);
INSERT INTO plays VALUES ("Alice", 1, 0, 0, 0, 20);
INSERT INTO plays VALUES ("John", 1, 0, 0, 1, 20);
INSERT INTO plays VALUES ("Joshua", 1, 0, 1, 0, 20);


-- Create Match 2 info. and player statistics
INSERT INTO qb_match VALUES (0, '2023-12-13 08:11:58', 2, 1);
INSERT INTO plays VALUES ("DuBose", 2, 0, 0, 1, 20);
INSERT INTO plays VALUES ("Delario", 2, 1, 0, 0, 20);
INSERT INTO plays VALUES ("Shahin", 2, 0, 0, 1, 20);
INSERT INTO plays VALUES ("Tom", 2, 0, 0, 1, 20);
INSERT INTO plays VALUES ("Caroline", 2, 0, 0, 1, 20);
INSERT INTO plays VALUES ("Bob", 2, 0, 2, 0, 20);
INSERT INTO plays VALUES ("Alice", 2, 0, 0, 0, 20);
INSERT INTO plays VALUES ("John", 2, 0, 0, 1, 20);
INSERT INTO plays VALUES ("Joshua", 2, 0, 1, 0, 20);