/*
Entities and Attributes
    Players: Each player has a unique ID (Primary Key), name, position, nationality, date of birth, and contract details.
    Staff: Each staff member has a unique ID (Primary Key), name, role, and contract details.
    Matches: Each match has a unique ID (Primary Key), date, opponent, venue, competition, and result.
    Goals: Each goal has a unique ID (Primary Key), player ID (Foreign Key referencing Players), match ID (Foreign Key referencing Matches), time of the goal, and a flag indicating if it was a penalty.
    Assists: Each assist has a unique ID (Primary Key), player ID (Foreign Key referencing Players), match ID (Foreign Key referencing Matches), and time of the assist.
    Injuries: Each injury record has a unique ID (Primary Key), player ID (Foreign Key referencing Players), type of injury, expected recovery time, and the matches missed due to the injury.

Relationships
    1. Players-Matches: A many-to-many relationship as a player can participate in many matches, and a match involves many players. 
                        This relationship can be represented by a junction table, such as “Participations”, with Player ID and Match ID as foreign keys.
    2. Players-Goals: A one-to-many relationship as a player can score multiple goals, but each goal is scored by one player.
    3. Players-Assists: A one-to-many relationship as a player can make multiple assists, but each assist is made by one player.
    4. Players-Injuries: A one-to-many relationship as a player can have multiple injuries, but each injury is associated with one player.
    5. Matches-Goals: A one-to-many relationship as a match can have multiple goals, but each goal is scored in one match.
    6. Matches-Assists: A one-to-many relationship as a match can have multiple assists, but each assist is made in one match.
*/
CREATE TABLE players(
    PlayerId INTEGER PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(50),
    Nationality VARCHAR(100),
    DateOfBirth DATE,
    ContractDetails TEXT
);

CREATE TABLE staffs(
    StafId INTEGER PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(80),
    ContractDetails TEXT
);

CREATE TABLE matches(
    MatchId INTEGER PRIMARY KEY,
    Date DATE,
    Opponent VARCHAR(100),
    Venue VARCHAR(80),
    Competition VARCHAR(100),
    Result VARCHAR(50)
);

CREATE TABLE goals(
    GoalId INTEGER PRIMARY KEY,
    PlayerId INTEGER,
    MatchId INTEGER,
    TimeOfGoal TIME,
    IsPenalty BOOLEAN,
    FOREIGN KEY (PlayerId) REFERENCES players(PlayerId),
    FOREIGN KEY (MatchId) REFERENCES matches(MatchId)
);

CREATE TABLE assists(
    AssistId INTEGER PRIMARY KEY,
    PlayerId INTEGER,
    MatchId INTEGER,
    TimeOfAssist TIME,
    FOREIGN KEY (PlayerId) REFERENCES players(PlayerId),
    FOREIGN KEY (MatchId) REFERENCES matches(MatchId)
);

CREATE TABLE injuries (
    InjuryId INTEGER PRIMARY KEY,
    PlayerId INTEGER,
    TypeOfInjury VARCHAR(50),
    ExpectedRecoveryTime VARCHAR(50),
    MatchesMissed INTEGER,
    FOREIGN KEY (PlayerID) REFERENCES players(PlayerID)
);

-- Participations table (junction table for Players-Matches many-to-many relationship)
CREATE TABLE Participations (
    PlayerID INT,
    MatchID INT,
    PRIMARY KEY (PlayerID, MatchID),
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID),
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID)
);