_ = require 'lodash'
express = require 'express'
bodyParser = require 'body-parser'
app = express()

PORT = process.env.port or 3000

app.use bodyParser.json()

state =
  deploying: false
  errors: []

app.get '/state', (req, res) ->
  res.send state

app.put '/state', (req, res) ->
  state = _.extend state, req.body
  res.sendStatus 200

app.listen PORT, ->
  console.log "Ino state server listening on #{PORT}"
