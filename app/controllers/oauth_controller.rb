class OauthController < ApplicationController
  skip_before_action :authenticate_user!

# We are going to use httparty to make server side requests

  def github
    token = HTTParty.post('https://github.com/login/oauth/access_token', {
      query: {
        client_id: ENV["GITHUB_CLIENT_ID"],
        client_secret: ENV["GITHUB_CLIENT_SECRET"],
        code: params[:code]
      },
      headers: { 'Accept' => 'application/json'}
    }).parsed_response

# We need to make a second HTTParty request in order to get back the user's profile.

    profile = HTTParty.get('https://api.github.com/user', {
      query: token,
      headers: { 'User-Agent' => 'HTTParty', 'Accept' => 'application/json' }
    }).parsed_response

    p profile
     user = User.where("email = :email OR github_id = :github_id", email: profile["email"], github_id: profile["id"]).first

# If we don't find a user, we want to create a new user, so underneath this line, we want to add the following.

     user = User.new username: profile["login"], email: [profile["email"]] unless user
     user[:github_id] = profile["id"]
    p user

# errors handlers

    if user.save
      token = Auth.issue({ id: user.id })
      render json: { user: UserSerializer.new(user), token: token }, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
