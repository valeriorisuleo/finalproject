class ApplicationController < ActionController::API

# This is a method that runs before any other controller action.
# It checks if there is a valid user
  before_action :authenticate_user!

# return the error
  def authenticate_user!
    render json: { errors: "Unauthorized"}, status: 401 unless user_signed_in?
  end

# check if there is a signed in user:
  def user_signed_in?
    !!current_user
  end

# 4. we need a method that finds the user, we're going to call this current_user and it might be used in other files so this one can't be private.
  def current_user
    @current_user ||= User.find(decoded_token[:id]) if id_found?
  rescue
    nil
  end

# 3. Then we need to  checks if we have found a user id inside the decoded token:
  private
  def id_found?
    token && decoded_token && decoded_token[:id]
  end

# 2. We need to decode that token with our Auth class
  def decoded_token
    @decoded_token ||= Auth.decode(token) if token
  end

# 1. We need a method to extract the JWT token from the request
  def token
    @token ||= if request.headers['Authorization'].present?
      request.headers['Authorization'].split.last
    end
  end
end
