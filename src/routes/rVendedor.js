const express = require('express');
const rVendedor = express.Router();

rVendedor.get('/Vendedor',(req,res)=>{
    res.render('vendedor');
});

module.exports = rVendedor;