class SM.CharacterListView extends Backbone.View

  initialize: ->
    @template = $('#character-list-view').html()
    @render()

  render: ->
    @$el.html _.template(@template, @model.attributes)
