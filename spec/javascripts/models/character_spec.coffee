global.SM or= {}
global.Backbone or= require 'backbone'
Character = require '../../../app/assets/javascripts/models/character'

describe "Character", ->
  character = null

  beforeEach ->
    character = new Character
      name: 'Sample Name'

  it 'has a name', ->
    expect(character.get('name')).toEqual('Sample Name')
