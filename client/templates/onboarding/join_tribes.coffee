Template.joinTribes.helpers
  # tribes: ()-> Tribes.find()
  creators: ()-> returnTribeDocsMatchingCategory('creators', Tribes.find().fetch())
  analysts: ()-> returnTribeDocsMatchingCategory('analysts', Tribes.find().fetch())
  doers: ()-> returnTribeDocsMatchingCategory('doers', Tribes.find().fetch())

# tribes = ()-> Tribes.find()

returnTribeDocsMatchingCategory = (categoryStr, tribesJson)->
  tribes = _.filter tribesJson, (tribe)-> return tribe.category is categoryStr
  return tribes

Template.joinTribes.events
  'click .tribe-join-checkbox': addTribeToUser()

addTribeToUser = ()->
  return Alerts.set('default', 'You can only choose 3!') if Meteor.user.profile.tribes?.length > 2

  Meteor.methods 'addTribeToUser', params, handleResponse()

