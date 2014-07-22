class SM.ConnectionsCollection extends Backbone.Collection
  model: SM.Connection

  targets: ->
    model.target() for model in @models

  targeting: (characters) ->
    collection = new SM.CharactersCollection
    for model in @models
      collection.add model if characters.contains(model.target())
    collection
