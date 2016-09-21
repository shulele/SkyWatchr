setup_skywatch_oauth <- function(api_key){
    app <- oauth_app("skywatch", key = api_key, secret = NULL)
    #if (is.null(access_token) || is.null(access_secret)) {
      #token_func = get_twitter_token_via_browser
    #}
    #else {
      #token_func = get_twitter_token_via_sign
    #}
    #twitter_token = token_func(app, access_token, access_secret)
    #assign("oauth_token", twitter_token, envir = oauth_cache)
    #check_twitter_oauth()
  }