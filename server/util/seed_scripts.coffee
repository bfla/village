Meteor.startup ()->
  # if Meteor.users.find().limit(1).count is 0
  seedUsers() unless Meteor.users.findOne()
  seedTribes() unless Tribes.findOne()
  seedPosts() unless Posts.findOne()