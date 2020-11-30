var express = require('express');
var router = express.Router();

const oracledb = require('oracledb');
oracledb.fetchAsString = [ oracledb.DATE, oracledb.NUMBER ];
oracledb.initOracleClient({configDir: '/opt/oracle/instantclient_19_9'});
const dbconfig = {
  user: process.env.NODEORACLEDB_USER || "team9",
  password: process.env.NODEORACLEDB_PASSWORD || "dbteam9",
  connectString: process.env.NODEORACLEDB_CONNECTSTRING || "comp322_team9_phase4_oracle/xe"
}
oracledb.autoCommit = false;
let conn;

let account = ["account_id", "account_pw", "account_name", "account_bday", "account_sex", "account_address", "account_phone", "account_identity", "account_job", "account_membership"];


// https://blogs.oracle.com/oraclemagazine/keep-your-nodejs-promises
router.post('/sign-up', function(req, res) {
  oracledb.getConnection({
    user: dbconfig.user,
    password: dbconfig.password,
    connectString: dbconfig.connectString
  }).then(function(c) {
    conn = c;
    console.log('sign-up: req: ', req.body);

    var data = {};
    for (let key of account.values()) {
      console.log('sign-up: req: key: ', key, typeof key, ' / val: ', req.body[key], typeof req.body[key]);
      if (key == "account_bday") {
        data[key] = "to_date('" + req.body[key] + "', 'yyyy-mm-dd')";
      } else if (key == "account_sex") {
        data[key] = "'" + req.body[key] + "'";
      } else if (key == "account_phone") {
        data[key] = "'" + req.body[key] + "'";
      } else if (key == "account_address" || key == "account_job") {
        if (req.body[key] == undefined ) {
          console.log('here');
          data[key] = "'null'";
        } else {
          data[key] = "'" + req.body[key] + "'";
        }
      } else if (key == "account_identity") {
        data[key] = "'customer'";
      } else if (key == "account_membership") {
        data[key] = "'Basic'";
      } else {
        data[key] = "'" + req.body[key] + "'";
      }
    }

    // console.log("sign-up: data: ", data);
    let joined_keys = Object.keys(data).join(', ');
    let joined_values = Object.values(data).join(', ');
    // console.log("sign-up: joined keys: ", joined_keys);
    // console.log("sign-up: joined values: ", joined_values);

    let query = "insert into account values (" + joined_values + ")";
    console.log("sign-up: query: ", query);

    return conn.execute(query, [], {outFormat: oracledb.OBJECT})
  }).then((query_res) => {
    console.log('sign-up: query_res.rowsAffected', query_res.rowsAffected);
    let data = {'data': query_res.rowsAffected};
    res.send(JSON.stringify(data));
    console.log('sign-up: response.send');

    conn.commit();
    console.log('sign-up: commit');
  }).catch(err => {
    conn.rollback();
    let errmsg = 'sign-up: Error exists, rollback';
    console.error(errmsg, err.message);
    let data = {'data': errmsg};
    res.send(JSON.stringify(data));
  }).then(() => {
    if (conn) {
      return conn.close();
    }
  }).then(function() {
    console.log('sign-up: Connection closed');
  })
  .catch(err => {
    console.log('sign-up: Error closing connection', err);
  });
});


router.post('/log-in', function(req, res) {
  oracledb.getConnection({
    user: dbconfig.user,
    password: dbconfig.password,
    connectString: dbconfig.connectString
  }).then(function(c) {
    conn = c;
    console.log('log-in: req: ', req.body);
    
    let query = "insert into account () values ()";

    return conn.execute(query, [], {outFormat: oracledb.OBJECT})
  }).then((query_res) => {
    console.log('sign-up: query_res.rowsAffected', query_res.rowsAffected);
    let data = {'data': query_res.rowsAffected};
    res.send(JSON.stringify(data));
    console.log('sign-up: response.send');

    conn.commit();
    console.log('sign-up: commit');
  }).catch(err => {
    conn.rollback();
    let errmsg = 'sign-up: Error exists, rollback';
    console.error(errmsg, err.message);
    let data = {'data': errmsg};
    res.send(JSON.stringify(data));
  }).then(() => {
    if (conn) {
      return conn.close();
    }
  }).then(function() {
    console.log('sign-up: Connection closed');
  })
  .catch(err => {
    console.log('sign-up: Error closing connection', err);
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
