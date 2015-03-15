# @SharedSchemas = {}

# SharedSchemas.Geojson = new SimpleSchema
#   type:
#     type: String
#     allowedValues: ['Feature']
#   geometry: GeometrySchema

# GeometrySchema = new SimpleSchema
#   type:
#     type: String
#     allowedValues: ['Point']
#   coordinates:
#     type: [Number]
#     decimal: true
#     minCount: 2
#     maxCount: 2
#   properties: 
#     type: Object
#     optional: true

@dbCallback = (err, status)->
  if err
    throw err
    return err
  else
    return status