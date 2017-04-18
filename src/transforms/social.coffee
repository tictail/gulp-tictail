module.exports =
  client_template_block: ->
    (text, render) ->
      """
      <div class="tictail_client_template_block" style="display: none;">{{=<% %>=}}
      #{render(value)}
      <%={{ }}=%></div>
      """

  instagram_recent_media: ->
    (text, render) ->
      """
      <div class="tictail_instagram_recent_media">
      #{render(text)}
      </div>
      """

  instagram_recent_media_default_block: ->
    # We're cheating a bit here and doing the work of {{#client_template_block}} inline.
    """
    <div class="tictail_client_template_block" style="display: none;">
        <section class="tictail_instagram_section">
            <header class="tictail_instagram_header">
              <h4 class="tictail_instagram_title">{{#lang}}Instagram posts{{/lang}}</h4>
              <a class="tictail_instagram_user_url"
                href="{{#user}}{{url}}{{/user}}">@{{#user}}{{username}}{{/user}}</a>
            </header>
            <ol class="tictail_instagram_posts">
            {{#posts}}
                <li class="tictail_instagram_post">
                    <a href="{{url}}">
                        <div class="tictail_instagram_post_item">
                            <div class="tictail_instagram_image_spacer"></div>
                            <div class="tictail_instagram_image_wrapper"
                                 style="background-image: url('{{#images}}{{#low_resolution}}{{url}}{{/low_resolution}}{{/images}}'); background-repeat: no-repeat;">
                                <img
                                    class="tictail_instagram_image"
                                    src="{{#images}}{{#low_resolution}}{{url}}{{/low_resolution}}{{/images}}"
                                    alt="{{#caption}}{{text}}{{/caption}}" >
                            </div>
                        </div>
                    </a>
                </li>
            {{/posts}}
            </ol>
        </section>
    </div>
    """

  transform: (data) ->
    social =
      client_template_block: module.exports.client_template_block

    if Object.keys(data.user).length > 0
      social.instagram_username = data.user.username
      social.instagram_recent_media = module.exports.instagram_recent_media
      social.instagram_recent_media_default_block = module.exports.instagram_recent_media_default_block

    social
