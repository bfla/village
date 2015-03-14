
@dbCallback = (err, status)->
  if err
    throw err
    return err
  else
    return status