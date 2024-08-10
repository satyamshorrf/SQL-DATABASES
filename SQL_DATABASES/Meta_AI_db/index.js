const mysql = require("mysql2");
const express = require("express");
const app = express();
const path = require("path");
const methodOverride = require("method-override");

app.use(methodOverride("_method"));
app.use(express.urlencoded({ extended: true }));
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "/views"));

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  database: "Meta_AI_db",
  password: "root",
});



// Home Route
app.get("/", (req, res) => {
  let q = `SELECT count(*) AS count FROM users`;
  try {
    connection.query(q, (err, result) => {
      if (err) throw err;
      let count = result[0].count;
      res.render("home.ejs", { count });
    });
  } catch (err) {
    console.log(err);
    res.send("some error in DB");
  }
});

// Users Route
app.get("/users", (req, res) => {
  let q = `SELECT * FROM users`;

  try {
    connection.query(q, (err, users) => {
      if (err) throw err;
      res.render("show.ejs", { users });
    });
  } catch (err) {
    console.log(err);
    res.send("some error in DB");
  }
});



// Responses Route
app.get("/responses", (req, res) => {
  let q = `SELECT * FROM responses`;

  try {
    connection.query(q, (err, users) => {
      if (err) throw err;
      res.render("responses.ejs", { users });
    });
  } catch (err) {
    console.log(err);
    res.send("some error in DB");
  }
});


// Messages Route
app.get("/messages", (req, res) => {
  let q = `SELECT * FROM messages`;

  try {
    connection.query(q, (err, users) => {
      if (err) throw err;
      res.render("messages.ejs", { users });
    });
  } catch (err) {
    console.log(err);
    res.send("some error in DB");
  }
});


// Knowledgegraph Route
app.get("/knowledgegraph", (req, res) => {
  let q = `SELECT * FROM knowledgegraph`;

  try {
    connection.query(q, (err, users) => {
      if (err) throw err;
      res.render("knowledgegraph.ejs", { users });
    });
  } catch (err) {
    console.log(err);
    res.send("some error in DB");
  }
});


// Intentrecognition Route
app.get("/intentrecognition", (req, res) => {
  let q = `SELECT * FROM intentrecognition`;

  try {
    connection.query(q, (err, users) => {
      if (err) throw err;
      res.render("intentrecognition.ejs", { users });
    });
  } catch (err) {
    console.log(err);
    res.send("some error in DB");
  }
});


// Feedback Route
app.get("/feedback", (req, res) => {
  let q = `SELECT * FROM feedback`;

  try {
    connection.query(q, (err, users) => {
      if (err) throw err;
      res.render("feedback.ejs", { users });
    });
  } catch (err) {
    console.log(err);
    res.send("some error in DB");
  }
});

// Entities Route
app.get("/entities", (req, res) => {
  let q = `SELECT * FROM entities`;

  try {
    connection.query(q, (err, users) => {
      if (err) throw err;
      res.render("entities.ejs", { users });
    });
  } catch (err) {
    console.log(err);
    res.send("some error in DB");
  }
});

// Conversations Route
app.get("/conversations", (req, res) => {
  let q = `SELECT * FROM conversations`;

  try {
    connection.query(q, (err, users) => {
      if (err) throw err;
      res.render("conversations.ejs", { users });
    });
  } catch (err) {
    console.log(err);
    res.send("some error in DB");
  }
});

// All Route
app.get("/all", (req, res) => {
  let q = `SELECT * FROM  all`;

  connection.query(q, (err, rows) => {
    if (err) {
      console.log(err);
      res.status(500).send("Error fetching data from DB");
    } else {
      res.render("all.ejs", { users: rows });
    }
  });
});


















































app.listen(8080, () => {
  console.log("Listening to port : 8080");
});