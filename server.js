'use strict';

const express = require('express');
const PORT = process.env.PORT;

const app = express();

app.get('/', function(req, res) {
  res.send('Hello from Docker!');
});

app.listen(PORT, () => {console.log(`Server is up and running on port ${PORT}`)});

