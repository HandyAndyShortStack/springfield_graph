class SM.Character extends Backbone.Model

  initialize: ->
    @connections = new SM.ConnectionsCollection
    @connections.url = "#{@url()}/connections"
    @connections.fetch() 
    @view = new SM.CharacterView(model: this)

  graphData: ->
    firstDegreeCharacters = new SM.CharactersCollection
    secondDegreeConnections = new SM.ConnectionsCollection
    secondDegreeCharacters = new SM.CharactersCollection
    thirdDegreeConnections = new SM.ConnectionsCollection
    thirdDegreeCharacters = new SM.CharactersCollection

    firstDegreeCharacters.add @connections.targets()
    secondDegreeConnections.add firstDegreeCharacters.connections()
    secondDegreeCharacters.add secondDegreeConnections.targets()
    thirdDegreeConnections.add secondDegreeCharacters.connections()
    thirdDegreeCharacters.add thirdDegreeConnections.targets()

    thirdDegreeCharacters.remove secondDegreeCharacters.models
    thirdDegreeCharacters.remove firstDegreeCharacters.models
    thirdDegreeCharacters.remove this

    secondDegreeCharacters.remove firstDegreeCharacters.models
    secondDegreeCharacters.remove this

    firstDegreeCharacters.remove this

    {
      firstDegreeCharacters: firstDegreeCharacters
      secondDegreeCharacters: secondDegreeCharacters
      thirdDegreeCharacters: thirdDegreeCharacters
    }
