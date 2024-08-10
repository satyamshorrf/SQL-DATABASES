
CREATE TABLE Users (
  UserID INT PRIMARY KEY,
  Username VARCHAR(255),
  Email VARCHAR(255),
  PasswordHash VARCHAR(255),
  ProfilePictureURL VARCHAR(255)
);

CREATE TABLE Tweets (
  TweetID INT PRIMARY KEY,
  UserID INT,
  Content TEXT,
  Timestamp DATETIME,
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Hashtags (
  HashtagID INT PRIMARY KEY,
  Name VARCHAR(255)
);

CREATE TABLE TweetHashtags (
  TweetID INT,
  HashtagID INT,
  PRIMARY KEY (TweetID, HashtagID),
  FOREIGN KEY (TweetID) REFERENCES Tweets(TweetID),
  FOREIGN KEY (HashtagID) REFERENCES Hashtags(HashtagID)
);

CREATE TABLE Mentions (
  MentionID INT PRIMARY KEY,
  TweetID INT,
  MentionedUserID INT,
  FOREIGN KEY (TweetID) REFERENCES Tweets(TweetID),
  FOREIGN KEY (MentionedUserID) REFERENCES Users(UserID)
);

CREATE TABLE Replies (
  ReplyID INT PRIMARY KEY,
  TweetID INT,
  ReplyContent TEXT,
  Timestamp DATETIME,
  FOREIGN KEY (TweetID) REFERENCES Tweets(TweetID)
);

CREATE TABLE Likes (
  LikeID INT PRIMARY KEY,
  TweetID INT,
  UserID INT,
  Timestamp DATETIME,
  FOREIGN KEY (TweetID) REFERENCES Tweets(TweetID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Retweets (
  RetweetID INT PRIMARY KEY,
  TweetID INT,
  UserID INT,
  Timestamp DATETIME,
  FOREIGN KEY (TweetID) REFERENCES Tweets(TweetID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Followers (
  FollowerID INT,
  UserID INT,
  PRIMARY KEY (FollowerID, UserID),
  FOREIGN KEY (FollowerID) REFERENCES Users(UserID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
