# Publishes local posts to a tribe
Meteor.publish 'postsForTribe', (params) ->
  # required params: tribeId, latitude, longitude
  check(params.tribeId, String)
  check(params.latitude, Number)
  check(params.longitude, Number)
  # redFlag - these should only be local posts
  return Posts.find(params.tribeId)