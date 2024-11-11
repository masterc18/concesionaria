const express = require("express");
const rCliente = express.Router();

rCliente.get("/cliente", (req, res) => {
  res.render("cliente");
});

module.exports = rCliente;
