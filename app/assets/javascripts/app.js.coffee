class SM.App

  constructor: ->
    @characters = new SM.CharactersCollection
    @characters.fetch
      success: =>
        for character in @characters.models
          character.listView.$el.appendTo $('#character-list')
