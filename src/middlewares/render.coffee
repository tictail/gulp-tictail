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
        $('body').append '<iframe
          name="tt_colophon"
          id="tt_colophon"
          src="https://tictail.com/cart/'+context.store_subdomain+'"
          style="
            position: fixed;
            z-index: 9999;
            top: 0;
            right: 0;
            height: 37px;
            overflow: hidden;
            background: none;
            border: 0;
          "></iframe>'
        $('body').append '<script>
          var __ttBaseUrl = "https://tictail.com",
          __ttColophonUrl = "https://tictail.com/cart/'+context.store_subdomain+'",
          __ttSearchUrl = "http://'+context.store_subdomain+'.tictail.com/search",
          __ttAssetsUrl = "//app.ttcdn.co/theme_assets",
          __ttLocaleData = {"": {"domain": "storefront", "locale": "sv", "plural_forms": "nplurals=2; plural=(n != 1);"}, "An unexpected error occurred. Please try again.": [null, "Ett oväntat fel inträffade. Var god försök igen."], "No products found": [null, "Inga produkter hittades"], "Out of stock": [null, "Ej i lager"], "Please enter a valid email address.": [null, "Ange en giltig e-postadress."], "Quantity": [null, "Antal"], "Remove": [null, "Ta bort"], "Searching...": [null, "Söker..."]},
          __ttSubdomain = "'+context.store_subdomain+'",
          __ttAnalyticsId = "UA-000000-01",
          __ttSession = {
            "track": {
              "storefront_utm_medium": null,
              "storefront_utm_content": null,
              "storefront_utm_source": null,
              "storefront_utm_term": null,
              "storefront_utm_campaign": null
            },
            "behaviors": {
              "respect_browser_locale": false
            },
            "cdn": "none",
            "experiments": {}
          };
        </script>
        <script src="//dmb7ixdwya1nh.cloudfront.net/static/js/v1/storefront/json.v-ec33eba9f2.js"></script>
        <script src="//dmb7ixdwya1nh.cloudfront.net/static/js/storefront/mustache.v-b5febf1682.js"></script>
        <script src="//dmb7ixdwya1nh.cloudfront.net/static/js/storefront/store.v-fd121f6f72.js"></script>
        <script>TT.store.domReady();</script>'
        $('body').append '<a
          id="__ttLogo"
          style="
            position: absolute;
            bottom: 10px;
            right: 15px;
          "
          href="https://tictail.com"
          target="_blank"
        ><img
          src="//dmb7ixdwya1nh.cloudfront.net/static/i/storefront/tictail-logo.v-f7194876c2.png"
          alt="Tictail"
          style="
            width: 42px;
            opacity: 0.25;
          "
        ></a>'
        res.send $.html()
    .fail (err) ->
      status = switch err.constructor
        when HTTPError
          err.status
        else
          console.log err
          console.log err.stack
          500

      res.status(status).send("<code>#{status}</code>")
