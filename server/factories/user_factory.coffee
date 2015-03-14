_brian = 
  name: 'Brian'
  email: 'brianflaherty64@gmail.com'

_aristotle = 
  name: 'Aristotle'
  email: 'aristotle@village.com'

_aquinas = 
  name: 'Aquinas'
  email: 'heidigger@village.com'

_users = [_brian, _aristotle, _aquinas]

@seedUsers = () ->
  _.each _users, (user)->
    params =
      email: user.email
      password: "letmein123"
      profile: { name: user.name }
    
    _id = Accounts.createUser(params)