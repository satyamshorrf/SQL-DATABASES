CREATE TABLE Users (
  UserID INT PRIMARY KEY,
  Username VARCHAR(255),
  Email VARCHAR(255),
  PasswordHash VARCHAR(255),
  ProfilePictureURL VARCHAR(255)
);

CREATE TABLE Posts (
  PostID INT PRIMARY KEY,
  UserID INT,
  ImageURL VARCHAR(255),
  Caption TEXT,
  Timestamp DATETIME,
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Comments (
  CommentID INT PRIMARY KEY,
  PostID INT,
  UserID INT,
  Content TEXT,
  Timestamp DATETIME,
  FOREIGN KEY (PostID) REFERENCES Posts(PostID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Likes (
  LikeID INT PRIMARY KEY,
  PostID INT,
  UserID INT,
  Timestamp DATETIME,
  FOREIGN KEY (PostID) REFERENCES Posts(PostID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Followers (
  FollowerID INT,
  UserID INT,
  PRIMARY KEY (FollowerID, UserID),
  FOREIGN KEY (FollowerID) REFERENCES Users(UserID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Hashtags (
  HashtagID INT PRIMARY KEY,
  Name VARCHAR(255)
);

CREATE TABLE PostHashtags (
  PostID INT,
  HashtagID INT,
  PRIMARY KEY (PostID, HashtagID),
  FOREIGN KEY (PostID) REFERENCES Posts(PostID),
  FOREIGN KEY (HashtagID) REFERENCES Hashtags(HashtagID)
);
