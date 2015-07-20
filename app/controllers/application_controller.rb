class ApplicationController < ActionController::API

  include ActionController::ImplicitRender

  acts_as_token_authentication_handler_for User, fallback_to_devise: false
  before_action :authenticate_api_user!

  respond_to :json


  def auth_preflight
    head 200
  end

end
