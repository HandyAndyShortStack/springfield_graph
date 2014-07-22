class SM.Connection extends Backbone.Model

  source: ->
    app.characters.get(@get('connector_id'))

  target: ->
    app.characters.get(@get('connectee_id'))
