require('dotenv').config();
//require('./src/config/database');
const App = require('./http-server.js');
const router = require('./src/routes');
const port = process.argv.slice(2)[0];
const app = new App(router, port);

const server = app.listen();
console.log('hola 5')
exports.server = server;
