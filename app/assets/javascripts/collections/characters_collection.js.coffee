class SM.CharactersCollection extends Backbone.Collection
  model: SM.Character
  url: '/api/v1/characters'

  connections: ->
    connections = []
    for character in @models
      for connection in character.connections.models
        connections.push connection
    new SM.ConnectionsCollection(connections)

  comparator: (character) ->
    if character.connections then character.connections.length else 0

