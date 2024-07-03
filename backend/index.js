const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');

const app = express();
app.use(bodyParser.json());

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'johnmatthew300',
  database: 'flutterProject'
});

db.connect((err) => {
  if (err) {
    throw err;
  }
  console.log('MySQL connected...');
});

app.post('/authenticate', (req, res) => {
  const { email, password } = req.body;
  const query = 'SELECT * FROM users WHERE email = ? AND password = ?';
  db.query(query, [email, password], (err, results) => {
    if (err) {
      res.status(500).send(err);
    } else if (results.length > 0) {
      res.status(200).send('Authentication successful');
    } else {
      res.status(401).send('Authentication failed');
    }
  });
});

app.listen(3000, () => {
  console.log('Server started on port 3000');
});
