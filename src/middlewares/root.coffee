Q = require 'q'


module.exports = (req, res, next) ->
  res.promises.push(
    Q.resolve(
      list_page:
        on_index: true
        no_current_navigation: true
    )
  )

  next()
