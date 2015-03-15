Router.configure
  layoutTemplate: 'layout'
  loadingTemplate: 'loading'
  notFoundTemplate: 'notFound'

# Index route ==========================================================================================
Router.route '/',
  name: 'index'
  template: 'index'

# Local tribe route ====================================================================================
Router.route '/tribes/:_id',
  template: 'showTribe'
  name: 'tribe'
  waitOn: ()-> 
    postsParams =
      tribeId: @params._id
      longitude: UserMethods.getUserLongitude() || -83.7483 #-83.7483 #redFlag this.params.query.longitude
      latitude: UserMethods.getUserLatitude() || 42.2814 #42.2814 #redFlag this.params.query.latitude
    [Meteor.subscribe('tribe', @params._id), Meteor.subscribe('postsForTribe', postsParams)]
  data: ()-> 
    data =
      tribe: Tribes.findOne(@params._id)
      posts: Posts.find({tribeId: @params._id})

# User tribe selection route ==========================================================================
Router.route '/joinTribes',
  template: 'joinTribes'
  name: 'joinTribes'
  waitOn: ()-> Meteor.subscribe('listTribes')
  data: ()-> Tribes.find()

# Helpers ================================================================================

# requireLogin = () ->
#   if !Meteor.userId()
#     if Meteor.loggingIn()
#       @render(@loadingTemplate)
#     else
#       @render('index')
#   else
#     this.next()

# requireTribeSelection = ()->
  # if 

# Require login before doing stuff!
# Router.onBeforeAction ()-> requireLogin()

