class SM.CharacterView extends Backbone.View

  render: ->
    graphData = @model.graphData()
    axesData = [
      {
        angle: 0
        characters: [@model]
      }
      {
        angle: 105
        characters: graphData.firstDegreeCharacters
      }
      {
        angle: 210
        characters: graphData.secondDegreeCharacters
      }
      {
        angle: 315
        characters: graphData.thirdDegreeCharacters
      }
    ]

    h = 500
    w = h
    center =
      x: w / 2
      y: h / 2

    innerRadius = (30 / 500) * h
    nodeSpacing = (10 / 500) * h

    $('svg').remove()
    svg = d3.select 'body'
        .append 'svg'
        .attr 'height', h
        .attr 'width', w
      .append 'g'
        .attr 'transform', "translate(#{w / 2},#{h / 2})"

    # draw axes
    axes = svg.selectAll '.axes'
        .data axesData
        .enter()
      .append 'line'
        .attr 'x1', (data) ->
          polar(data.angle, innerRadius).x
        .attr 'y1', (data) ->
          polar(data.angle, innerRadius).y
        .attr 'x2', (data) ->
          polar(data.angle, innerRadius + (nodeSpacing * data.characters.length)).x
        .attr 'y2', (data) ->
          polar(data.angle, innerRadius + (nodeSpacing * data.characters.length)).y
        .attr 'stroke', 'black'
        .attr 'stroke-width', '3'

    # draw nodes
    for axis, index in axesData
      nodes = svg.selectAll ".axis-#{index}-nodes"
          .data axis
          .enter()
        .append 'image'

















window.polar = (angle, radius) ->
  angle = angle - 90
  x = radius * Math.cos(degreesToRadians(angle))
  y = radius * Math.sin(degreesToRadians(angle))
  {x: x, y: y}

window.degreesToRadians = (degrees) ->
  degrees * (Math.PI / 180)  
