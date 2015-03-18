@Goals.module "FooterApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  Show.Controller =

    showFooter: ->
      currentUser = App.request 'get:current:user'
      footerView = @getFooterView({model: currentUser})
      App.footerRegion.show footerView

    getFooterView: (options) ->
      new Show.Footer
        model: options.model

