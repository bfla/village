Meteor.methods
  updateUserLocation: (params)-> updateUserLocation(params)

updateUserLocation = (params)->
  # requires latitude and longitude
  return console.log("Error") unless Meteor.userId()
  user = Meteor.users.findOne(Meteor.userId())
  geojson = user.currentLocation
  geojson ||= initGeojson()
  geojson.coordinates = [params.latitude, params.longitude]

  selector = {_id: user._id}
  updateOperation = {$set: {'geojson': geojson} }
  Meteor.users.update selector, updateOperation, dbCallback()

initGeojson = ()->
  geojson =
    type: "Point"
    coordinates: null
    properties : {}

