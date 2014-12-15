express = require 'express'

app = express()
app.get('/', (req, res) ->
  res.send "Profit!"
)

module.exports = app
