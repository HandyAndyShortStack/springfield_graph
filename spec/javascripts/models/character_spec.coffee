_ = require '../../../vendor/assets/javascripts/underscore'
Backbone = require '../../../vendor/assets/javascripts/backbone'
Character = require '../../../app/assets/javascripts/models/character'

describe "Character", ->
  character = null

  beforeEach ->
    character = new Character
      name: 'Sample Name'

  it 'has a name', ->
    expect(character.name).toEqual('Sample Name')
