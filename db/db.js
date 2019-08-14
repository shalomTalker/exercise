const mysql = require('mysql');
const async = require('async')

module.exports = function () {

  const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'webFix_DB'
  });

  connection.connect(function (err) {
    if (err) {
      //Handle this error
      console.error('Error connecting to Db', err);
      return;
    }
    console.error('Connection established');

  });

  //Wrapper method to execute queries with callbacks
  const executeQueryWithCallback = function (query, callback) {
    connection.query(query, callback);
  };

  //Wrapper method to execute queries with promises
  const executeQueryWithPromise = function (query) {
    return new Promise(function (resolve, reject) {
      connection.query(query, function (err, results, fields) {
        if (err)
          return reject(err);
        resolve(results);
      });
    });
  };
  const db = {};

  db.fetchSeriesNoJoins = async function (callback) {
    // Add code here

  //   const series = await executeQueryWithPromise('SELECT * FROM series')

  //   let array = []
  //   Promise.all(
  //     series.map(async ser => {
  //       const obj = { ...ser }
  //        await executeQueryWithPromise(`SELECT * FROM seasons WHERE seriesID = ${ser.id}`)
  //         .then(seasons => {
  //           obj.seasons = [...seasons];
  //           Promise.all(
  //             seasons.map(async (season, i) => {
  //                await executeQueryWithPromise(`SELECT * FROM episodes WHERE seasonID = ${season.id}`)
  //                 .then(episodes => {
  //                   obj.seasons[i].episodes = episodes;
  //                   array.push(obj)
  //                 })
  //             }))
  //         })
  //     }))
  // };

  db.fetchSeriesWithJoins = function (callback) {
    const query = 'SELECT * FROM series ser join seasons sea join episodes epi WHERE ser.id = sea.seriesID and sea.id = epi.seasonID'
    executeQueryWithCallback(query, (err, results, { orgfield, orgta }) => {


    })
    // callback(results)
    // Add code here
  };

  db.addUserWatchData = function (data, callback) {
    // Add code here
  };

  db.fetchUserWatchHistory = function (data, callback) {
    // Add code here
  };

  return db;
};
