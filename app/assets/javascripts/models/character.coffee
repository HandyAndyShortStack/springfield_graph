class SM.Character extends Backbone.Model

  initialize: ->
    @connections = new SM.ConnectionsCollection
    @connections.url = "#{@url()}/connections"
    @connections.fetch()

module?.exports = SM.Character
