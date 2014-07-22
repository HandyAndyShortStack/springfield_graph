class SM.CharacterHiveView extends Backbone.View

  initialize: ->
    @listenTo @model, 'select', =>
      @render()

  render: ->
    $('#hive-name').html @model.get('name')
    graphData = @model.graphData()
    axesData = [
      {
        angle: 0
        name: 'zero'
        characters: graphData.zeroDegreeCharacters
        connections: graphData.zeroDegreeConnections
      }
      {
        angle: 105
        name: 'first'
        characters: graphData.firstDegreeCharacters
        connections: graphData.firstDegreeConnections
      }
      {
        angle: 210
        name: 'second'
        characters: graphData.secondDegreeCharacters
        connections: graphData.secondDegreeConnections
      }
      {
        angle: 315
        name: 'third'
        characters: graphData.thirdDegreeCharacters
        connections: graphData.thirdDegreeConnections
      }
    ]


    h = 750
    w = h
    center =
      x: w / 2
      y: h / 2

    innerRadius = 0.05 * h
    nodeSpacing = ((0.5 * w) - innerRadius) / 11
    nodeSide = nodeSpacing * 0.8

    polar = (angle, radius) ->
      angle = angle - 90
      x = radius * Math.cos(degreesToRadians(angle))
      y = radius * Math.sin(degreesToRadians(angle))
      {x: x, y: y}

    degreesToRadians = (degrees) ->
      degrees * (Math.PI / 180)

    nodeCenter = (angle, index) ->
      polar(angle, nodeRadius(index))

    nodeRadius = (index) ->
      innerRadius + (nodeSpacing * (index + 0.5))

    colorScale = d3.scale.category10()

    $('svg').remove()
    svg = d3.select '#hive'
        .append 'svg'
        .attr 'height', h * 0.7
        .attr 'width', w * 0.8
      .append 'g'
        .attr 'transform', "translate(#{w * 0.3},#{h * 0.3})"

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

    for axis, index in axesData
      nextAxis = axesData[index + 1]
           
      # draw connections
      connections = svg.selectAll ".axis-#{index}-connections"
          .data axis.connections.models
          .enter()
          .append 'g'
      for i in [1, 2]
        connections.append 'path'
            .classed "connection-#{i}", true
            .attr 'data-connection-id', (data) ->
              data.id
            .attr 'stroke', (data) ->
              colorScale axis.characters.indexOf(data.source())
            .attr 'stroke-width', '2'
            .attr 'fill', 'none'
            .attr 'd', (data) ->
              sourceIndex = axis.characters.indexOf(data.source())
              targetIndex = nextAxis.characters.indexOf(data.target())
              source = nodeCenter(axis.angle, sourceIndex)
              target = nodeCenter(nextAxis.angle, targetIndex)
              "M #{source.x} #{source.y} " +
              "A 1 1 " +
              "0 0 1 " +
              "#{target.x} #{target.y}"
      d3.selectAll '.connection-2'
          .attr 'stroke', 'black'
          .attr 'stroke-width', 4.5
          .attr 'stroke-opacity', 0
          .on 'mouseover', ->
            d3.select(this).attr 'stroke-opacity', 1
            connectionId = d3.select(this).attr('data-connection-id')
            app.trigger 'connectionQuickView', connectionId
          .on 'mouseout', ->
            app.trigger 'clearQuickView'
            d3.select(this).attr 'stroke-opacity', 0

      # draw nodes
      nodes = svg.selectAll ".axis-#{index}-nodes"
          .data axis.characters.models
          .enter()
        .append 'g'
          .attr 'data-axisName', axis.name
          .on 'mouseover', (data) ->
            axisName = d3.select(this).attr 'data-axisName'
            data.trigger 'quickView', axisName
            d3.select(this).select('.node-border').attr 'fill', 'orange'
          .on 'mouseout', ->
            app.trigger 'clearQuickView'
            d3.select(this).select('.node-border').attr 'fill', 'none'
          .on 'click', (data) ->
            data.trigger 'select'
            app.trigger 'clearQuickView'
      nodes.append 'circle'
          .classed 'node-border', true
          .attr 'cx', (data, index) ->
            nodeCenter(axis.angle, index).x
          .attr 'cy', (data, index) ->
            nodeCenter(axis.angle, index).y
          .attr 'r', nodeSide / 2 + 3
          .attr 'fill', 'none'
      nodes.append 'image'
          .classed 'node', true
          .attr 'xlink:href', (data) ->
            data.get 'image_url'
          .attr 'x', (data, index) ->
            nodeCenter(axis.angle, index).x - (nodeSide / 2)
          .attr 'y', (data, index) ->
            nodeCenter(axis.angle, index).y - (nodeSide / 2)
          .attr 'width', nodeSide
          .attr 'height', nodeSide
