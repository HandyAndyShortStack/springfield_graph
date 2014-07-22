class SM.CharacterQuickView extends Backbone.View

  initialize: ->
    @template = $('#character-quick-view').html()
    @listenTo app, 'clearQuickView', =>
      @$el.remove()
    @listenTo @model, 'quickView', (data) =>
      @show(data)

  show: (data) ->
    @render(data)
    @$el.appendTo $('#quick-info')

  render: (axisName) ->
    data = _.clone @model.attributes
    data.axisName = axisName
    @$el.html _.template(@template, data)
