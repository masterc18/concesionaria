const express = require('express');
const rMain = express.Router();

rMain.get('/', (req, res) => {
    res.render('index');
});

module.exports = rMain;