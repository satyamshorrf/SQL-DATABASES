CREATE TABLE Users (
  UserID INT PRIMARY KEY,
  Username VARCHAR(255),
  Email VARCHAR(255),
  PasswordHash VARCHAR(255),
  ProfilePictureURL VARCHAR(255)
);

CREATE TABLE Channels (
  ChannelID INT PRIMARY KEY,
  UserID INT,
  ChannelName VARCHAR(255),
  Description TEXT,
  ProfilePictureURL VARCHAR(255),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Videos (
  VideoID INT PRIMARY KEY,
  ChannelID INT,
  Title VARCHAR(255),
  Description TEXT,
  VideoURL VARCHAR(255),
  ThumbnailURL VARCHAR(255),
  UploadDate DATETIME,
  FOREIGN KEY (ChannelID) REFERENCES Channels(ChannelID)
);

CREATE TABLE Comments (
  CommentID INT PRIMARY KEY,
  VideoID INT,
  UserID INT,
  Content TEXT,
  PostDate DATETIME,
  FOREIGN KEY (VideoID) REFERENCES Videos(VideoID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Likes (
  LikeID INT PRIMARY KEY,
  VideoID INT,
  UserID INT,
  LikeType VARCHAR(10),
  PostDate DATETIME,
  FOREIGN KEY (VideoID) REFERENCES Videos(VideoID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Dislikes (
  DislikeID INT PRIMARY KEY,
  VideoID INT,
  UserID INT,
  PostDate DATETIME,
  FOREIGN KEY (VideoID) REFERENCES Videos(VideoID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Subscriptions (
  SubscriptionID INT PRIMARY KEY,
  ChannelID INT,
  UserID INT,
  SubscribeDate DATETIME,
  FOREIGN KEY (ChannelID) REFERENCES Channels(ChannelID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Playlists (
  PlaylistID INT PRIMARY KEY,
  ChannelID INT,
  PlaylistName VARCHAR(255),
  Description TEXT,
  FOREIGN KEY (ChannelID) REFERENCES Channels(ChannelID)
);

CREATE TABLE PlaylistVideos (
  PlaylistVideoID INT PRIMARY KEY,
  PlaylistID INT,
  VideoID INT,
  AddDate DATETIME,
  FOREIGN KEY (PlaylistID) REFERENCES Playlists(PlaylistID),
  FOREIGN KEY (VideoID) REFERENCES Videos(VideoID)
);

CREATE TABLE VideoTags (
  VideoTagID INT PRIMARY KEY,
  VideoID INT,
  Tag VARCHAR(255),
  FOREIGN KEY (VideoID) REFERENCES Videos(VideoID)
);

CREATE TABLE VideoCategories (
  VideoCategoryID INT PRIMARY KEY,
  VideoID INT,
  Category VARCHAR(255),
  FOREIGN KEY (VideoID) REFERENCES Videos(VideoID)
);
