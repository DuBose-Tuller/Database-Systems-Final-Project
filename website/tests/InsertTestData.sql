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
INSERT INTO player VALUES (0, "DuBose", "Science", "Trash");
INSERT INTO player VALUES (0, "Delario", "Science", "FA");
INSERT INTO player VALUES (0, "Shahin", "Science", "RMP");
INSERT INTO player VALUES (0, "Tom", "Literature", "FA");
INSERT INTO player VALUES (0, "Caroline", "History", "Geography");

-- Assign the players to Team 1
INSERT INTO playson VALUES (1, 1);
INSERT INTO playson VALUES (2, 1);
INSERT INTO playson VALUES (3, 1);
INSERT INTO playson VALUES (4, 1);
INSERT INTO playson VALUES (5, 1);


-- Create Team 2 and players
INSERT INTO team VALUES (0, "Wildcats", "Davidson");
INSERT INTO player VALUES (0, "Bob", "History", "RMP");
INSERT INTO player VALUES (0, "Alice", "Literature", "Trash");
INSERT INTO player VALUES (0, "John", "Science", "Geography");
INSERT INTO player VALUES (0, "Joshua", "History", "Trash");

-- Assign the players to Team 2
INSERT INTO playson VALUES (6, 2);
INSERT INTO playson VALUES (7, 2);
INSERT INTO playson VALUES (8, 2);
INSERT INTO playson VALUES (9, 2);


-- Create Match 1 info. and player statistics
INSERT INTO qb_match VALUES (0, '2023-12-06 14:16:39', 1, 2);
INSERT INTO plays VALUES (1, 1, 2, 1, 1, 20);
INSERT INTO plays VALUES (2, 1, 0, 0, 1, 20);
INSERT INTO plays VALUES (3, 1, 0, 0, 1, 20);
INSERT INTO plays VALUES (4, 1, 0, 0, 1, 20);
INSERT INTO plays VALUES (5, 1, 1, 0, 0, 20);
INSERT INTO plays VALUES (6, 1, 0, 2, 1, 20);
INSERT INTO plays VALUES (7, 1, 0, 0, 0, 20);
INSERT INTO plays VALUES (8, 1, 0, 0, 1, 20);
INSERT INTO plays VALUES (9, 1, 0, 1, 0, 20);


-- Create Match 2 info. and player statistics
INSERT INTO qb_match VALUES (0, '2023-12-13 08:11:58', 2, 1);
INSERT INTO plays VALUES (1, 2, 0, 0, 1, 20);
INSERT INTO plays VALUES (2, 2, 1, 0, 0, 20);
INSERT INTO plays VALUES (3, 2, 0, 0, 1, 20);
INSERT INTO plays VALUES (4, 2, 0, 0, 1, 20);
INSERT INTO plays VALUES (5, 2, 0, 0, 1, 20);
INSERT INTO plays VALUES (6, 2, 0, 2, 0, 20);
INSERT INTO plays VALUES (7, 1, 0, 0, 0, 20);
INSERT INTO plays VALUES (8, 2, 0, 0, 1, 20);
INSERT INTO plays VALUES (9, 2, 0, 1, 0, 20);
INSERT INTO plays VALUES (10, 2, 2, 1, 1, 20);