var express = require('express');
var router = express.Router();

const oracledb = require('oracledb');
oracledb.initOracleClient({configDir: '/opt/oracle/instantclient_19_9'});
const dbconfig = {
  user: process.env.NODEORACLEDB_USER || "team9",
  password: process.env.NODEORACLEDB_PASSWORD || "dbteam9",
  connectString: process.env.NODEORACLEDB_CONNECTSTRING || "comp322_team9_phase4_oracle/xe"
}
oracledb.autoCommit = false;
let conn;

// https://blogs.oracle.com/oraclemagazine/keep-your-nodejs-promises
// router.get('/get-test1', function(req, res, next) {
//   // res.send('api router test2');
//   oracledb.getConnection({
//     user: dbconfig.user,
//     password: dbconfig.password,
//     connectString: dbconfig.connectString
//   }).then(function(c) {
//     conn = c;
//     console.log('connected');
    
//     let query = "select table_name, num_rows, avg_row_len, last_analyzed from user_tables";
//     return conn.execute(query, [], {outFormat: oracledb.OBJECT})
//   }).then(query_res => {
//     // console.log('query executed: ', res);
//     console.log('res.rows', query_res.rows);
//     let data = {'data': query_res.rows};
//     res.send(JSON.stringify(data));
//     console.log('response.send');
//   }).catch(err => {
//     console.error(err.message);
//   }).then(() => {
//     if (conn) {
//       return conn.close();
//     }
//   }).then(function() {
//     console.log('Connection closed');
//   })
//   .catch(err => {
//     console.log('Error closing connection', err);
//   });
// });

router.post('/get-test2', function(req, res, next) {
  console.log('get-test2: req: ', req.body);

  oracledb.getConnection({
    user: dbconfig.user,
    password: dbconfig.password,
    connectString: dbconfig.connectString
  }).then(function(c) {
    conn = c;
    console.log('connected');
    
    let query = "select table_name, num_rows, avg_row_len, last_analyzed from user_tables";
    return conn.execute(query, [], {outFormat: oracledb.OBJECT})
  }).then(query_res => {
    // console.log('query executed: ', res);
    console.log('res.rows', query_res.rows);
    let data = {'data': query_res.rows};
    res.send(JSON.stringify(data));
    console.log('response.send');
  }).catch(err => {
    console.error(err.message);
  }).then(() => {
    if (conn) {
      return conn.close();
    }
  }).then(function() {
    console.log('Connection closed');
  })
  .catch(err => {
    console.log('Error closing connection', err);
  });
});

router.post('/get-test2', function(req, res, next) {
  console.log('get-test2: req: ', req.body);

  oracledb.getConnection({
    user: dbconfig.user,
    password: dbconfig.password,
    connectString: dbconfig.connectString
  }).then(function(c) {
    conn = c;
    console.log('connected');
    
    let query = "select table_name, num_rows, avg_row_len, last_analyzed from user_tables";
    return conn.execute(query, [], {outFormat: oracledb.OBJECT})
  }).then(query_res => {
    // console.log('query executed: ', res);
    console.log('res.rows', query_res.rows);
    let data = {'data': query_res.rows};
    res.send(JSON.stringify(data));
    console.log('response.send');
  }).catch(err => {
    console.error(err.message);
  }).then(() => {
    if (conn) {
      return conn.close();
    }
  }).then(function() {
    console.log('Connection closed');
  })
  .catch(err => {
    console.log('Error closing connection', err);
  });
});

module.exports = router;
