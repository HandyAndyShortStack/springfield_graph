class SM.Character extends Backbone.Model

  initialize: ->
    @connections = new SM.ConnectionsCollection
    @hiveView = new SM.CharacterHiveView(model: this)
    @listView = new SM.CharacterListView(model: this)
    @topView = new SM.CharacterTopView(model: this)
    @quickView = new SM.CharacterQuickView(model: this)

  graphData: ->
    zeroDegreeCharacters = new SM.CharactersCollection(this)
    firstDegreeCharacters = new SM.CharactersCollection
    secondDegreeConnections = new SM.ConnectionsCollection
    secondDegreeCharacters = new SM.CharactersCollection
    thirdDegreeConnections = new SM.ConnectionsCollection
    thirdDegreeCharacters = new SM.CharactersCollection

    firstDegreeCharacters.add @connections.targets()
    secondDegreeConnections.add firstDegreeCharacters.connections().models
    secondDegreeCharacters.add secondDegreeConnections.targets()
    thirdDegreeConnections.add secondDegreeCharacters.connections().models
    thirdDegreeCharacters.add thirdDegreeConnections.targets()

    thirdDegreeCharacters.remove secondDegreeCharacters.models
    thirdDegreeCharacters.remove firstDegreeCharacters.models
    thirdDegreeCharacters.remove this

    secondDegreeCharacters.remove firstDegreeCharacters.models
    secondDegreeCharacters.remove this

    firstDegreeCharacters.remove this

    {
      zeroDegreeCharacters: zeroDegreeCharacters
      firstDegreeCharacters: firstDegreeCharacters
      secondDegreeCharacters: secondDegreeCharacters
      thirdDegreeCharacters: thirdDegreeCharacters
      zeroDegreeConnections: zeroDegreeCharacters.connections().targeting(firstDegreeCharacters)
      firstDegreeConnections: firstDegreeCharacters.connections().targeting(secondDegreeCharacters)
      secondDegreeConnections: secondDegreeCharacters.connections().targeting(thirdDegreeCharacters)
      thirdDegreeConnections: new SM.ConnectionsCollection
    }
