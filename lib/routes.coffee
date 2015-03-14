Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplate: 'notFound'

# Index route ==========================================================================================
indexOptions =
  template: 'index'
  name: 'index'
Router.route '/', indexOptions

# Local tribe route ====================================================================================
Router.route '/tribes/:_id',
  template: 'showTribe'
  name: 'tribe'
  waitOn: ()-> 
    postsForTribeParams =
      tribeId: @params._id
      latitude: 42.2814 #redFlag
      longitude: -83.7483 #redFlag
    [Meteor.subscribe('tribe', @params._id), Meteor.subscribe('postsForTribe', postsForTribeParams)]
  data: ()-> 
    data =
      tribe: Tribes.findOne(@params._id)
      posts: Posts.find()

# User tribe selection route ==========================================================================
Router.route '/joinTribes',
  template: 'joinTribes'
  name: 'joinTribes'
  waitOn: ()-> Meteor.subscribe('listTribes')
  data: ()-> Tribes.find()

# Helpers ================================================================================

requireLogin = () ->
  if !Meteor.user()
    if Meteor.loggingIn()
      this.render(this.loadingTemplate)
    else
      this.render('index')
  else
    this.next()

# Router.onBeforeAction(requireLogin, {only: 'newMessage'})
Router.onBeforeAction(requireLogin, {only: ['nearbyMatches', 'home', 'history', 'storyDetail']})