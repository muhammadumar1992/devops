const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
    res.send('Welcome to Muhammad Umar Demo NodeJS App Page');
});

app.listen(port, () => {
    console.log(`App listening at http://localhost:${port}`);
});
