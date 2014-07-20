$ ->

  data = [
    'inspected'
    [
      'first'
      'degree'
      'connections'
    ]
    [
      'second'
      'degree'
      'connections'
    ]
    [
      'third'
      'degree'
      'connections'
    ]
  ]

  height = 500
  width = 500
  axisRadius = 200

  svg = d3.select 'body'
      .append 'svg'
      .attr 'height', height
      .attr 'width', width

  svg.selectAll '.axis'
      .data data
      .enter()
    .append 'line'
      .classed 'axis', true
      .attr 'transform', (datum, index) ->
        "rotate(#{360 - ((360 / 4) * index)})"
      .attr 'x1', width / 2
      .attr 'y1', height / 2
      .attr 'x2', width / 2
      .attr 'y2', (height / 2) + axisRadius
      .attr 'stroke-width', 3
      .attr 'stroke', 'black'

window.pointFromRadius = (x1, y1, angle, distance) ->
  
