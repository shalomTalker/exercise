const express = require('express');
const router = express.Router();
const { fetchSeriesNoJoins } = require('../db/db')()
router.get('/fetchSeriesNoJoins', async (req, res) => {
    const results = await fetchSeriesNoJoins();
    res.send(results)
})
module.exports = router

