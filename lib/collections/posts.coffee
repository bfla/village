@Posts = new Mongo.Collection('posts')

GeojsonSchema = new SimpleSchema
  type:
    type: String
    allowedValues: ['Point']
  coordinates:
    type: [Number]
    decimal: true
    minCount: 2
    maxCount: 2
  properties: 
    type: Object
    optional: true

PostSchema = new SimpleSchema
  userId:
    type: String
  tribeId:
    type: String
  text:
    type: String
  # attachment:
  #   type: String
  #   optional: true
  # latitude:
  #   type: Number
  # longitude:
  #   type: Number
  geoJson:
    type: GeojsonSchema
  createdAt:
    type: Date
  updatedAt:
    type: Date
Posts.attachSchema(PostSchema)

Meteor.methods
  createPost: (params)->
    post = params
    post.userId = Meteor.userId()
    post.createdAt = new Date()
    post.updatedAt = new Date()

    Tribes.insert post, dbCallback()