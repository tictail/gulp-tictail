Q = require 'q'
merge = require 'merge'


module.exports = (req, res) ->
  Q.all res.promises
    .then (results) ->
      context = {}
      for result in results
        context = merge.recursive(context, result)

      for category in context.navigation
        if req.path is category.url
          category.is_current = true
          context.list_page.current_navigation = category
          break
        for subcategory in category.children
          if req.path is subcategory.url
            category.is_current = true
            subcategory.is_current = true
            context.list_page.current_navigation = subcategory
            break

      res.render 'theme', context
    .catch (reason) ->
      console.log reason, reason.stack
      res.status(500)
