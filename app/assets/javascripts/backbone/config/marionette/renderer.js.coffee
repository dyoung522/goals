Backbone.Marionette.Renderer.render = (template, data) ->
  path =  Handlebars.compile('backbone/apps/' + template)
  unless path
    throw "Template #{template} cannot be found!"

  path(data)
