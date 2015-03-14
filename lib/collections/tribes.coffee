@Tribes = new Mongo.Collection('tribes')

TribeSchema = new SimpleSchema
  name:
    type: String
  category:
    type: String
    allowedValues: ['creators', 'analysts', 'doers']
  description:
    type: String
  createdAt:
    type: Date
  updatedAt:
    type: Date
Tribes.attachSchema(TribeSchema)

Meteor.methods
  createTribe: (params)->
    tribe = params
    tribe.createdAt = new Date()
    tribe.updatedAt = new Date()

    Tribes.insert tribe, dbCallback()

