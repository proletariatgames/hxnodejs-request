package js.npm.request;

typedef OAuthStep1 = {
  callback: String,
  consumer_key: String,
  consumer_secret: String
}

typedef OAuthStep2 = {
  consumer_key: String,
  consumer_secret: String,
  token: String, // taken from data.oauth_token
  token_secret: String, // taken from data.oauth_token_secret
  verifier: String // taken from data.oauth_verifier
}

typedef OAuthRequest = {
  consumer_key: String,
  consumer_secret: String,
  token: String,
  token_secret: String,
}

abstract OAuthOptions(Dynamic) from OAuthStep1 from OAuthStep2 from OAuthRequest { }
