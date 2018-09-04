require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def log_in_as(user)
    session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest
  
  # テストユーザーとしてログインする
  def log_in_as(user, password: 'password', remember_me: '0')
    post sessions_path, params: { session: { screen_name: user.screen_name,
                                             password: password,
                                             remember_me: remember_me } }
  end
end
    