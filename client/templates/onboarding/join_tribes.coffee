Template.joinTribes.helpers
  # tribes: ()-> Tribes.find()
  creators: ()-> returnTribeDocsMatchingCategory('creators', Tribes.find().fetch())
  analysts: ()-> returnTribeDocsMatchingCategory('analysts', Tribes.find().fetch())
  doers: ()-> returnTribeDocsMatchingCategory('doers', Tribes.find().fetch())

# tribes = ()-> Tribes.find()

returnTribeDocsMatchingCategory = (categoryStr, tribesJson)->
  tribes = _.filter tribesJson, (tribe)-> return tribe.category is categoryStr
  return tribes
