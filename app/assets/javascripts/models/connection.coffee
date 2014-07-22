class SM.Connection extends Backbone.Model

  initialize: ->
    @quickView = new SM.ConnectionQuickView(model: this)
    @listenTo app, 'connectionQuickView', (id) =>
      @trigger 'quickView' if id is @id.toString()

  source: ->
    app.characters.get(@get('connector_id'))

  target: ->
    app.characters.get(@get('connectee_id'))
