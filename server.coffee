_static = require 'node-static'
http = require 'http'
cowsay = require 'cowsay'

file = new _static.Server()
port = 3031

server = http.createServer (request, response) ->
  request.addListener 'end', ->
    file.serve request, response
  request.resume()

server.listen port

message = cowsay.say
  text: "Your server is up and running on port #{port}, boss!"
  e: 'oO'
  T: 'U '

console.log message
