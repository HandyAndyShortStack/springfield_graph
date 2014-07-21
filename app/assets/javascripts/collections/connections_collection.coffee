class SM.ConnectionsCollection extends Backbone.Collection
  model: SM.Connection

  targets: ->
    model.target() for model in @models
