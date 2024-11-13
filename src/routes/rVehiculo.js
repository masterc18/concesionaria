const express = require("express");
const rVehiculo = express.Router();

rVehiculo.get("/vehiculos", (req, res) => {
  res.render("vehiculos");
});

module.exports = rVehiculo;
