@Goals = do (Backbone, Marionette) ->

  App = new Marionette.Application

  # Our default route for thie App
  App.rootRoute = Routes.users_path()

  App.on 'before:start', (options) ->
    @currentUser = App.request 'set:current:user', options.currentUser

  App.reqres.setHandler 'get:current:user', ->
    App.currentUser

  App.addRegions
    headerRegion: '#header-region',
    mainRegion:   '#main-region',
    footerRegion: '#footer-region'

  App.addInitializer ->
    App.module('HeaderApp').start()
    App.module('FooterApp').start()

  App.on 'start', ->
    Backbone.history.start() if Backbone.history
    @navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ''

  App