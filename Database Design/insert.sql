-- Inserting into players
-- Players: Each player has a unique ID (Primary Key), name, position, nationality, date of birth, and contract details.
INSERT INTO players
VALUES
(1, 'David Raya', 'GK', 'Spain', '1995-09-25', 'CONTRACT DETAILS');

INSERT INTO players
VALUES
(2, 'Ben White', 'LB', 'England', '2997-10-08', 'CONTRACT DETAILS'),
(3, 'William Saliba', 'CB', 'France', '2001-03-24', 'CONTRACT DETAILS'),
(4, 'Gabriel Magalhães', 'CB', 'Brazil', '1997-12-19', 'CONTRACT DETAILS'),
(5, 'Riccardo Calafiori', 'RB', 'Italy', '2002-03-19', 'CONTRACT DETAILS'),
(6, 'Jorginho', 'DM', 'Italy', '1991-12-20', 'CONTRACT DETAILS'),
(7, 'Declan Rice','AM', 'England', '1999-01-14', 'CONTRACT DETAILS'),
(8, 'Martin Ødegaard', 'AM', 'Norway', '1998-12-17', 'CONTRACT DETAILS'),
(9, 'Bukayo Saka', 'RW', 'England', '2001-10-5', 'CONTRACT DETAILS'),
(10, 'Gabriel Jesus', 'CF', 'Brazil', '1997-04-03', 'CONTRACT DETAILS'),
(11, 'Kai Havertz', 'CF', 'Germany', '1999-06-11', 'CONTRACT DETAILS');

-- Inserting into staffs
-- Staff: Each staff member has a unique ID (Primary Key), name, role, and contract details.
INSERT INTO staffs
VALUES
(1, 'Mikel Arteta', 'Manager', 'CONTRACT DETAILS');

-- Inserting into matches
INSERT INTO matches
VALUES
(1, '2024-01-01', 'Opponent A', 'Home', 'Premier League', 'Win');

-- Insert into Goals
INSERT INTO Goals (GoalID, PlayerID, MatchID, TimeOfGoal, IsPenalty)
VALUES (1, 1, 1, '12:34:00', FALSE);

-- Insert into Assists
INSERT INTO Assists (AssistID, PlayerID, MatchID, TimeOfAssist)
VALUES (1, 1, 1, '12:34:00');

-- Insert into Injuries
INSERT INTO Injuries (InjuryID, PlayerID, TypeOfInjury, ExpectedRecoveryTime, MatchesMissed)
VALUES (1, 1, 'Hamstring', 30, 'MatchID1, MatchID2');

-- Insert into Participations
INSERT INTO Participations (PlayerID, MatchID)
VALUES (1, 1);
