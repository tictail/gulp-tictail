module.exports =
  searchForm: ->
    (label, render) ->
      """<form id="tictail_search" class="tictail_form tictail_search">
        <input id="tictail_search_box"
          class="tictail_search_box"
          name="q"
          autocomplete="off"
          type="text"
          title="Search" />
      </form>"""

  facebookLikeButton: (url) ->
    ->
      """<div class="tictail_social_button tictail_facebook_button">
        <div class="fb-like"
          data-href="#{url}"
          data-send="false"
          data-layout="button_count"
          data-width="90"
          data-show-faces="false"></div>
      </div>"""

  twitterTweetButton: (url, text, lang='en') ->
    ->
      """<div class="tictail_social_button tictail_twitter_button">
        <a href="https://twitter.com/share" class="twitter-share-button"
          data-related="tictail"
          data-lang="#{lang}"
          data-url="#{url}"
          data-text="#{text}"
          data-count="none">Tweet</a>
      </div>"""

  transform: (data) ->
    store =
      store_name: data.name
      store_url: data.url
      store_email: 'developers@tictail.com'
      store_description: data.description
      store_blog_url: 'https://medium.com/tictail-makers'
      store_subdomain: data.subdomain
      store_identifier: data.id
      logotype: {}

    if data.logotype
      for size, url of data.logotype[0].sizes
        store.logotype["url-#{size}"] = url

    store.search = module.exports.searchForm

    store.facebook_like_button = module.exports.facebookLikeButton store.store_url

    store.twitter_tweet_button = module.exports.twitterTweetButton store.store_url,
      "Check out #{store.store_name} that I found via @tictail"

    store
