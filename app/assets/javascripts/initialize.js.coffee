$ ->
  app = window.app = new SM.App
  _.extend app, Backbone.Events

window.polar = (angle, radius) ->
  x = radius * Math.cos(degreesToRadians(angle))
  y = radius * Math.sin(degreesToRadians(angle))
  [x, y]

window.degreesToRadians = (degrees) ->
  degrees * (Math.PI / 180)  
