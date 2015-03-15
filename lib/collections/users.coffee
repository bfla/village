Meteor.methods
  updateUserLocation: (params)-> updateUserLocation(params)

updateUserLocation = (params)->
  # requires latitude and longitude
  return console.log("Error") unless Meteor.userId()
  user = Meteor.users.findOne(Meteor.userId())
  geojson = user.currentLocation
  geojson ||= initGeojson()
  geojson.geometry.coordinates = [params.latitude, params.longitude]

  selector = {_id: user._id}
  updateOperation = {$set: {'geojson': geojson} }
  Meteor.users.update selector, updateOperation, dbCallback()

initGeojson = ()->
  geojson =
    type: "Feature"
    geometry: 
      type: "Point"
      coordinates: []
      properties : {}

@UserMethods = {}

UserMethods.getUserLongitude = ()->
  return null unless Meteor.users.findOne(Meteor.userId())
  user = Meteor.users.findOne(Meteor.userId())
  console.log "userObj:", user
  longitude = user.profile.currentLocation.geometry.coordinates[0]

UserMethods.getUserLatitude = ()->
  return null unless Meteor.users.findOne(Meteor.userId())
  user = Meteor.users.findOne(Meteor.userId())
  latitude = user.profile.currentLocation.geometry.coordinates[1]