@handleResponse = (err, res)->
  if err?.message
    throwError(err.message)
  else
    Alerts.set('success', 'Success! Boo yah.')