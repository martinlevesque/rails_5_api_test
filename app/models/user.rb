class User < ApplicationRecord

  # from http://sourcey.com/building-the-prefect-rails-5-api-only-app/
  # Assign an API key on create
  before_create do |user|
    user.token = user.generate_api_key
  end

  # Generate a unique API key
  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless User.exists?(token: token)
    end
  end

end
