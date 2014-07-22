class SM.CharacterTopView extends Backbone.View

  initialize: ->
    @template = $('#character-top-view').html()
    @listenTo @model, 'select', =>
      @show()

  render: ->
    data = _.clone(@model.attributes)
    graphData = @model.graphData()
    _.extend data,
      firsts: graphData.firstDegreeCharacters.length
      seconds: graphData.secondDegreeCharacters.length
      thirds: graphData.thirdDegreeCharacters.length
    @$el.html _.template(@template, data)

  show: ->
    @render()
    $('#selected-character').html('').append @$el
