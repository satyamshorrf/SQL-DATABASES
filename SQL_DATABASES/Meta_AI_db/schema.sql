CREATE TABLE Users (
  UserID INT PRIMARY KEY,
  Username VARCHAR(255),
  Email VARCHAR(255)
);

CREATE TABLE Conversations (
  ConversationID INT PRIMARY KEY,
  UserID INT,
  StartDate DATETIME,
  EndDate DATETIME,
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Messages (
  MessageID INT PRIMARY KEY,
  ConversationID INT,
  UserID INT,
  MessageText TEXT,
  Timestamp DATETIME,
  FOREIGN KEY (ConversationID) REFERENCES Conversations(ConversationID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE IntentRecognition (
  IntentID INT PRIMARY KEY,
  IntentName VARCHAR(255),
  Pattern VARCHAR(255),
  Context VARCHAR(255)
);

CREATE TABLE Entities (
  EntityID INT PRIMARY KEY,
  EntityName VARCHAR(255),
  EntityType VARCHAR(255),
  Description TEXT
);

CREATE TABLE KnowledgeGraph (
  KnowledgeID INT PRIMARY KEY,
  Topic VARCHAR(255),
  Description TEXT,
  EntityID INT,
  FOREIGN KEY (EntityID) REFERENCES Entities(EntityID)
);

CREATE TABLE Responses (
  ResponseID INT PRIMARY KEY,
  MessageID INT,
  ResponseText TEXT,
  Timestamp DATETIME,
  FOREIGN KEY (MessageID) REFERENCES Messages(MessageID)
);

CREATE TABLE Feedback (
  FeedbackID INT PRIMARY KEY,
  MessageID INT,
  UserID INT,
  Rating INT,
  Comment TEXT,
  FOREIGN KEY (MessageID) REFERENCES Messages(MessageID),
  FOREIGN KEY (UserID) REFERENCES Users(UserID)
);



SELECT 
  u.UserID, 
  u.Username, 
  c.ConversationID, 
  c.StartDate, 
  c.EndDate, 
  m.MessageID, 
  m.MessageText, 
  m.Timestamp, 
  i.IntentName, 
  e.EntityName, 
  e.EntityType, 
  kg.Topic, 
  kg.Description, 
  r.ResponseText, 
  r.Timestamp, 
  f.Rating, 
  f.Comment
FROM 
  Users u
  JOIN Conversations c ON u.UserID = c.UserID
  JOIN Messages m ON c.ConversationID = m.ConversationID
  JOIN IntentRecognition i ON m.MessageText LIKE i.Pattern
  JOIN Entities e ON m.MessageText LIKE CONCAT('%', e.EntityName, '%')
  JOIN KnowledgeGraph kg ON e.EntityID = kg.EntityID
  JOIN Responses r ON m.MessageID = r.MessageID
  JOIN Feedback f ON m.MessageID = f.MessageID
