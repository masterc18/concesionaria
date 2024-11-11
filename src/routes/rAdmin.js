const express = require('express');
const rAdmin = express.Router();

rAdmin.get('/admin',(req,res)=>{
    res.render('admin')
})