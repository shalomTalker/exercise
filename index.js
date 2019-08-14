//App should start here!
const app = require('./server/server')
// require('./db/db')();

app.listen('5000', () => {
    console.log('server listening on port 5000')
});