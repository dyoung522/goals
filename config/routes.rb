Rails.application.routes.draw do
  devise_for :users

  root 'application#index'

  scope [:api, :v1] do
    resources :users, :defaults => { :format => :json, layout: false }
  end

end
