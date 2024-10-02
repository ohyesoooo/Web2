// Introducing mysql Database
const mySql = require('mysql');

// Connect to the mysql database, database info
let mysqlConnect = mySql.createConnection({
    host: 'localhost',
    port: '3306',
    database: 'crowdfunding_db',
    user: 'root',
    password: '123456',
})
mysqlConnect.connect();

const EXPRESS = require('express');
const router = EXPRESS.Router();

// sql statement
const organizerSQL = `select organizer from fundraiser`;
const citySQL = `select city from fundraiser`;
const categorySQL = `select * from category`;
const searchSQL = `select c.name, f.* from category c join fundraiser f on f.category_id = c.category_id where (f.organizer = ? or ? is null) and (f.city = ? or ? is null) and (f.category_id = ? or ? is null) and (f.active = 1)`;
const detailSQL = `select c.name, f.* from category c join fundraiser f on f.category_id = c.category_id where f.fundraiser_id = ?`;

// get fundraiser data
router    // get category
    .get('/getCategory', (request, response) => {
        mysqlConnect.query(categorySQL, function(err, data) {
            response.send(data)
        });
    })
    // get city
    .get('/getCity', (request, response) => {
        mysqlConnect.query(citySQL, function(err, data) {
            response.send(data)
        });
    })
    // get organizer
    .get('/getOrganizer', (request, response) => {
        mysqlConnect.query(organizerSQL, function(err, data) {
            response.send(data)
        });
    })
    .get('/getFundraiser', (request, response) => {
        const query = request.query;
        query.category_id = query.category_id || null;
        query.organizer = query.organizer || null;
        query.city = query.city || null;
        const queryArr = [query.organizer, query.organizer, query.city, query.city, query.category_id, query.category_id];
        mysqlConnect.query(searchSQL, queryArr, function(err, data) {
            response.send(data)
        });
    })
    // get detail
    .get('/getDetail', (request, response) => {
        const query = request.query;
        const queryArr = [query.fundraiser_id];
        mysqlConnect.query(detailSQL, queryArr, function(err, data) {
            const res = data[0];
            response.send(res)
        });
    })



module.exports = router