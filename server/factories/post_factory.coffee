geojson =
  type:'Feature'
  geometry:
    type: 'Point'
    coordinates: [-83.7483, 42.2814]
    properties: {}

post =
  userId: Meteor.users.findOne()
  tribeId: Tribes.findOne()
  text: 'Kant is so much better than Hume. Am I right?'
  geojson: geojson
  createdAt: ()-> new Date()
  updatedAt: ()-> new Date()
Factory.define('post', Posts, post)

anotherPost =
  text: 'Fermi Paradox (Why haven\'t humans encountered alien life?) Mindblowing!'

Factory.define('anotherPost', Posts, Factory.extend('post'), anotherPost)

@seedPosts = ()->
  return console.log('Could not seed posts because they require a user') unless Meteor.users.findOne()
  return console.log('Could not seed posts because they require a tribe') unless Tribes.findOne()
  post = Factory.build('post')
  buildAndInsertPost(post)

  anotherPost = Factory.build('anotherPost')
  buildAndInsertPost(anotherPost)

buildAndInsertPost = (post)->
  Meteor.methods 'createPost', post