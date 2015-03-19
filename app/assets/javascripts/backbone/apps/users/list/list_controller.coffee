@Goals.module "UsersApp.List", (List, App, Backbone, Marionette, $, _) ->

  List.Controller =

    listUsers: ->
      users = App.request 'user:entities'
      console.log users

      @layout = @getLayoutView()

      @layout.on 'show', =>
        @showPanel users
        @showUsers users

      App.mainRegion.show @layout

    showPanel: (users) ->
      panelView = @getPanelView users
      @layout.panelRegion.show panelView

    showUsers: (users) ->
      usersView = @getUsersView users
      @layout.usersRegion.show usersView

    getPanelView: (users) ->
      new List.Panel
        collection: users

    getUsersView: (users) ->
      console.log users
      new List.Users
        collection: users

    getLayoutView: ->
      new List.LayoutView
