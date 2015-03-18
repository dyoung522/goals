class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user! #unless Rails.env.test?

  def index
    @user = current_user
    gon.rabl template: 'app/views/users/show.rabl', as: 'current_user'
  end
end
