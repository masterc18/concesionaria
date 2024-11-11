const path = require('path');
const env = require('dotenv');
const { join } = path;
const express = require('express');
const rMain = require('./src/routes/rMain');
const app = express();
env.config();

// middlewares
app.use("/static",express.static(join(__dirname, './public')));
app.use(express.json());

// configuraciones
app.set('view engine', 'ejs');
app.set('views', 'src/views');

// rutas
app.use('/', rMain);

const port = process.env.PORT || 3000;

app.listen(port)
console.log(`Servidor corriendo en el puerto ${port}`);