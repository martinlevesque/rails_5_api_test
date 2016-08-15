class AuthenticatedServiceController < ActionController::API
  before_filter :check_token_valid?

  private

  def check_token_valid?
    token = params[:token]

    return redirect_to "/" if User.where(token: token).count == 0
  end

end
