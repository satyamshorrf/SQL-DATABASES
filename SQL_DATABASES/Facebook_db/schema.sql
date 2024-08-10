CREATE TABLE Users (
  UserID INT PRIMARY KEY,
  Username VARCHAR(255),
  Email VARCHAR(255),
  PasswordHash VARCHAR(255)
);

CREATE TABLE Friends (
  UserID INT,
  FriendID INT,
  PRIMARY KEY (UserID, FriendID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID),
  FOREIGN KEY (FriendID) REFERENCES Users(UserID)
);

CREATE TABLE Posts (
  PostID INT PRIMARY KEY,
  UserID INT,
  Content TEXT,
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

CREATE TABLE Messages (
  MessageID INT PRIMARY KEY,
  SenderID INT,
  ReceiverID INT,
  Content TEXT,
  Timestamp DATETIME,
  FOREIGN KEY (SenderID) REFERENCES Users(UserID),
  FOREIGN KEY (ReceiverID) REFERENCES Users(UserID)
);

