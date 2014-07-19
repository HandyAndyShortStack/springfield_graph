global.app or= {}
global.SM or= {}
global.Backbone or= require 'backbone'
Connection = require '../../../app/assets/javascripts/models/connection'

describe "Connection", ->
  connection = null

  beforeEach ->
    connection = new Connection(connector_id: 1, connectee_id: 2)
    app.characters = {}
    spyOn(app.characters, 'find').andReturn('character')

  describe '#source', ->
    it 'returns a character', ->
      result = character.source()
      expect(app.characters.find).toHaveBeenCalledWith(1)
      expect(result).toEqual('character')
