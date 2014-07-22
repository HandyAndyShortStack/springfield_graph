class SM.ConnectionQuickView extends Backbone.View

  initialize: ->
    @template = $('#connection-quick-view').html()
    @render()
    @listenTo app, 'clearQuickView', =>
      @$el.remove()
    @listenTo @model, 'quickView', =>
      @show()

  render: ->
    data = _.clone @model.attributes
    data.source = @model.source().attributes
    data.target = @model.target().attributes
    @$el.html _.template(@template, data)

  show: ->
    @$el.appendTo $('#quick-info')
