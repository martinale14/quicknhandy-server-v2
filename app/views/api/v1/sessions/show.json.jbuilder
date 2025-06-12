json.token api_token || session.api_token.token
json.user do
  json.partial! "api/v1/users/user", user: user
end
