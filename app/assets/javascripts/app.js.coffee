class SM.App

  constructor: ->
    @characters = new SM.CharactersCollection
    @characters.fetch()
