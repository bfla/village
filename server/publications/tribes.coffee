# Publishes a single tribe
Meteor.publish 'tribe', (tribeId) ->
  check(tribeId, String)
  return Tribes.find(tribeId)

# Publishes all tribes
Meteor.publish 'listTribes', ()->
  return Tribes.find()