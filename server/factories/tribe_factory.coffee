_defaultTribes = [
  {name: 'music makers', category:'creators', description: 'For those who make music'}
  {name: 'music lovers', category:'creators', description: 'For those who love music.'}
  {name: 'artistic types', category: 'creators', description: 'For those who love making art and creating things.'}
  {name: 'crafters', category:'creators', description: 'For those who love making things: Crafts, hardware, etc.'}
  {name: 'hackers', category:'creators', description: 'For those who like coding cool stuff.'}
  {name: 'bookworms', category: 'analysts', description: 'For those who love books.'}
  {name: 'philosophers', category: 'analysts', description: 'For those interested in philosophy and theories.'}
  {name: 'psychoanalysts', category: 'analysts', description: 'For those interested in psychology, peoplewatching, and human nature.'}
  {name: 'technologists', category:'analysts', description: 'For those who love technology and science.'}
  {name: 'adventurers', category: 'doers', description: 'For those who love new adventures.'}
  {name: 'business professionals', category:'doers', description: 'For those who love what they do and value effectiveness.'}
  {name: 'foodies', category:'doers', description:'For those who love and appreciate the best food.'}
  {name: 'altruists', category:'doers', description: 'For those who love volunteering. causes, and helping others.'}
  {name: 'health and fitness enthusiasts', category:'doers', description: 'For interested in fitness and healthy eating.'}
  {name: 'startup people', category:'doers', description: 'For entrepreneurs and startup people.'}
]

tribe = _defaultTribes[0]
Factory.define('tribe', tribe)

@seedTribes = ()->
  console.log "Seeding tribe data..."
  _.each _defaultTribes, (tribe)-> Meteor.call('createTribe', tribe)
