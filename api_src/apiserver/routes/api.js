var express = require('express');
var router = express.Router();

const oracledb = require('oracledb');
oracledb.fetchAsString = [ oracledb.DATE, oracledb.NUMBER ];
oracledb.initOracleClient({configDir: '/opt/oracle/instantclient_19_9'});
const dbconfig = {
  user: process.env.NODEORACLEDB_USER,
  password: process.env.NODEORACLEDB_PASSWORD,
  connectString: process.env.NODEORACLEDB_CONNECTSTRING
}
oracledb.autoCommit = false;
oracledb.outFormat = oracledb.OUT_FORMAT_OBJECT;
let conn;

let account = ["account_id", "account_pw", "account_name", "account_bday", "account_sex", "account_address", "account_phone", "account_identity", "account_job", "account_membership"];


// https://blogs.oracle.com/oraclemagazine/keep-your-nodejs-promises
router.post('/sign-up', function(req, res) {
  oracledb.getConnection(dbconfig)
  .then(function(c) {
    conn = c;
    console.log('sign-up: req: ', req.body);

    // 필수 항목 검사
    check.checkRequiredAttr(req.body.account_id);
    check.checkRequiredAttr(req.body.account_pw);
    check.checkRequiredAttr(req.body.account_name);
    check.checkRequiredAttr(req.body.account_phone);

    // 생년월일 포맷 검사
    check.checkDateFormat(req.body.account_bday);

    // 전화번호 포맷 검사
    check.checkPhoneFormat(req.body.account_phone);

    var data = {};
    for (let key of account.values()) {
      let value = req.body[key];
      // console.log('sign-up: req: key: ', key, typeof key, ' / val: ', value, typeof value);
      switch (key) {
        case "account_bday":
          data[key] = "to_date('" + value + "', 'yyyy-mm-dd')";
          break;
        case "account_address":
        case "account_job":
          // 필수 아닌 항목 입력을 안 했으면 "null"이라는 문자열로 바꾸기
          if (value == undefined ) {
            data[key] = "'null'";
          } else {
            data[key] = "'" + value + "'";
          }
          break;
        case "account_sex":
          // 성별 검사. M이나 F가 아니면 NULL 입력, m이나 f면 대문자로 바꾸기.
          data[key] = check.checkSexFormat(value);
          break;
        // 권한 입력 및 멤버십 등급은 회원가입 시에는 표시하지 않습니다.
        case "account_identity":
          data[key] = "'customer'";
          break;
        case "account_membership":
          data[key] = "'Basic'";
          break;
        default:
          data[key] = "'" + value + "'";
          break;
      }
    }

    // console.log("sign-up: data: ", data);
    let joined_keys = Object.keys(data).join(', ');
    let joined_values = Object.values(data).join(', ');
    // console.log("sign-up: joined keys: ", joined_keys);
    // console.log("sign-up: joined values: ", joined_values);

    let query = "insert into account values (" + joined_values + ")";
    console.log("sign-up: query: ", query);

    return conn.execute(query, [], {})
  }).then((query_res) => {
    console.log('sign-up: query_res.rowsAffected', query_res.rowsAffected);
    let data = {'data': query_res.rowsAffected};
    res.json(JSON.stringify(data));
    console.log('sign-up: response.send');

    conn.commit();
    console.log('sign-up: commit');
  }).catch((err) => {
    conn.rollback();
    let errmsg = 'sign-up: Error exists, rollback: ' + err.message;
    console.error(errmsg);
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
  oracledb.getConnection(dbconfig)
  .then(function(c) {
    conn = c;
    console.log('log-in: req: ', req.body);

    let query = "select * from account where account_id = '" 
        + req.body.account_id + "' and account_pw = '"
        + req.body.account_pw + "'";
    console.log("log-in: query: ", query);

    return conn.execute(query, [], {})
  }).then((query_res) => {
    console.log('log-in: query_res', query_res.rows);
    let data = {'data': query_res.rows};
    res.send(data);
    console.log('log-in: response.send');

  }).catch(err => {
    let errmsg = 'log-in: Error exists' + err.message;
    console.error(errmsg);
    let data = {'data': errmsg};
    res.send(JSON.stringify(data));
  }).then(() => {
    if (conn) {
      return conn.close();
    }
  }).then(function() {
    console.log('log-in: Connection closed');
  })
  .catch(err => {
    console.log('log-in: Error closing connection', err);
  });
});


var check = {
  checkRequiredAttr: function(attr) {
    console.log("checkRequiredAttr: attr: ", attr, typeof attr);
    if (attr == "'undefined'") {
      console.error("checkRequiredAttr: undefined");
      throw "필수 항목이 없습니다."
    }
  },
  checkDateFormat: function(attr) {
    console.log("checkDateFormat: attr: ", attr, typeof attr);
    var reg = new RegExp('^\\d{4}-\\d{2}-\\d{2}$', 'g');
    if (!reg.test(attr)) {
      console.error("checkDateFormat: date format error");
      throw "날짜 형식이 틀렸습니다."
    }
  },
  checkSexFormat: function(attr) {
    console.log("checkSexFormat: attr: ", attr, typeof attr);
    if (attr == "m" || attr == "M" || attr == "f" || attr == "F") {
      return "'" + attr.toUpperCase() + "'";
    } else {
      throw "성별을 잘못 입력했습니다."
    }
  },
  checkPhoneFormat: function(attr) {
    console.log("checkPhoneFormat: attr: ", attr, typeof attr);
    var reg = new RegExp('^\\d{3}-\\d{4}$', 'g');
    if (!reg.test(attr)) {
      console.error("checkPhoneFormat: phone format error");
      throw "전화번호 형식이 틀렸습니다."
    }
  }
}

module.exports = router;
