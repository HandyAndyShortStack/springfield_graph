class SM.characterView extends Backbone.View

  render: ->
    h = 500
    w = h

    $('svg').remove()
    svg = d3.select 'svg'
        .attr 'height', h
        .attr 'width', w
