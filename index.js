const express = require('express');

const app = express();

app.get('/', (req, res) => {
  res.send('Hi, there');
});

app.listen(1000, () => {
  console.log('Listening on port 1000');
});