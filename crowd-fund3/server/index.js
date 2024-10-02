const EXPRESS = require('express')();
// body parser
const bodyParser = require('body-parser');
EXPRESS.use(bodyParser.urlencoded({ extended: false }));
EXPRESS.use(bodyParser.json())
const api = require('./api');
// import cors http
const cors = require('cors');
EXPRESS.use(cors());

EXPRESS.use('/api', api);

EXPRESS.listen(8090);

console.log('listen at port:8090');