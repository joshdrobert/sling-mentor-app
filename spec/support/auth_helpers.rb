# spec/support/auth_helpers.rb

module AuthHelpers
  # Helper method to simulate a logged in user for controller tests
  def login_as(user)
    allow(controller).to receive(:current_user).and_return(user)
  end

  # Helper method for request/feature specs (if needed)
  def login_as_user(user)
    # Adjust this based on your actual authentication system
    # For Devise:
    # sign_in user

    # For custom auth systems, you might need to:
    # post '/login', params: { email: user.email, password: 'password' }
  end
end

RSpec.configure do |config|
  config.include AuthHelpers, type: :controller
  config.include AuthHelpers, type: :request
end
