CREATE TABLE Players (
  PlayerID INT PRIMARY KEY,
  Username VARCHAR(255),
  Email VARCHAR(255),
  PasswordHash VARCHAR(255),
  Name VARCHAR(255),
  Country VARCHAR(255)
);

CREATE TABLE Matches (
  MatchID INT PRIMARY KEY,
  MatchDate DATETIME,
  Map VARCHAR(255),
  GameMode VARCHAR(255)
);

CREATE TABLE Teams (
  TeamID INT PRIMARY KEY,
  MatchID INT,
  TeamName VARCHAR(255),
  FOREIGN KEY (MatchID) REFERENCES Matches(MatchID)
);

CREATE TABLE PlayersInMatches (
  PlayerID INT,
  MatchID INT,
  TeamID INT,
  Kills INT,
  Deaths INT,
  Assists INT,
  PRIMARY KEY (PlayerID, MatchID),
  FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID),
  FOREIGN KEY (MatchID) REFERENCES Matches(MatchID),
  FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);

CREATE TABLE Weapons (
  WeaponID INT PRIMARY KEY,
  WeaponName VARCHAR(255),
  Damage INT,
  FireRate DECIMAL(10, 2)
);

CREATE TABLE PlayerWeapons (
  PlayerID INT,
  MatchID INT,
  WeaponID INT,
  Kills INT,
  PRIMARY KEY (PlayerID, MatchID, WeaponID),
  FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID),
  FOREIGN KEY (MatchID) REFERENCES Matches(MatchID),
  FOREIGN KEY (WeaponID) REFERENCES Weapons(WeaponID)
);

CREATE TABLE Vehicles (
  VehicleID INT PRIMARY KEY,
  VehicleName VARCHAR(255),
  Speed DECIMAL(10, 2)
);

CREATE TABLE PlayerVehicles (
  PlayerID INT,
  MatchID INT,
  VehicleID INT,
  DistanceTravelled DECIMAL(10, 2),
  PRIMARY KEY (PlayerID, MatchID, VehicleID),
  FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID),
  FOREIGN KEY (MatchID) REFERENCES Matches(MatchID),
  FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);

CREATE TABLE Rankings (
  RankingID INT PRIMARY KEY,
  PlayerID INT,
  Rank INT,
  Points INT,
  FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID)
);
