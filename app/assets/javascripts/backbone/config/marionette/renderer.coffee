Backbone.Marionette.Renderer.render = (template, data) ->
  path = JST['backbone/apps/' + template]
  unless path
    throw "Template #{template} cannot be found!"
  path(data)
