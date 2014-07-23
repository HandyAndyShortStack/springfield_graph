class SM.App extends Backbone.Model

  initialize: ->
    @getCharacters =>
    @on 'charactersLoaded', =>
      @getConnections()
    @on 'connectionsLoaded', =>
      @characters.first().trigger 'select'

  getCharacters: ->
    @characters = new SM.CharactersCollection
    @characters.fetch
      success: =>
        for character in @characters.models
          character.listView.$el.appendTo $('#character-list')
        @trigger 'charactersLoaded'

  getConnections: ->
    @connections = new SM.ConnectionsCollection
    @connections.fetch
      success: =>
        for connection in @connections.models
          connection.source().connections.add connection
        @trigger 'connectionsLoaded'
    
