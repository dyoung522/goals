@Goals.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.User extends Entities.Model

  class Entities.UsersCollection extends Entities.Collection
    model: Entities.User
    url: -> Routes.users_path()

  API =
    setCurrentUser: (currentUser) ->
      new Entities.User currentUser

    getUserEntities: ->
      users = new Entities.UsersCollection
      users.fetch()
      console.log users
      users

  App.reqres.setHandler 'set:current:user', (currentUser) ->
    API.setCurrentUser currentUser

  App.reqres.setHandler 'user:entities', ->
    API.getUserEntities()
