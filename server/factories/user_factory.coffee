geojson =
  type:'Feature'
  geometry:
    type: 'Point'
    coordinates: [-83.7483, 42.2814]
    properties: {}

_brian = 
  name: 'Brian'
  email: 'brianflaherty64@gmail.com'

_aristotle = 
  name: 'Aristotle'
  email: 'aristotle@village.com'

_aquinas = 
  name: 'Aquinas'
  email: 'aquinas@village.com'

_users = [_brian, _aristotle, _aquinas]

@seedUsers = () ->
  console.log("Seeding users data...")
  _.each _users, (user)->
    params =
      email: user.email
      password: "letmein123"
      profile: { name: user.name, currentLocation: geojson}
    
    _id = Accounts.createUser(params)