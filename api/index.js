const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql2');

const app = express();
app.use(bodyParser.urlencoded({ extended: true }));

const db = mysql.createConnection({
  host: '192.168.33.12',
  user: 'webuser',
  password: 'webpass',
  database: 'study'
});

db.connect((err) => {
  if (err) {
    console.error('Could not connect to database:', err);
    return;
  }
  console.log('MySQL connected');
});

app.post('/submit', (req, res) => {
  const { name, email } = req.body;

  if (!name || !email) {
    res.status(400).send('Missing fields');
    return;
  }

  const query = 'INSERT INTO submissions (name, email) VALUES (?, ?)';
  db.query(query, [name, email], (err, result) => {
    if (err) {
      console.error('Insert error:', err);
      res.status(500).send('DB error');
      return;
    }

    console.log(`Saved: ${name}, ${email}`);
    res.send('Submitted!');
  });
});

app.listen(5000, () => {
  console.log('Listening on port 5000');
});
