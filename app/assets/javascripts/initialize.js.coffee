$ ->
  
  _.templateSettings =
  interpolate: /\{\{\=(.+?)\}\}/g
  evaluate: /\{\{(.+?)\}\}/g

  app = window.app = new SM.App
  _.extend app, Backbone.Events

