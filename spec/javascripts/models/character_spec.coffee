Character = require '../../../app/assets/javascripts/models/character'

describe "Character", ->
  character = null

  beforeEach ->
    character = new Character
      name: 'Sample Name'

  it 'has a name', ->
    expect(character.name).toEqual('Sample Name')
