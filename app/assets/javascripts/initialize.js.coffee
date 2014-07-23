$ ->

  $('.hive-name').hide()

  _.templateSettings =
  interpolate: /\{\{\=(.+?)\}\}/g
  evaluate: /\{\{(.+?)\}\}/g

  app = window.app = new SM.App
