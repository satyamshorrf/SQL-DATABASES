CREATE TABLE Users (
  UserID INT PRIMARY KEY,
  PhoneNumber VARCHAR(20),
  Username VARCHAR(255),
  PasswordHash VARCHAR(255),
  ProfilePictureURL VARCHAR(255)
);

CREATE TABLE Contacts (
  ContactID INT PRIMARY KEY,
  UserID INT,
  ContactPhoneNumber VARCHAR(20),
  ContactName VARCHAR(255),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Messages (
  MessageID INT PRIMARY KEY,
  FromUserID INT,
  ToUserID INT,
  Content TEXT,
  Timestamp DATETIME,
  FOREIGN KEY (FromUserID) REFERENCES Users(UserID),
  FOREIGN KEY (ToUserID) REFERENCES Users(UserID)
);

CREATE TABLE GroupChats (
  GroupChatID INT PRIMARY KEY,
  Name VARCHAR(255),
  Description TEXT
);

CREATE TABLE GroupChatMembers (
  GroupChatID INT,
  UserID INT,
  PRIMARY KEY (GroupChatID, UserID),
  FOREIGN KEY (GroupChatID) REFERENCES GroupChats(GroupChatID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE GroupChatMessages (
  MessageID INT PRIMARY KEY,
  GroupChatID INT,
  FromUserID INT,
  Content TEXT,
  Timestamp DATETIME,
  FOREIGN KEY (GroupChatID) REFERENCES GroupChats(GroupChatID),
  FOREIGN KEY (FromUserID) REFERENCES Users(UserID)
);

CREATE TABLE Media (
  MediaID INT PRIMARY KEY,
  MessageID INT,
  Type VARCHAR(10),
  URL VARCHAR(255),
  FOREIGN KEY (MessageID) REFERENCES Messages(MessageID)
);

CREATE TABLE Status (
  StatusID INT PRIMARY KEY,
  UserID INT,
  Content TEXT,
  Timestamp DATETIME,
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
