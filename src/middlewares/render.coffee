Q = require 'q'
merge = require 'merge'
HTTPError = require 'node-http-error'
cheerio = require 'cheerio'


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

      res.render 'theme', context, (err, html) ->
        $ = cheerio.load html
        context.partials = {} # fixes the context modifications made by consolidate.js
        req.app.render 'colophon', context, (err, colophon) ->
          $('body').append colophon
          res.send $.html()
    .fail (err) ->
      status = switch err.constructor
        when HTTPError
          err.status
        else
          console.log err
          console.log err.stack
          500

      res.status(status).send "<code>#{status}</code>"
