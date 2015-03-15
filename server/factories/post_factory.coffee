geojson =
  type:'Feature'
  geometry:
    type: 'Point'
    coordinates: [-83.7483, 42.2814]
    properties: {}

createPost = ()->
  post =
    userId: Meteor.users.findOne()._id
    tribeId: Tribes.findOne()._id
    text: 'Kant is so much better than Hume. Am I right?'
    geojson: geojson
    createdAt: new Date()
    updatedAt: new Date()
  # Factory.define('post', Posts, post)
  # console.log "Post: ", post
  return post

createAnotherPost = ()->
  anotherPost = createPost()
  anotherPost.text = 'Fermi Paradox (Why have humans not encountered alien life?) Mindblowing!'
  return anotherPost

@seedPosts = ()->
  return console.log('Could not seed posts because they require a user') unless Meteor.users.findOne()
  return console.log('Could not seed posts because they require a tribe') unless Tribes.findOne()
  console.log "Seeding posts data..."
  post = createPost()
  Posts.insert(post)
  anotherPost = createAnotherPost()
  Posts.insert(anotherPost)
  # createFactories()
  # post = Factory.create('post')
  # anotherPost = Factory.create('anotherPost')