const mysql = require('mysql');

module.exports = function() {

  const connection = mysql.createConnection({
    host: '',
    user: '',
    password: '',
    database: ''
  });

  connection.connect(function(err) {
    if (err) {
      //Handle this error
      return;
    }

  });

  //Wrapper method to execute queries with callbacks
  const executeQueryWithCallback = function(query, callback) {
    connection.query(query, callback);
  };
  
  //Wrapper method to execute queries with promises
  const executeQueryWithPromise = function(query) {
    return new Promise(function(resolve, reject) {
      connection.query(query, function(err, results, fields) {
        if (err)
          return reject(err);
        resolve(results);
      });
    });
  };

  const db = {};

  db.fetchSeriesNoJoins = function(callback) {
    // Add code here
  };

  db.fetchSeriesWithJoins = function(callback) {
    // Add code here
  };
  
  db.addUserWatchData = function(data, callback) {
    // Add code here
  };

  db.fetchUserWatchHistory = function(data, callback) {
    // Add code here
  };

  return db;
};
